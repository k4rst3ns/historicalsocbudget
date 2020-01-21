Introduction text goes here. You can change the name of the section if neccessary using `\introduction[modified heading]`.

The following settings can or must be configured in the header of this file and are bespoke for Copernicus manuscripts:

-   The `journal` you are submitting to using the official abbreviation.

-   You can use the function `rticles::copernicus_journal_abbreviations(name = '...')` to search the existing journals.

Method (50)
===========

<!-- Soil carbon dynamics are modeled using a yearly based SOC model and carbon input and management data. -->
Carbon Budget (50)
------------------

Based on the IPCC guidelines (IPCC 2019) for soil organic carbon stocks, we combining approaches to estimate SOC stocks by weighting inflows via dead plant material (see @ref(sec:carboninputs)) against outflows through SOC decay (see @ref(sec:tier2)). Carbon displacement via leaching and erosion is neglected for this budget. A simple approach based o the Tier 1 method of the older IPCC guidelines vol 4. (IPCC (2006)) on stock change factors is used to cross validated results @ref(sec:tier1)

### Carbon Inputs to the Soil

Carbon inputs estimations are based on the land use type. Whereas cropland inputs are mainly formed by disaggregated country statistics on residue, dead below ground and cover crop biomass, pasture and natural vegetation inputs are estimate via modelled annual litterfall rates. For the former we use several data sets and rule based approaches to reflect management decisions, which are specified in @ref(sec:agrimanagement). The later are based on LPJmL4 estimations for natural vegetation (see Sybilles paper) and grassland (see Susannes Paper).

### Soil Carbon turnover following (new) Tier 2 method (300)

Yearly turnover between three different SOC pools for the topsoil is model using global parameters.

### Soil Carbon turnover following Tier 1 (150)

Following the tier 1 approach of the IPCC guidelines 2006 (IPCC 2006), stocks are estimated via stock change factors reflecting , in- and outflows are not calculated explicitly

Stock changes are calculated using simple change factors on the SOC pools for the topsoil.

Agricultural management (50)
----------------------------

We combine data sets to estimate agricultural flows and management decisions on cropland.

### Landuse and Landuse Change (150)

We use LUH2v2 data for major Landuse types and their transition and fit cropspecific areas to country scale FAO data.

### Crop Production and Residues (300)

FAO Production values are combined with Feed estimations from \[Isabelles Paper\] and rule based demand shares. LPJmL yield and LUH landuse patterns are used to scale down to half-degree.

### Livestock Distribution and Manure Excretion (300)

Based on \[Gridded Livestock of the world\] we use rule based asumption to estimate livestock and manure distribution on the globe. Animal waste system shares are used as is \[Bodirsky\].

### Irrigation (100)

Simple growing period calculations together with irrigation shares of LUH2v2 are use to estimate water effects on decay rates.

### Tillage (100)

Tillage data sets of \[Vera, others\] together with rules are used to drive tillage effect on decay rates.

Content section with citations
==============================

See the [R Markdown docs for bibliographies and citations](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html).

Copernicus supports biblatex and a sample bibliography is in file `sample.bib`. Read \[\], and \[see \].

Content section with R code chunks
==================================

You should always use `echo = FALSE` on R Markdown code blocks as they add formatting and styling not desired by Copernicus. The hidden workflow results in 42.

You can add verbatim code snippets without extra styles by using ```` ``` ```` without additional instructions.

    sum <- 1 + 41

Content section with list
=========================

If you want to insert a list, you must

-   leave

-   empty lines

-   between each list item

Examples from the official template
===================================

FIGURES
-------

When figures and tables are placed at the end of the MS (article in one-column style), please add between bibliography and first table and/or figure as well as between each table and/or figure.

FIGURES
-------

When figures and tables are placed at the end of the MS (article in one-column style), please add between bibliography and first table and/or figure as well as between each table and/or figure.

### ONE-COLUMN FIGURES

Include a 12cm width figure of Nikolaus Copernicus from [Wikipedia](https://en.wikipedia.org/wiki/File:Nikolaus_Kopernikus.jpg) with caption using R Markdown.

### TWO-COLUMN FIGURES

You can also include a larger figure.

TABLES
------

You can ad table in an R Markdown document to meet the template requirements.

### ONE-COLUMN TABLE

### TWO-COLUMN TABLE

MATHEMATICAL EXPRESSIONS
------------------------

All papers typeset by Copernicus Publications follow the math typesetting regulations given by the IUPAC Green Book (IUPAC: Quantities, Units and Symbols in Physical Chemistry, 2nd Edn., Blackwell Science, available at: <http://old.iupac.org/publications/books/gbook/green_book_2ed.pdf>, 1993).

Physical quantities/variables are typeset in italic font (t for time, T for Temperature)

Indices which are not defined are typeset in italic font (x, y, z, a, b, c)

Items/objects which are defined are typeset in roman font (Car A, Car B)

Descriptions/specifications which are defined by itself are typeset in roman font (abs, rel, ref, tot, net, ice)

Abbreviations from 2 letters are typeset in roman font (RH, LAI)

Vectors are identified in bold italic font using

Matrices are identified in bold roman font

Multiplication signs are typeset using the LaTeX commands `\times` (for vector products, grids, and exponential notations) or `\cdot`

The character \* should not be applied as mutliplication sign

ALGORITHM
---------

If you want to use algorithms, you can either enable the required packages in the header (the default, see `algorithms: true`), or make sure yourself that the packages `algorithms` and `algorithmicx` are installed so that `algorithm.sty` respectively `algorithmic.sty` can be loaded by the Copernicus template. Copernicus staff will remove all undesirable packages from your LaTeX source code, so please stick to using the header option, which only adds the two acceptable packages.

The conclusion goes here. You can modify the section name with `\conclusions[modified heading if necessary]`.

IPCC. 2006. “2006 IPCC Guidelines for National Greenhouse Gas Inventories, Prepared by the National Greenhouse Gas Inventories Programme.”

———. 2019. “2019 Refinement to the 2006 IPCC Guidelines for National Greenhouse Gas Inventories — IPCC.” <https://www.ipcc.ch/report/2019-refinement-to-the-2006-ipcc-guidelines-for-national-greenhouse-gas-inventories/>.
