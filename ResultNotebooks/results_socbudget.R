---
title: "First SOC budget analysis"
output: html_notebook
---

  

```{r load data}
library(moinput)
library(mrvalidation)
library(socbudget)

setConfig(cachefolder = "/home/kristine/WORK/R libraries/rd3mod_inputdata/cache/rev4.18.cellpanda/", forcecache = TRUE)
setConfig(sourcefolder = "/home/kristine/mnt/rd3mod/inputdata/sources/")

SoilCarbon <- calcOutput("CarbonBudget", aggregate = FALSE)
Landuse    <- calcOutput("Landuse",      aggregate=FALSE)

```

Calculate global carbon stocks

```{r Carbon Stock (cell iso reg glo)}

SOCStock     <- dimSums(dimSums(SoilCarbon, dim=3.2)* Landuse, dim=3)
glo_SOCStock <- dimSums(SOCStock, dim=1) 
cell2iso     <- toolGetMapping("CountryToCellMapping.csv", type = "cell")
iso_SOCStock <- toolCountryFill(toolAggregate(SOCStock, rel=cell2iso, from="celliso", to="iso", dim=1), fill=0)
iso2reg      <- toolMappingFile("regional",getConfig("regionmapping"),readcsv = TRUE)
reg_SOCStock <- toolAggregate(iso_SOCStock, rel=iso2reg, from="CountryCode", to="RegionCode")

```

Load validation data:

```{r Validation Stocks}

  LPJ_IPCC   <- calcOutput("ValidCarbonStocks", datasource = "LPJ_IPCC2006", aggregate="REG+GLO", try=TRUE)
  LPJ_rev21  <- calcOutput("ValidCarbonStocks", datasource = "LPJmL_rev21", aggregate="REG+GLO", try=TRUE)
  LPJ_car    <- calcOutput("ValidCarbonStocks", datasource = "LPJmLCarbon", aggregate="REG+GLO", try=TRUE)
  WISE       <- calcOutput("ValidCarbonStocks", datasource = "WISE", aggregate="REG+GLO", try=TRUE)
  GSOC       <- calcOutput("ValidCarbonStocks", datasource = "GSOC", aggregate="REG+GLO", try=TRUE)
  SoilGrids  <- calcOutput("ValidCarbonStocks", datasource = "SoilGrids", aggregate="REG+GLO", try=TRUE)
  
```

Plot  

```{r plot stocks}

plot(getYears(glo_SOCStock, as.integer=TRUE), glo_SOCStock, type="l", col="red", ylim=c(400000,1300000))
lines(getYears(LPJ_IPCC, as.integer = TRUE), LPJ_IPCC["GLO",,1], type="l", col="green")
lines(getYears(LPJ_car, as.integer = TRUE), LPJ_car["GLO",,], type="l", col="darkgreen")
lines(getYears(LPJ_rev21, as.integer = TRUE), LPJ_rev21["GLO",,2], type="l", col="lightgreen")
lines(getYears(WISE, as.integer = TRUE), WISE["GLO",,], type="l", col="brown")
lines(getYears(SoilGrids, as.integer = TRUE), SoilGrids["GLO",,], type="l", col="blue")
lines(getYears(GSOC, as.integer = TRUE), GSOC["GLO",,], type="l", col="pink")
```


```{r Validation Densities}
    cell_GSOC      <- readSource("GSOC",  convert="onlycorrect")
    cell_WISE      <- readSource("WISE",  convert="onlycorrect")
    cell_SoilGrids <- readSource("SoilGrids",  convert="onlycorrect")
  
```
```{r plot density maps}



```

