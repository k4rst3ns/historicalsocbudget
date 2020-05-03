
nitrogen_sankey<-function(x,svg_in,svg_out="sankey.svg",scaling=1){
  require("xml2")
  svg<-read_xml(svg_in)
  svg2<-xml_find_all(svg, "//svg:g")
  paths<-xml_find_all(svg2, ".//svg:path")
  texts<-xml_find_all(svg2, ".//svg:text")
  
  mapping<-toolMappingFile(type = "sectoral",name = "svg_nitrogen.csv",readcsv = TRUE)
  

  
  settext<-function(id,value){
    text=texts[which(xml_attr(texts,attr="id")==id)]
    if(length(text)!=1){warning(paste0("text id ",id," does not exist or exists multiple"))}
    xml_text(text)<-value
  }
  
  setstyle<-function(id,value,unit="px",style="stroke-width"){
    path=paths[which(xml_attr(paths,attr="id")==id)]
    if(length(path)!=1){stop(paste0("id ",id," does not exist or exists multiple"))}
    text = xml_attr(path,attr="style")
    text=strsplit(text,split = ";")[[1]]
    pos<-which(substring(text,first = 0,last=nchar(style))==style)
    text[pos]<-paste0(style,":",value,unit)
    text<-paste(text,collapse=";")
    xml_attr(path,"style")<-text
  }
  
  numformat <- function(val) {
    if((val<0.95)&(val>0.05)) {
      return(sub("^(-?)0.", "\\1.", sprintf("%.1f", val)) )
    } else if(val<=0.05) {
      return(" ")
    } else{
      return(sprintf("%.0f", val) )  
    }
  }
  
  
  
  ## add year and region to header
  
  region<-getRegions(x)
  if (length(region)==249){
    region="World"
    settext("region",paste0("of the world"))
  } else if (length(region)==1){
    mapping2<-toolMappingFile(type = "regional",name = "regionmappingMAgPIE.csv",readcsv = TRUE)
    region<-mapping2[which(mapping2[,2]==region),1]
    settext("region",paste0("of ",region))
  } else {region <- "aggregate world region"}
  

  settext("year",paste0("in the year ",getYears(x,as.integer = TRUE)))
  
  
  #find unique flows that are non-zero
  objects<-unique(mapping[,2])
  objects<-objects[!objects%in%""]
  
  # check whether flows exist in X
  tmp<-which(!mapping[which(mapping[,2]%in%objects),1]%in%getNames(x,dim=3))
  if(length(tmp>0)){
    warning(paste0(c("The following indicators are not part of x and will not be changed: ",mapping[which(mapping[,2]%in%objects),1][tmp]),collapse=" "))
  }
  
  objects<-mapping[which(mapping[,2]%in%objects),2][which(mapping[which(mapping[,2]%in%objects),1]%in%getNames(x,dim=3))]
  
  for(object in objects) {
    tmp<-x[,,mapping[which(mapping[,2]==object),1]]
    if (length(getNames(tmp,dim=1))>1){stop(paste0("only one scenario and one model allowed. Problematic for ",object,": ",getNames(tmp,dim=1)))}
    if (length(getNames(tmp,dim=2))>1){stop(paste0("only one scenario and one model allowed. Problematic for ",object,": ",getNames(tmp,dim=2)))}
    
    #adjust width of arrows
    
    setstyle(id=object,
             value=sum(tmp)*scaling,
             unit="px",style="stroke-width")

    #modify numbers
    
    settext(id=paste0("text_",object),
             value=numformat(sum(tmp)))
    
  }

  write_xml(x = svg,file = svg_out)
}
library(luplot)
library(mrvalidation)
setConfig(forcecache=T)
setwd("C:/Users/bodirsky/Desktop/articles/nitrogen budgets article")

aggregate=FALSE

x1<-calcOutput("ValidNitrogenBudgetCropland",aggregate = aggregate)
x1[,,"Resources|Nitrogen|Cropland Budget|Balance|+|Soil Organic Matter Loss (Mt Nr/yr)"]<- -x1[,,"Resources|Nitrogen|Cropland Budget|Balance|+|Soil Organic Matter Loss (Mt Nr/yr)" ]
x2<-calcOutput("ValidDemand",nutrient="nr",aggregate = aggregate)
x3<-calcOutput("ValidProduction",nutrient="nr",aggregate = aggregate)
x4<-(dimSums(x1[,,c("Resources|Nitrogen|Cropland Budget|Withdrawals|+|Harvested Crops (Mt Nr/yr)",
                            "Resources|Nitrogen|Cropland Budget|Withdrawals|+|Aboveground Crop Residues (Mt Nr/yr)",
                            "Resources|Nitrogen|Cropland Budget|Withdrawals|+|Belowground Crop Residues (Mt Nr/yr)")],dim=c(3.3))
             -dimSums(x1[,,c("Resources|Nitrogen|Cropland Budget|Inputs|+|Seed (Mt Nr/yr)",
                             "Resources|Nitrogen|Cropland Budget|Inputs|+|Biological Fixation Symbiotic Crops (Mt Nr/yr)"
             )],dim=c(3.3)))      
x4<-add_dimension(x4,dim = 3.3,nm = "Resources|Nitrogen|Cropland plant uptake (Mt Nr/yr)")
x6<-x5<-calcOutput("ValidTrade",nutrient="nr", aggregate = aggregate)
getNames(x5,dim=3)<-sub(getNames(x5,dim=3),pattern = "Net-Trade",replacement = "Exports") 
getNames(x6,dim=3)<-sub(getNames(x6,dim=3),pattern = "Net-Trade",replacement = "Imports")
warning("Net-Trade used. Should we use rather total trade? Yes, i think so.")
x5[x5<0] <- 0 
x6[x6>0] <- 0
x6 <- -x6
x7  <- calcOutput("ValidNitrogenAtmosphericDeposition",aggregate = aggregate,datasource="Nsurplus2")
x8 <- calcOutput("ValidNitrogenBudgetPlanet",aggregate = aggregate)
x9<-  calcOutput("ValidFeed",nutrient="nr",aggregate = aggregate)
x10<-calcOutput("ValidManure",aggregate = aggregate)
x11<-calcOutput("ValidNitrogenPollution",aggregate = aggregate,datasource="Nsurplus2")
x12<-a<-calcOutput("ValidNutrientBudgetLivestock",aggregate = aggregate)
x13<-calcOutput("ValidNutrientBudgetFoodWasteAndSewage",aggregate = aggregate)
x14<-calcOutput("ValidNutrientBudgetFoodProcessing",aggregate = aggregate,detail=FALSE,nutrient="nr")
x15<-calcOutput("ValidNutrientWasteBudget",aggregate =aggregate)
x16<-setNames(dimSums(x11[,,c(
                 "Emissions|direct N2O-N emissions|Agriculture|+|Animal waste management (Mt Nr/yr)",
                 "Emissions|NH3-N|Agriculture|+|Animal waste management (Mt Nr/yr)",
                 "Emissions|NO2-N|Agriculture|+|Animal waste management (Mt Nr/yr)",
                 "Emissions|NO3-N|Agriculture|+|Animal waste management (Mt Nr/yr)",
                 "Emissions|N2-N|Agriculture|+|Animal waste management (Mt Nr/yr)"
                 )],dim=3),"Bodirsky.historical.Emissions|N|Agriculture|+|Animal waste management (Mt Nr/yr)")
x17<-calcOutput("ValidNitrogenBudgetNonagland",aggregate = aggregate)
x18<-calcOutput("ValidNitrogenBudgetPasture",aggregate = aggregate)
x19<-calcOutput("ValidNitrogenBudgetOcean",aggregate = aggregate)
#x20<-calcOutput("ValidNutrientBudgetSewage",nutrient="nr",aggregate = aggregate) # duplicate

x=y=mbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19)
z=mbind(x1,x2,x3,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x17,x18,x19)
write.report2(z,file="reporting_template_sept2019.mif")

'y[,,]<-0
y[,,c("Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation (Mt Nr/yr)","Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Other Land (Mt Nr/yr)")]<-58
y[,,"Emissions|NO3-N|Natural and indirect emissions|+|Non-agricultural soil emissions"]<-35
y[,,"Emissions|direct N2O-N emissions|Natural and indirect emissions|+|Inland freshwater bodies"]<-0.4
y[,,"Emissions|N2-N|Natural and indirect emissions|+|Inland freshwater bodies"]<-10
y[,,"Resources|Nitrogen|Ocean Budget|River discharge (Mt Nr)"]<-24
y[,,c("Emissions|NH3-N|+|Landuse Change and Biomass Combustion","Emissions|NO2-N|+|Landuse Change and Biomass Combustion")]<-1.6
y[,,"Emissions|NH3-N|Natural and indirect emissions|+|Non-agricultural soil emissions"]<-8.9
y[,,""]<-'
  

setwd("C:/Users/bodirsky/Desktop/articles/nitrogen budgets article")
nitrogen_sankey(x=x[,"y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_GLO_2010.svg",  scaling=1)
nitrogen_sankey(x=x[,"y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_GLO_1965.svg",  scaling=1)

nitrogen_sankey(x=x["VNM","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_VNM_1965.svg",  scaling=10)
nitrogen_sankey(x=x["VNM","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_VNM_2010.svg",  scaling=100)

nitrogen_sankey(x=x["DNK","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_DNK_1965.svg",  scaling=10)
nitrogen_sankey(x=x["DNK","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_DNK_2010.svg",  scaling=100)


nitrogen_sankey(x=x["IND","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_IND_1965.svg",  scaling=10)
nitrogen_sankey(x=x["IND","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_IND_2010.svg",  scaling=10)

nitrogen_sankey(x=x["NLD","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_NLD_1965.svg",  scaling=100)
nitrogen_sankey(x=x["NLD","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_NLD_2010.svg",  scaling=100)

nitrogen_sankey(x=x["USA","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_USA_1965.svg",  scaling=10)
nitrogen_sankey(x=x["USA","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_USA_2010.svg",  scaling=10)

nitrogen_sankey(x=x["DEU","y1965",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_DEU_1965.svg",  scaling=0.05)
nitrogen_sankey(x=x["DEU","y2010",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_DEU_2010.svg",  scaling=0.05)

nitrogen_sankey(x=x["CHN","y1965",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_CHN_1965.svg",  scaling=10)
nitrogen_sankey(x=x["CHN","y2010",],svg_in = "sankey_original14g.svg",svg_out="sankey_nitrogen_CHN_2010.svg",  scaling=10)

nitrogen_sankey(x=x["CHE","y1965",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_CHE_1965.svg",  scaling=1)
nitrogen_sankey(x=x["CHE","y2010",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_CHE_2010.svg",  scaling=1)

nitrogen_sankey(x=x["SWZ","y1965",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_SWZ_1965.svg",  scaling=6.8)
nitrogen_sankey(x=x["SWZ","y2010",]*1000,svg_in = "sankey_original14g_switzerland.svg",svg_out="sankey_nitrogen_SWZ_2010.svg",  scaling=6.8)



#nitrogen_sankey(x=x[,"y2000",],svg_in = "sankey_original14f.svg",svg_out="sankey_nitrogen_natural.svg",  scaling=1)

#development over time:
x[,,c(

  "Resources|Nitrogen|Cropland Budget|Soil Organic Matter Loss (Mt Nr)"
  "Resources|Nitrogen|Cropland Budget|Fertilizer (Mt Nr)"
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Industry (Mt Nr/yr)"                                                 
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Transport (Mt Nr/yr)" 
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Landuse Change and Biomass Combustion (Mt Nr/yr)" 
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation (Mt Nr/yr)"                          
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Cropland (Mt Nr/yr)"               
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Pastures and Rangelands (Mt Nr/yr)"
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Managed Forest (Mt Nr/yr)"         
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Primary Forest (Mt Nr/yr)"         
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Secondary Forest (Mt Nr/yr)"       
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Urban Area (Mt Nr/yr)"             
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Terrestrial Biological Fixation|+|Other Land (Mt Nr/yr)"             
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Fertilizer (Mt Nr/yr)"                                               
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Soil Organic Matter Loss (Mt Nr/yr)"                                 
  "Resources|Nitrogen|Planetary Budget|Fixation and Release|Nitrogen fixation in oceans (Mt Nr/yr)"
  
)]
















### FOR INMS

library(mrvalidation)
setConfig(forcecache=T)
setwd("C:/Users/bodirsky/Desktop/nitrogen budgets article")

aggregate=TRUE

x1<-calcOutput("ValidNitrogenBudgetCropland",aggregate = aggregate)
x2<-calcOutput("ValidDemand",nutrient="nr",aggregate = aggregate,detail=FALSE)
x3<-calcOutput("ValidProduction",nutrient="nr",aggregate = aggregate,detail=FALSE)
x6<-x5<-calcOutput("ValidTrade",nutrient="nr", aggregate = aggregate)
getNames(x5,dim=3)<-sub(getNames(x5,dim=3),pattern = "Net-Trade",replacement = "Exports")
getNames(x6,dim=3)<-sub(getNames(x6,dim=3),pattern = "Net-Trade",replacement = "Imports")
x5[x5<0] <- 0 
x6[x6>0] <- 0
x6 <- -x6
x7  <- calcOutput("ValidNitrogenAtmosphericDeposition",aggregate = aggregate,datasource="Nsurplus2")
x8 <- calcOutput("ValidNitrogenBudgetPlanet",aggregate = aggregate)
x9<-  calcOutput("ValidFeed",nutrient="nr",aggregate = aggregate,detail=FALSE)
x10<-calcOutput("ValidManure",aggregate = aggregate)
x11<-calcOutput("ValidNitrogenPollution",aggregate = aggregate,datasource="Nsurplus2")
x12<-calcOutput("ValidNutrientBudgetLivestock",aggregate = aggregate)
x13<-calcOutput("ValidNutrientBudgetFoodWasteAndSewage",aggregate = aggregate)
x15<-calcOutput("ValidNutrientWasteBudget",aggregate =aggregate)
x17<-calcOutput("ValidNitrogenBudgetNonagland",aggregate = aggregate)
x18<-calcOutput("ValidNitrogenBudgetPasture",aggregate = aggregate)
#x20<-calcOutput("ValidNutrientBudgetSewage",nutrient="nr",aggregate = aggregate) # duplicate

z=mbind(x1,x2,x3,x5,x6,x7,x8,x9,x10,x11,x12,x13,x15,x17,x18)
write.report2(z,file="reporting_template.mif")


