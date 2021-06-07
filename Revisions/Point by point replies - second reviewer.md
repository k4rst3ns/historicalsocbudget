# Point by point replies - second reviewer 


0. The authors have conducted a study evaluating the influence of management on soil organic carbon in global croplands. This is an important topic for consideration of greenhouse gas mitigation with natural solutions for climate change policy and pro-grams such as the 4 per mille initiative. As the authors mention, there are few studies that have evaluated cropland management effects on soil organic carbon, and possibly none that have addressed the influence at a global scale. The result that increased residue return to soils is the leading driver of carbon changes over the past few decades in croplands is an important finding. As the authors note, the 4 Gt C increase in carbon is less than the goals of the 4 per mille initiative, which some have argued is not realistic. I have a few concerns about the study after review of the IPCC documentation on the method that the authors selected for this analysis. I would suggest that the authors make revisions before the manuscript is accepted.

Answer to 0.:
Dear reviewer, thank you for the thorough and helpful review of our manuscript. While checking and revising our processing in response to your and the other reviewer's feedback, we discovered a bug in the very core of the soil model, leading to an overestimation of the transfer of carbon from active to the slow pool *just* for cropland. Additionally, we found unreasonable high forage crop production values (specifically for pumpkins used as fodder) in our input data, which were taken from FAO statistics. 
This made the overall intensification trend in agriculture lead to increasing carbon stocks in cropland. After correcting the bugs, this is no longer the case. 
Whereas this implies major revisions of our discussion and interpretation of results, we find that the essence of the paper, which is a) the availability of a soil carbon model that can account for changes in agricultural management and can be applied within integrated assessment frameworks and b) an analysis of the importance of accounting for management dynamics in SOC assessments, remains unchanged, albeit modified. We provide an assessment of how results changed after correcting the bugs as a supplement to this authors comment. Here, we respond point-by-point to the reviewers' comments. Where appropriate, this will also address the implications of the bugfix. We look forward to your response.


1. The Tier 2 method is in a croplands chapter of the IPCC report. The documentation in the report states that the model would need to be parameterized for other land uses.Did the authors parameterize the model for other land uses that would be considered natural vegetation? If not, the estimation of soil organic carbon for natural vegetation may not be valid. The authors seem to suggest that this is a possibility in Section 4.4 when stating the soil organic carbon and debt from land use change have to be interpreted with caution. If the model has not been parameterized for natural vegetation, I would suggest that the authors focus on cropland model results, and remove the carbon debt results. The results for the cropland alone are important, and deserve publication even if the natural vegetation estimates are not valid with this model.

Answer to 1.:
This is an important point. While our analysis focuses on croplands, estimating the natural soil carbon stocks is a necessity to account for the C entering the cropland budget via land conversion. Apart from this process, we only use natural vegetation SOC to make our results comparable to other global estimates for validation purposes.
To improve the parametrization of natural soil carbon, we will include the following model updates:
* We will improve the litterfall parameterization in natural vegetation.
* We will compare our results on soil stock under natural vegetation with the results of a model parametrized for natural vegetation (LPJmL).
 

2. Is it possible to estimate uncertainty with this method? IPCC methods often have large uncertainty but does this method have less uncertainty because it is a Tier 2method. If it is not possible to estimate uncertainty could the authors speculate on the level of uncertainty in the predictions. Knowing something about uncertainty would be helpful in comparisons to the modeled results from other studies that are shown in the manuscript.

Answer to 2.:
The quantitative assessment of the uncertainty of our projections unfortunately exceeds the scope of this article and would likely require a study on itself. The model includes a high number of parameters, and for most of these the uncertainty distributions have not been quantified so far. Moreover, we think that beyond parameter uncertainty, the structural uncertainty from the model design is also very high. 

To still address the uncertainty within this manuscript, we will therefore discuss the uncertainty qualitatively. Most of the uncertainty in our view is included in the management data, especially in the manure numbers, as they are calculated from feed data. Additionally residue and litter estimations are based on the set of global parameters, that contains large uncertainty and at the same time have a great impact on the overall size of carbon inputs to the soil. Both effects will be discussed in more detail.


3. The authors state that a sensitivity analysis presented in Figure 4 shows that management impact is robust to the initialization of the soil organic carbon stocks at the beginning of the spin-up phase. But, the stocks and change in stocks almost halves the values if the initialization is done with natural vegetation. The initialization does make a difference, and needs further explanation.

Answer to 3.:
It is correct that the SOC stocks are highly dependent on the legacy of management. Figure 4 made however clear, that the SOC gap - so the difference between a baseline scenario and a counterfactual scenario with constant management - was not strongly dependent on the initialization. We thereby showed that the initialization does not affect our central finding.

Still, in order to improve our estimates also for the absolute SOC stock, we now extended the length of the spin-up phase, starting in 1510 (default spin-up start for introducing land use in simulations with LPJmL, see e.g. Schaphoff et al. 2018a/b, von Bloh et al. 2018 ). We will analysis and discuss our results with respect to the initialization in more detail.

  
4. Good to see that the authors have made a comparison to another approach to confirm the Tier 2 results. The Tier 1 method provided by the IPCC has been used for this purpose. In section 2.2, the authors present a method estimating stock change factors instead of soil organic carbon changes. But, the results in Table 4 for the stock change factors are not convincing that the methods are consistent, and the text seems unclear with discussion about larger differences with the IPCC 2019 values, which were updated by the authors and should be more accurate – I would think. Why not estimate the change in soil organic carbon for a direct comparison with the Tier 2 method instead of the stock change factors? Also, the placement of these results after the discussion seems odd, and conventionally would be presented in the results section before discussion.

Answer to 4.:
Thank you for the recommendation. We will place the comparison within the result section. For a Tier 1 approach the change in soil organic carbon has to be calculated based on a reference stock. The default stocks given by the IPCC have very low spatial resolution (42 coarse climate zone and soil type specific values), which leads to additional uncertainty when comparing directly changes in soil organic carbon.
We will add more detail to the discussion about the strong deviation of 2006 and 2019 default stock changes factors.
 
 
5. Figure 3 shows results from making certain practices constant from 1975 to 2010.The authors state around line 315 that the effect of no-till has been strong since 1990,but the effect seems minor and may not differ statistically from the histManagement with uncertainty. The conclusion about the importance of residue seems most important here.

Answer to 5.:
Due to the overall changes to the results, we will rewrite major part of the result and discussion. We will take more thoroughly into account effects of uncertainty.


6. The authors suggest that there needs to be a circular flow with food supply chain back to soils. They assumed that none of the waste from supply chains are returned to soils (near line 300) but this seems incorrect. Municipal waste and materials are amended to soils in many regions of the world although maybe there are no data on these amendments? If this is the issue, the authors could mention that they are making a conservative assumption due to lack of data.

Answer to 6.:
Indeed, further soil inputs include the application of human excreta and sewage sludge, as well as the application of processing wastes, forestry residues or biochar. Unfortunately, data on the quantity of these inputs is very scarce and often does not exist with global coverage.
In the draft of the International Nitrogen Assessment (will be provided confidentially to the reviewer), the available literature estimates for these flows (in regard to nitrogen) were reviewed. So far no reliable estimates exist, but the existing estimates indicate that these inputs must be by an order of magnitude lower than those by crop residues and manure.


7. The authors evaluate the sensitivity of the Tier 2 model for tree litter with methods in Section 2.4.3. The Tier 2 model divides litter into metabolic and structural components,and the authors have averaged lignin to nitrogen across tree components as input to the model. But forest also include deadwood and should be separated from other forest litter to model decomposition. Did the authors add a deadwood pool? I question if this model is appropriate for forest if deadwood is not modeled separately.

Answer to 7.:
We follow this suggestion and will add more detail on the litterfall of the natural vegetation. Using additional information from LPJmL, we will split up the litterfall into a wood- and soft-tissue fraction and add different parameterizations for these. 
We will not be able to add a deadwood pool, since that would require additional parameterization of turnover dynamics for this new pool. Deadwood pools are also not treated explicitly in many DGVMs but are considered part of litter pools, which distinguish woody from non-wood litter pools. The separation of litterfall into wood and soft tissue fluxes will thus add similar stock detail as in DGVMs.


8. Recommend that the authors provide more explanation for Equation 9, which determines the residue amount of C, and is a key driver of the carbon change. Harvest index is the proportion of plant biomass that is harvested, but the authors are multiplying the harvested crop product by the harvest index. But the conventional approach is ’harvested crop production divided by the harvest index’ to determine the total biomass and then subtract the harvested amount to estimate the residue. The authors are accounting for double harvesting and fallow in this calculation, which I agree is important, but some further explanation is needed about the calculation to understand how residue carbon is estimate from crop production, harvest index and area.

Answet to 8.:
Our harvest index for the yield (t/ha) is calculated based on a linear function with positive intercept (ha) and a slope dependent on the yield (t/ha). This allometric function accounts for the fact that higher-yielding crops often have a lower harvest index than low-yielding crops. In our revised manuscript, we will rewrite the equations to make the functional form more visible. Instead of 
AGR_i,t,cg = CP_i,t,cg ·HI_prod,cg +CA_i,t,cg ·HI_area
we now write
AGR_i,t,cg = CA_i,t,cg (Y_i,t,cg ·HI_prod,cg + HI_area)
We will also add more explanations to the text.


9. For the Tier 1 method, IPCC divides the reference carbon stocks by climate and soil types. Did the authors also divide the grid cells by climate and soil because only climate is mentioned in the text? And, I found a diagram in Figure 5.1 in the IPCC report that divides low, medium and high input categories. Did the authors use this diagram to classify the input? It is not clear if the authors use the diagram or developed their own. If they developed their own, is it consistent with the IPCC factors?

Answer to 9.:
We do not calculate carbon stocks and stock changes based on the Tier 1 method. Instead we calculate stock change factors from our Tier 2 approach to compare only these factors to the Tier 1 factors as given within the guidelines. We will point this out more clearly in the method and discussion part. In addition, we note here:
* To our knowledge, the IPCC method splits up soil types into mineral and organic. This analysis focuses exclusively on mineral soils, which will be pointed out clearler  throughout the paper. 
* To aggregate our Tier 2 results we assigned only one climate type for each grid cell (the most dominant one). 
* The Tier 2 method does not take into account different soil classes directly, but rather takes the sand fraction as a proxy for soil properties (like water holding capacities). .
* For the Tier 1 method no detailed analysis has been conducted . All factors shown in the manuscript are default factors without any spatial disaggregation of effects. We did not classify the inputs into Tier 1 categories (as there was no need to do so for Tier 2 and no data available to do so at the global scale).


10. What is ‘resp’ is ‘area reduction resp’ on line 110? This sentence should be revised to improve readability. I also found other sentences that were difficult to read or missing words in some cases, but did not make a list during my review. Suggest a careful review before final publication.

Answer to 10.:
We will do so.

11. I found the Tier 2 method in Chapter 5 of Volume 4 of the 2019 IPCC report, and would suggest that the authors cite this chapter rather than the entire 2019 IPCC report,which has 5 volumes. This would make it easier for others interested in the study to find the method in the IPCC report.

Answer to 11.:
We will change the citation from full report to the Chapter 5 were needed. 