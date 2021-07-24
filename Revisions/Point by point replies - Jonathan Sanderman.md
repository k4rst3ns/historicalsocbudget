# Point by point replies - Jonathan Sanderman

\textbf{Preface: This MS presents the findings of a spatially explicit implementation of a new IPCC Tier II approach to soil carbon stock changes. The authors use this model to calculate how much SOC has been lost due to agriculture but then go on to run the model annually for the period 1975 – 2010 to produce a dynamic picture of SOC recovery over this modern era of farming. The major takeaway message is that while agriculture has incurred a large SOC debt, recent agronomic improvements have led to 4 Pg C of SOC sequestration over this period of time. This detailed picture of SOC in croplands over the past several decades is of incredible importance to policy makers and as such I believe that paper can be an important contribution to the literature; however, I do have several major concerns that may or may not be addressable with revisions.}

Answer to preface:
Dear Dr. Sanderman, thank you for the thorough and helpful review of our manuscript. While checking and revising our data processing in response to your and the other reviewer's feedback, we discovered a bug in the soil model, leading to an overestimation of the transfer of carbon from the active to the slow pool exclusively for cropland. Additionally, we found unreasonable high forage crop production values (specifically for pumpkins used as fodder) in our input data, which are taken from FAO statistics. This made the overall intensification trend in agriculture lead to increasing carbon stocks in cropland. After correcting the bugs, this is no longer the case. Whereas this implies major revisions of our discussion and interpretation of results, we argue that the essence of the paper remains unchanged, albeit modified. We suggest that our key findings are a) we introduce a soil carbon model that can account for changes in agricultural management and can be applied within integrated assessment frameworks for the first time and b) we show that it is critical to account for management dynamics in SOC assessments. We provide an assessment of how results changed after correcting the bugs as a supplement to this author's comment. Here, we respond point-by-point to the reviewers' comments. Where appropriate, this will also address the implications of the bug fix. We look forward to your response.


\textbf{1. I had to read the methods section twice and spend an hour with Calvo Buendia et al., 2019 to fully understand what the authors have done. I’m still not 100% confident that I fully understand the methodology. I suggest adding an illustrative example or two graphically demonstrating how the process works. Perhaps starting with a simple case of one lu transition and then showing a more complex case of multiple lu transitions within a pixel.}

Answer to 1.:
We will add more detail and graphical representation for demonstrating especially the land-transition accounting.


\textbf{2. I have not been convinced that this sort of “dynamic” implementation of a steady state modeling approach is appropriate. I understand that the method was developed by the IPCC as a way to add more nuance into the Tier I emission factor approach but I don’t think the method was intended to be applied annually. Why not go all the way to Tier III approach using the process-based dynamics that are embedded in this simplified model? It appears you have all the data assembled to do this. My  main  concern with applying a steady-state model to annual changes is we know that the recent past trajectory of SOC (particularly in the slow and passive pools) will greatly influence the short-term model response to improved management – i.e. the model will take years to decades before SOC stocks start to rebuild if the trajectory was negative prior to the change – but this will be completely missed with the steady state application (stocks will start increasing immediately upon change).}

Answer to 2.:
This has already been answered in the earlier reply ('Reply on RC1', Kristine Karstens, 26 Jan 2021). 


\textbf{3. What time frame are the monthly climate data averaged over to get the rate modifiers for a steady state solution? Given the passive pool has an intrinsic decay rate equivalent to >100 year turnover time, it seems that you need to have a 100+ year average climate to come up with the proper rate modifiers.}

Answer to 3.:
As we do not use a steady state model, we believe the comment might be based on a misunderstanding and no averaging of climate data is needed.


\textbf{4. Transfer between lu types is not clear.  I do not understand how a “respective share of the SOC is reallocated.”  My concern is that the per area SOC stock for long-term cultivated land will be much different than the per area SOC stock for newly converted cropland, so I don’t see how you can suddenly bin these separate areas into one model component.  Perhaps my request for a visual guide will help me (and other readers)understand that I have misunderstood this part of the methods.}

Answer to 4.:
See above: We will add more detail and graphical representation here. This will illustrate the linearity of the problem; accounting separately for freshly converted cropland and old cropland is - in our equation system - essentially the same as taking the area-weighted mean.


\textbf{5. Why was 1901 chosen to spin up to steady state?  We know that this was a time of rapid agricultural expansion in several major regions of the world and thus a time of rapid soil carbon loss.}

Answer to 5.:
We extended the spin-up phase for a much longer period, starting in 1510 (the default spin-up start in LPJmL) to capture the land-use effects. Our initial choice of starting in 1901 was driven by the availability of climate data. To extend our spin-up into the past, we will recycle climate data from 1901 to 1930, as this is done in DGVM simulations as well (Schaphoff et al. 2018a/b, von Bloh et al. 2018). The management data will be held constant on the first known level. 

(References: 
von Bloh, W. et al. 2018: Implementing the nitrogen cycle into the dynamic global vegetation, hydrology, and crop growth model LPJmL (version 5.0). Geoscientific Model Development 11, 2789–2812.
Schaphoff, S. et al. 2018a: LPJmL4 – a dynamic global vegetation model with managed land – Part 1: Model description. Geoscientific Model Development 11, 1343–1375.
Schaphoff, S. et al. 2018b: LPJmL4 – a dynamic global vegetation model with managed land – Part 2: Model evaluation. Geoscientific Model Development 11, 1377–1403.)


\textbf{6. LULUC data – are these data all provided as area within each grid cell (or percent of a grid)? I think so, but please indicate. A supplemental table with the cross-walk between the LUH2 and the 17 crop groups used in this study should be included.}

Answer to 6.:
Yes, all area data are in hectares and meant to represent the area within each grid cell. We will indicate that more clearly. Additionally, we will add a table to the supplemental material.


\textbf{7. Please include units for eq 9 – I don’t follow the AGR calculation – it sounds like you are adding biomass and area together. Additionally, HI is usually defined as CP divided by total above ground biomass, so CP x HI is a meaningless number.}

Answer to 7.:
Our harvest index for the yield (t/ha) is calculated based on a linear function with positive intercept (ha) and a slope dependent on the yield (t/ha). This allometric function accounts for the fact that higher-yielding crops often have a lower harvest index than low-yielding crops. In our revised manuscript, we will rewrite the equations to make the functional form more visible. Instead of 
$AGR_{i,t,cg} = CP_{i,t,cg} \cdot HI_{prod,cg} + CA_{i,t,cg} \cdot HI_{area}$
we now write
$AGR_{i,t,cg} = CA_{i,t,cg} \cdot (Y_{i,t,cg} \cdot HI_{prod,cg} + HI_{area})$
We will also add more explanations to the text.


\textbf{7. Lack of validation. There appears to be no attempt to validate the model or the input data used to drive the model. In general, there is a lack of quantitative evaluation throughout.  There are just two qualitative quality assessments – a table comparing calculated stock change factors to Tier I estimates and a discussion on how the map looks similar to other SOC maps.}

Answer to 7.:
To address the raised issue, we will add to our analysis:
* A grid level comparison of SOC stock results to SoilGrids 2.0 and LPJmL to improve spatial evaluation of our results.
* More literature comparison of our derived agricultural land emissions as they are next to the SOC stocks the most central outcome of our analysis.
* An extended qualitative discussion of uncertainty and where it might be the largest.


\textbf{8. The  model  itself  was  developed  recently  as  part  of  the  2019  Refinements  to  IPCC Guidelines and those updated guidelines discuss how the model was calibrated to a set of long-term trial sites but do not report any model performance metrics. As pointed out by the authors some areas of central EU and the UK more than double SOC undercurrent agriculture than under native vegetation.  This is certainly indicative that there should be some checks against real data (see detailed elaboration on this point further down in this review).  It could be argued that point-based validation for a model run at0.5 degree resolution is meaningless but it would be an interesting exercise to see how the model reproduces trends with known SOC histories.}

Answer to 8.:
Our updated model does not show the superising behaviour of strongly increasing SOC stocks in UK and central EU anymore due to the bugfix within the model and the corrected fodder production data. We will add a more detailed spatial comparison to SoilGrids 2.0 (SOC stock estimates based on point data measurements) and other model based SOC estimates (LPJmL) to account for the missing spatial dimension of model output evaluation.


\textbf{9. Issues with residue C return. Given that the major takeaway from this paper is that the SOC is being sequestered due to improved yield leading to increased residue return, is there any empirical evidence that C inputs to the mineral soil have nearly doubled (Fig 3)? I think the method for calculating residue return to the soil is potentially flawed leading to this large apparent increase. The authors have assumed that both harvest index (HI) and root-to-shoot(RS) ratios have been constant through time.  However, yield improvements over the last century, and in particular the last 50 years, are a result of improvements in genetics and nutrition.  Breeding has resulted in the ability to plant most crops at much higher densities and selection towards more photosynthate being allocated to harvestable organs.  Both of these improvements have altered HI and RS ratios.  Additionally, there are strong interactions between N fertilization rate and root density.  There is a huge literature on crop breeding that support the nonstationarity of these important parameters.}

Answer to 9.:
This is an excellent point that we took up in the discussion. In particular, we would like to highlight the following:
The IPCC methodology, which we use here, tries to capture the effect of a shifting harvest index by making the harvest index a linear function of yield with a positive intercept. The parametrization of this dynamic harvest index was not possible for all crops due to a lack of literature estimates, but the most important crops like cereals or soybeans are captured.


\textbf{10. Units – Gt and Mt are not SI units, please use Pg and Tg}

Answer to 10.:
We will change all units to SI and add non-SI units in brackets were needed to bridge to IAM modelling community.


\textbf{11. L13 (and elsewhere) – “we also find that SOC is very sensitive...” – this is in reference to an unvalidated model result. I’d suggest rewording these sorts of phrases to, “Our model results suggest that SOC is very sensitive...}

Answer to 11.:
We will do a careful revision of naming and framing of the evaluation related statements.


\textbf{12. L279 – “we provide the first world map” – no, you did not. All of the global maps that have been developed using a statistical environmental-covariate modeling approach(i.e. soilgrids and similar) implicitly include all historic land management.}

Answer to 12.:
This is correct. We will rewrite the paragraph.


\textbf{13. It is great that all the data are provided but I found the Karstens 2020a repository to be confusing. Can you have a description for each file in the repository? The naming convention is not clear. I did not want to download 9 Gb of data to figure it out.}

Answer to 13.:
We will follow this suggestion and will add more detail to the README file including a description for each file.


\textbf{14. Fig 1 – perhaps it is just the spatial scale of these small maps (and I haven’t downloaded the results to explore in more detail) but it looks like there is zero intact forest in the Congo Basin and very little intact forest in the Amazon. Also, I would have likedto see a map showing the trend in SOC spatially – how are the 4 Pg C that has been sequestered been spread across the globe? Is it all in Central EU and UK?}

Answer to 14.:
Fig 1.(a) is showing cropland SOC for every grid cell that contains cropland, without giving an information on the extent of cropland. We will mask out cells with very low cropland area shares, as they might give to the impression of greater cropland extent within large parts of intact forested area. We will also provide a total SOC map in the appendix.


\textbf{15. Fig 2 – this is a really interesting way of summarizing the model results}

Answer to 15.:
Thank you!

\textbf{16. Fig 4 – the finding presented here is very counterintuitive to me. Why is the SOC debt halved when the model is initialized with natural vegetation? Shouldn’t the 1975 SOC debt be much greater if the 1901 starting point was natural vegetation instead of actual land use? Perhaps I am just misunderstanding this sensitivity analysis.}

Answer to 16.:
The initialization analysis was meant to help the reader understand the potential maximal error of underestimating on-going emissions in croplands, that where converted to croplands before 1901. We have now extended the spin-up phase from 1510 to now. We will move the initialization analysis to the appendix and improve the caption of the figure to make its interpretation more clear.


\textbf{17. Discussion section – in general, there is very little discussion of how these results fit into the large literature on SOC. There are many places were a reference or two would great increase the credibility of the statements that are being made.}

Answer to 17.:
We will include more connections to existing literature here.
Section 4.2 – I think this section should come right before the conclusions especially as you refer to analysis that is only presented for the first time in section 4.3
Section 4.3 will be moved to the end of the result as evaulation results subsection. 


\textbf{18. L358-360 – the finding that northern temperate zones (particularly in EU and UK) now have SOC levels up to twice that of native state yet tropical soils have lost 40-70% of their SOC is problematic and, as the authors point out in relation to the EU example,likely points to issues with getting C input to soil correct. The EU has the perfect data set to test this model finding – the EU JRC LUCAS survey was a balanced sampling design between forested and agricultural land uses. In the tropics, it has been fairly well documented that already infertile tropical soils do not lose nearly as much SOC as their fertile temperate zone soil counterparts. While there are issues and large scale generalizations in the IPCC Tier I default factors, they do represent the consensus literature on the topic. The updated meta-analysis between the 2006 and 2019 IPCCC guidelines when this emission factor for the tropics changed dramatically (see Table 4in this MS) points to this new knowledge.}

Answer to 18.:
After our bugfix, SOC stocks for the EU nore longer gain SOC compared to natural vegetation. In general, all carbon stocks are much smaller and show much higher losses compared to the Tier 1 approach for both temperate and tropical soils. This may be indicative of gaps in the accounting of carbon inputs to the soil and will be discussed in more detail within the discussion.
The comparison to point data is however challenging, also as point measurements do not well capture the landscape average and will likely show a very high variance. On the one hand the LUCAS database is given as soil carbon density and would need consistent bulk density data to be comparable to our results. A full comparison to point measurements may also exceed the scope of this first article. We hope that our additional comparison to SoilGrids 2.0 might help fill the evaluation gap here as SoilGrids 2.0 is based on point measurements.


\textbf{19. L396 – how is this validation? It is just a comparison.}

Answer to 19.:
The naming and framing of the evaluation of our results will be improved.


\textbf{20. L400-406 – there is a large literature that can be drawn upon to support some of the claims made in this section.}

Answer to 20.:
We will add more detail and references here.


\textbf{21. Section 4.4 – I do not think this is a valid comparison because SoilGrids explicitly tried to capture high carbon density soils well while your model explicitly excludes organic soils. I suggest applying an agriculture mask to all of these data sets and then redo the analysis. Additionally, ISRIC released an update to SoilGrids >6 months ago that focuses primarily on mineral soil carbon stocks. This update is probably a better comparison.}

Answer to 21.:
We included the recommended SoilGrids 2.0 data for a more spatially detailed evaluation of our results especially for cropland soils.


\textbf{22. L425-428 – this seems out of place.}

Answer to 22.:
We will include a discussion of the sensitivity in our extended discussion on evaluation and uncertainty of our results.


\textbf{23. L453 – comparison to 4p1000 is not really fair because your model is really just the business-as-usual scenario with SOC gains simply because yields are improving glob-ally. 4p1000 is about intentional management shifts to increase SOC.}

Answer to 23.:
We agree with the reviewer, that the comparison is a bit misleading. We still think that it is fruitful to compare the observed rates with ambitious targets and will reframe the discussion on this point.
