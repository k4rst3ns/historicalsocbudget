#' toolFlowFigure
#'
#' Create a flow figure out of data, mapping and proxy pattern
#'
#' @param data
#' @param proxy
#' @param mapping
#' @param scaling
#'
#' @return file path to svg
#' @author Benjamin Leon Bodirsky, Kristine Karstens
#'
#' @importFrom xml2 read_xml xml_find_all
#' @export

toolFlowFigure <- function(data, proxy, mapping, scaling=1){

  proxy <- "/home/kristine/WORK/Paper/historicalsocbudget/FlowFigure/sankey_nitrogen_CHN_2010.svg"

  svg      <- read_xml(proxy)
  groups   <- xml_find_all(svg, "//svg:g")
  paths    <- xml_find_all(groups, ".//svg:path")
  texts    <- xml_find_all(groups, ".//svg:text")

  mapping <- toolGetMapping(where = "socbudet", name = mapping)



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

