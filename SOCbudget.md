---
title: Historical Soil Organic Carbon Budget
journal: "gc"
author:
  - given_name: Kristine
    surname: Karstens
    affiliation: 1
    email: kristine.karstenst@pik-potsdam.de
    corresponding: true
  - given_name: Benjamin Leon
    surname: Bodirsky
    affiliation: 1
  - given_name: Alexander
    surname: Popp
    affiliation: 1
affiliation:
  - code: 1
    address: Potsdam-Institut of Climate Impacts Research, Potsdam, Germany
abstract: | 
 SOC one of larges c sinks on earth (3 times larger biospehre pool). Agricultural management leads to a depletion of soil organic crabon. However
 this depletion of soil organic carbon (SOC) pools are so far not well represented in global assessments of historic carbon emissions. While SOC
 models often represent well the biochemical processes that lead to the accumulation and decay of SOC, the management decisions driving these 
 biophysical processes are still little investigated.
 Here we create a spatial explicit data set for crop residue and manure management on cropland based on global historic production (FAOSTAT) and 
 land-use (LUH2) data and combine it with the IPCC Tier 2 approach to create a half-degree resolution soil organic carbon budget on mineral soils.
 We estimate that due to arable farming soils have lost over (?) GtOC of which (??) GtOC have been released within the period 1990-2010.
 Tier 2 IPCC methodolgy estimates higher soil organic carbon losses than Tier 1 methods, which may origin from … . We also find that SOC is very 
 sensity to management decision such as residue recycling indicating the nessessity to incorporated better management data in soil models. 
bibliography: SOCbudget.bib
running:
  title: R Markdown Template for Copernicus
  author: Nüst et al.
competinginterests: |
  The authors declare no competing interests.
# OPTIONAL:
algorithms: true
# See https://publications.copernicus.org/for_authors/licence_and_copyright.html, normally used for transferring the copyright, if needed.
copyrightstatement: |
  The author's copyright for this publication is transferred to institution/company.
availability:
  codedata: |
    use this to add a statement when having data sets and software code available
authorcontribution: |
  Karstens wrote code and paper build on work of Bodirsky. Bodirsky and Popp revised paper.
disclaimer: |
  We like Copernicus.
acknowledgements: |
  Thanks to the rticles contributors!
appendix: |
  \section{Figures and tables in appendices}
  \subsection{Option 1}
  If you sorted all figures and tables into the sections of the text, please also sort the appendix figures and appendix tables into the respective appendix sections.
  They will be correctly named automatically.
  \subsection{Option 2}
  If you put all figures after the reference list, please insert appendix tables and figures after the normal tables and figures.
  
  `\appendixfigures` needs to be added in front of appendix figures
  `\appendixtables` needs to be added in front of appendix tables
  
  Please add `\clearpage` between each table and/or figure. Further guidelines on figures and tables can be found below.
  Regarding figures and tables in appendices, the following two options are possible depending on your general handling of figures and tables in the manuscript environment:
  To rename them correctly to A1, A2, etc., please add the following commands in front of them:
output:
  md_document:
    variant: markdown_github
  rticles::copernicus_article: default
  bookdown::pdf_book:
    base_format: rticles::copernicus_article # for using bookdown features like \@ref()
---


\introduction

Introduction text goes here.
You can change the name of the section if neccessary using `\introduction[modified heading]`.

The following settings can or must be configured in the header of this file and are bespoke for Copernicus manuscripts:
  
  - The `journal` you are submitting to using the official abbreviation. 
  
  - You can use the function `rticles::copernicus_journal_abbreviations(name = '...')` to search the existing journals.


# Method (50)

<!-- Soil carbon dynamics are modeled using a yearly based SOC model and carbon input and management data. -->

## Carbon Budget (50)

Based on the IPCC guidelines [@ipcc_2019_2019] for soil organic carbon stocks, we combining approaches to estimate SOC stocks by weighting inflows via dead plant material (see \@ref(sec:carboninputs)) against outflows through SOC decay (see \@ref(sec:tier2)). Carbon displacement via leaching and erosion is neglected for this budget. A simple approach based o the Tier 1 method of the older IPCC guidelines vol 4. (@ipcc_2006_2006) on stock change factors is used to cross validated results \@ref(sec:tier1) 

### Carbon Inputs to the Soil {#sec:carboninputs}

Carbon inputs estimations are based on the land use type. Whereas cropland inputs are mainly formed by disaggregated country statistics on residue, dead below ground and cover crop biomass, pasture and natural vegetation inputs are estimate via modelled annual litterfall rates. For the former we use several data sets and rule based approaches to reflect management decisions, which are specified in \@ref(sec:agrimanagement). The later are based on LPJmL4 estimations for natural vegetation (see Sybilles paper) and grassland (see Susannes Paper).  

### Soil Carbon turnover following (new) Tier 2 method (300) {#sec:tier2}




Yearly turnover between three different SOC pools for the topsoil is model using global parameters.

### Soil Carbon turnover following Tier 1 (150) {#sec:tier1}

Following the tier 1 approach of the IPCC guidelines 2006 [@ipcc_2006_2006], stocks are estimated via stock change factors reflecting , in- and outflows are not calculated explicitly

Stock changes are calculated using simple change factors on the SOC pools for the topsoil.




## Agricultural management	(50) {#sec:agrimanagement}
We combine data sets to estimate agricultural flows and management decisions on cropland.

### Landuse and Landuse Change (150)
We use LUH2v2 data for major Landuse types and their transition and fit cropspecific areas to country scale FAO data. 

### Crop Production and Residues	(300)
FAO Production values are combined with Feed estimations from [Isabelles Paper] and rule based demand shares. LPJmL yield and LUH landuse patterns are used to scale down to half-degree.

### Livestock Distribution and Manure Excretion	(300)
Based on [Gridded Livestock of the world] we use rule based asumption to estimate livestock and manure distribution on the globe. Animal waste system shares are used as is [Bodirsky].

### Irrigation (100)
Simple growing period calculations together with irrigation shares of LUH2v2 are use to estimate water effects on decay rates.

### Tillage (100)
Tillage data sets of [Vera, others] together with rules are used to drive tillage effect on decay rates.




# Content section with citations

See the [R Markdown docs for bibliographies and citations](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html).

Copernicus supports biblatex and a sample bibliography is in file `sample.bib`.
Read [], and [see ].

# Content section with R code chunks



You should always use `echo = FALSE` on R Markdown code blocks as they add formatting and styling not desired by Copernicus.
The hidden workflow results in 42.

You can add verbatim code snippets without extra styles by using ` ``` ` without additional instructions.

```
sum <- 1 + 41
```

# Content section with list

If you want to insert a list, you must

- leave

- empty lines

- between each list item



# Examples from the official template

## FIGURES

When figures and tables are placed at the end of the MS (article in one-column style), please add \clearpage between bibliography and first table and/or figure as well as between each table and/or figure.

## FIGURES

When figures and tables are placed at the end of the MS (article in one-column style), please add \clearpage between bibliography and first table and/or figure as well as between each table and/or figure.

### ONE-COLUMN FIGURES

Include a 12cm width figure of Nikolaus Copernicus from [Wikipedia](https://en.wikipedia.org/wiki/File:Nikolaus_Kopernikus.jpg) with caption using R Markdown.

### TWO-COLUMN FIGURES

You can also include a larger figure.

## TABLES

You can ad \LaTeX table in an R Markdown document to meet the template requirements.

### ONE-COLUMN TABLE

\begin{table}[t]
\caption{TEXT}
\begin{tabular}{l c r}
\tophline

a & b & c \\
\middlehline
1 & 2 & 3 \\

\bottomhline
\end{tabular}
\belowtable{Table Footnotes}
\end{table}

### TWO-COLUMN TABLE

\begin{table*}[t]
\caption{TEXT}
\begin{tabular}{l c r}
\tophline

a & b & c \\
\middlehline
1 & 2 & 3 \\

\bottomhline
\end{tabular}
\belowtable{Table footnotes}
\end{table*}

## MATHEMATICAL EXPRESSIONS

All papers typeset by Copernicus Publications follow the math typesetting regulations given by the IUPAC Green Book (IUPAC: Quantities, Units and Symbols in Physical Chemistry, 2nd Edn., Blackwell Science, available at: http://old.iupac.org/publications/books/gbook/green_book_2ed.pdf, 1993).

Physical quantities/variables are typeset in italic font (t for time, T for Temperature)

Indices which are not defined are typeset in italic font (x, y, z, a, b, c)

Items/objects which are defined are typeset in roman font (Car A, Car B)

Descriptions/specifications which are defined by itself are typeset in roman font (abs, rel, ref, tot, net, ice)

Abbreviations from 2 letters are typeset in roman font (RH, LAI)

Vectors are identified in bold italic font using \vec{x}

Matrices are identified in bold roman font

Multiplication signs are typeset using the LaTeX commands `\times` (for vector products, grids, and exponential notations) or `\cdot`

The character * should not be applied as mutliplication sign

## ALGORITHM
  
  If you want to use algorithms, you can either enable the required packages in the header (the default, see `algorithms: true`), or make sure yourself that the \LaTeX packages `algorithms` and `algorithmicx` are installed so that `algorithm.sty` respectively `algorithmic.sty` can be loaded by the Copernicus template.
Copernicus staff will remove all undesirable packages from your LaTeX source code, so please stick to using the header option, which only adds the two acceptable packages.

\begin{algorithm}
\caption{Algorithm Caption}
\label{a1}
\begin{algorithmic}
\STATE $i\gets 10$
  \IF {$i\geq 5$} 
\STATE $i\gets i-1$
  \ELSE
\IF {$i\leq 3$}
\STATE $i\gets i+2$
  \ENDIF
\ENDIF
\end{algorithmic}
\end{algorithm}



\conclusions

The conclusion goes here.
You can modify the section name with  `\conclusions[modified heading if necessary]`.



