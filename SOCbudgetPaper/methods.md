# Method (50)

<!-- Soil carbon dynamics are modeled using a yearly based SOC model and carbon input and management data. -->

## Carbon Budget (50)
Our soil carbon stock estimates are base on the IPCC guidelines vol. 4 and their refinement ([@ipcc_2006_2006],[@ipcc_2019_2019]), combining several approaches to estimate SOC stocks by weighting inflows via dead plant material (see \@ref(sec:carboninputs)) against outflows through SOC decay (see \@ref(sec:tier2)). (Carbon displacement via leaching and erosion is neglected in this study. --> move to discussion) We calculate annual land use type specific budgets for cropland, pastures and natural vegetation, also representing land conversion as transfer between landuse type budgets. <!-- Maybe include a flow figure and reference to it here --> 
(A simple approach based on the tier 1 method of the older IPCC guidelines vol 4. (@ipcc_2006_2006) using stock change factors, is applied to cross validated results \@ref(sec:tier1) --> move somewhere else)

### Carbon Inputs to the Soil {#sec:carboninputs}

Carbon inputs are estimated based on the land use type. Whereas cropland inputs are mainly formed by disaggregated country statistics on residue, dead below ground and cover crop biomass, pasture and natural vegetation inputs are estimate via modelled annual litterfall rates. Using the steady-state method of the IPCC guidelines ([@ipcc_2019_2019]) carbon inputs have to be accompined by data on lignin and nitrogen content to allocate dead plant biomass to the corrosponding soil pools based on the chemical texture. Sources for all use data can be found in table \@ref(tab:datasourceinputs)


\begin{table*}[h]
\caption{Sources for carbon input data}
\begin{tabular}{l l l}
\tophline
 Land use types   & carbon inputs & nitrogen and lignin content \\
\middlehline
 Cropland         & FAO statistics, AQUASTAT, LPJmL4 [1] & default values [\cite{ipcc_2006_2006}] \\
 Pasture          & annual litterfall in $\tfrac{gC}{m^2}$ from LPJmL4 - manage grassland [3] & default values [2] \\
 Natural vegetation & annual litterfall in $\tfrac{gC}{m^2}$ from LPJmL4  & \begin{minipage}[t]{0.37\columnwidth}\raggedright\strut Nitrogen and lignin content of tree compartments used in CENTURY \strut \end{minipage}\tabularnewline
\bottomhline
\end{tabular}
\label{tab:datasourceinputs}
\belowtable{}
\end{table*}


### Soil Carbon turnover following (new) Tier 2 method (300) {#sec:tier2}

We are following the steady-state method of the refinement of the IPCC guidelines vol. 4 (@ipcc_2019_2019) by calculating yearly turnover and transfer rates between three different SOC pools for the topsoil (0-30 cm). The approach is based on global parameters ([\@ref(ipcc_2019_2019)]) as well as half-degree data on sand fraction (SoilGrids), temperature, preciptation and potential evapotranspiration (CRU). 
Next to the given climatic and natural biophysical properties irrigation regime (rainfed vs. irrigated) as well as tillage (as soil disturbance indicator) modificate processes. For cropland an assessment of tillage types and irrigation conditions has been made, whereas on pastures and natural vegetation, we assume rainfed and non-tilled conditions.
<!-- Maybe clearify that the approach originally is not proposed on pasture and natural vegetation? -->

### Soil Carbon turnover following Tier 1 (150) {#sec:tier1}

Following the tier 1 approach of the IPCC guidelines vol. 4 (@ipcc_2006_2006), stocks are estimated via stock change factors given by the IPCC for the topsoil (0-30 cm) and based on measurements. The factors are differentiate between different crop and management systems reflecting different dynamics under changed in- and outflows without explicitly tracking these. They can be seen as conservative guesses and will be used to evaluate our modelling based results.



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


