---
permalink: /mesonet/ag_tools/gdds/
title: "Growing Degree Days Calculation"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
toc: true
---

The following text, tables and growing degree day thresholds are adapted with permission from the North Dakota Agricultural Weather Network (NDAWN), unless otherwise noted. The following information on growing degree days is also available at the NDAWN website: [https://ndawn.ndsu.nodak.edu/tools.html](https://ndawn.ndsu.nodak.edu/tools.html).
{% include image.html url="assets/images/ndawn_logo.png" description="" %}


## Overview of Growing Degree Days
For most plants, phenological development is strongly related to the accumulation of heat or temperature units above a threshold or base temperature below which little growth occurs. This lower threshold temperature varies with plant species. In some plants there is also an upper threshold temperature above which little or no growth occurs. Although temperature is the most important factor controlling the rate of plant development, other factors such as water and light availability and daylight length may modify its effects.

The most common temperature index used to estimate plant development is growing degree days (GDD) which are calculated from the daily maximum and minimum air temperature. Growing degree days have proven useful for scientists, crop consultants, and producers who use them to predict plant development rate and growth stage. In certain crops this information is used to help plan crop management decisions such as irrigation or pesticide application timing, and for scheduling harvest.

Daily GDDs are calculated as follows. If there are low or high cutoff temperature thresholds for a given crop, the daily minumum ($T_{min}$) and maximum ($T_{max}$) temperature are clipped to that range. For example, if the low cutoff temperature is 35°F, the high cutoff is 80°F, $T_{min}$ is 32°F, and $T_{max}$ is 82°F, $T_{min}$ and $T_{max}$ would be set to 35°F and 80°F, respectively. Once the values are adjusted to the proper range, the daily average temperature  ($T_{avg}$) is calculated from the clipped daily $T_{min}$ and $T_{max}$:

$$
T_{avg} = (T_{min} + T_{max}) / 2
$$

Finally, the daily total GDD units are calculated by subtracting the minumum temperature threshold from $T_{avg}$:

$$
GDDs = T_{avg} - Minimum Threshold
$$

As the growing season progresses, GDDs are typically summed to help predict and monitor different crop growth stages. 

### Calculating Growth Stage
**This section's text is adapted from the NDAWN [GDD help page](https://ndawn.ndsu.nodak.edu/help-wheat-growing-degree-days.html).**

Daily GDD's calculated using the above conditions are accumulated for each day following planting to determine the current estimated Haun growth stage. The main uncertainty in this calculation occurs during the period from planting to emergence because of planting depth and varying seedbed conditions that affect soil temperature, especially soil water content, surface residue, and soil type. For the same planting depth and under the same climatic conditions, emergence in seedbeds with surface residue will be delayed by 1 to 2 days. Despite this uncertainty, growth stages are calculated based on planting date because it is more readily available in producers records.

When planted at 1.5 inches depth in a bare (no surface residue) moist soil, it takes an accumulation of between 180 and 250 GDD (°F) beginning with the day after planting until emergence occurs, depending on the crop. Emergence by this criteria means plants are visible in the row (you can see the rows), and the first leaf is equal to about one half of its eventual full length. By this criteria emergence is defined as Haun stage 0.5.

The Haun growth stage scale[^1] is far more precise than other commonly used scales. The Haun scale assigns consecutive numbers to main stem leaves in the order in which they appear. When the first leaf is fully developed, the plant is at stage 1, and so on through stage 8. Each leaf is fully developed when the next leaf is visible in the rolled part of the leaf. For example, leaf 2 is fully developed when the third leaf is visible in the rolled par of leaf 1.

The number assigned to each stage can be further subdivided into fractional sub-stages to provide more information. Fractional leaf stages are determined by comparing the length of the developing leaf to the preceding leaf. For example, if leaf 3 is one-third as long as leaf 2 then the Haun growth stage is 2.3, and if leaf 3 is one-half as long as leaf 2 it is designated stage 2.5. The same type of system is also used to designate sub-stages in the growth units following stage 8.

While not all crops listed below use the Haun scale to track growth stages, other methods are similar in that they track the emergence of leaf numbers as the plants grow.

[^1]: Haun, J. R. 1973. Visual quantification of wheat development. Agron. J. 65: 116-119

### Example Mesonet API Call
Daily cumulative GDDs are available both through the dashboard and the Montana Mesonet API. An example API call to see GDD data is available below:

[https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat](https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat)
<div style="width: 100%; height: 300px;"><iframe style="width: 100%; height: 300px;" src="https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat" frameborder="0px"></iframe></div>

## Barley Growing Degree Days

**This section's text is adapted from the NDAWN [barley GDD help page](https://ndawn.ndsu.nodak.edu/help-barley-growing-degree-days.html).**

Growth stages of barley can be determined by visual inspection any time, but an alternate method based on air temperature is available to estimate the current growth stage without going to the field. For most plants, phenological development from seeding to maturity is related to the accumulation of heat or temperature units above a threshold or base temperature below which no growth occurs. The lower threshold temperature varies with plant species. Bauer et al. (1992) showed that barley development could be estimated using this method.

### Barley Growing Degree Day Calculation

Temperature or heat units are called growing degree days (GDD) and are calculated by subtracting the lower threshold (base) temperature from the average daily air temperature. Although the lower growth limit for barley is about 42 °F, Bauer et al (1992) found better correlation between accumulated GDD and barley growth stage by defining the lower threshold temperature as 32 °F (0 °C)[^2]. This also makes conversion between Celsius and Fahrenheit GDD's much easier. Average daily air temperature is calculated by averaging the daily maximum and minimum air temperatures.

Several additional constraints on maximum and minimum temperature were introduced to eliminate very low or very high temperatures that retard or prevent growth of wheat[^3][^4]. We have included those same temperature restrictions in the GDD calculations for barley because it's so similar to wheat. They are:

1. If daily Max or daily Min Temp < 32 °F (0 °C) it's set equal to 32 °F (0 °C).

2. Prior to Haun stage 2.0, (384 GDD accumulated since planting); If daily Max Temp > 70 °F (21 °C) then it's set equal to 70 °F (21 °C).

3. After Haun stage 2.0; If daily Max Temp > 95 °F (35 °C) it's set equal to 95 °F (35 °C).

Using these criteria, growing degree days can be mapped to Haun growth stages in the table below.

|Stage|Stage Name|Stage Description|Accumulated GDDs Required|
|-----|----|-----------|----|
|0.5|Emergence Date|Emergence is defined as the date leaf 1 reaches half of its length (Stage 0.5). The GDD required from planting until emergence depends on planting depth, soil water content, soil temperature, surface residue, and soil type. Predicting emergence is the most uncertain part of this model.|176|
|1|Leaf 1 (Fully Extended)|Leaf 1 is fully developed when the second leaf is just visible in the rolled part of leaf 1.|245|
|2|Leaf 2 (Fully Extended)|Leaf 2 is fully developed when the third leaf is just visible in the rolled part of leaf 2. This is the same concept for leaves 3 through 7.|384|
|3|Leaf 3 (Tillers Begin To Emerge)|Tillering begins at Haun stage 2.0 to 2.5, but tillers are not visible until Haun stage 3.0-3.5.|523|
|4|Leaf 4 (Fully Extended)||662|
|5|Leaf 5 (Tillering Ends)||801|
|6|Leaf 6 (Fully Extended)||940|
|7|Leaf 7 (Fully Extended)|Drought stressed plants may pass directly to stage 9, either because leaf 8 does not grow or because it does not develop.|1079|
|8|Flag Leaf Emerged (Collar Visible)|The flag leaf (Leaf 8) is fully developed when the flag leaf collar is visible. Flag leaf stem elongation begins.|1218|
|9|Boot Swelling Begins (Flag leaf stem elongated; Awns just peeking out of boot)|Awns just peeking out of boot. Flag leaf stem has elongated elevating the flag leaf above the previous leaf. Elongation usually ends with the first signs of boot swelling.|1357|
|9.5|Mid-Boot (Head half emerged)|Flowering in barley begins when about 1 inch of the awns are above the flag leaf collar. This is a major difference with spring wheat which doesn't begin flowering until 3 to 4 days after the head has cleared the flag leaf collar.|1426|
|10|Head Emerged (Boot Complete) (Flowering Complete)|Flowering is complete when the head has emerged (cleared the flag leaf collar). Head stem elongation begins.|1496|
|11|Heading Complete|Head stem elongation completed.|1635|
|11.5|Kernel Watery Ripe|Watery ripe means the kernel length and width are established, but little dry matter has been accumulated.|1745|
|12|Milky Ripe|||
|13|Mealy|||
|14|Kernel Hard|||
|15|Ripe|||

[^2]: Bauer, A, A. L. Black, A. B. Frank, and E. H. Vasey. 1992. Agronomic Characteristics of Spring Barley in the Northern Great Plains. North Dakota State University Agricultural Experiment Station Bulletin No. 523, 47 pp.
[^3]: Bauer, A., C. Fanning, J.W. Enz, and C.V. Eberlein. 1984 Use of growing-degree days to determine spring wheat growth stages. North Dakota Coop. Ext. Ser. EB-37. Fargo, ND.
[^4]:Bauer, A., A.B. Frank, and A.L. Black. 1984. Estimation of spring wheat leaf growth rates and anthesis from air temperature. Agronomy Journal 76:829-835.

## Canola Growing Degree Days

Below 41°F, canola's growth is restricted, so we set it as the minimun base temperature and we do not define an upper temperature threshold. Relative to other crops on this page, the growth stages for canola are not well defined. As such, the table below gives a range of GDD values that each stage falls within. 

|Stage|Accumulated GDDs Required|
|-----|----|
|Planting|0|
|Seedling|0 - 256|
|Rosette - 3rd Leaf|257 - 396|
|Rosette - 4th Leaf|297 - 727|
|Early Bud|728 - 828|
|Late Bud|829 - 932|
|Early Flower|933 - 1165|
|Late Flower|1166 - 1397|
|Early Ripening|1398 - 1634|
|Late Ripening|1635 - 1874|
|Ripe|>1874|


## Corn Growing Degree Days
While it varies, many corn varieties have low temperature threshold of 50°F and a high temperature threshold of 86°F. The corn growth stages in the table below are derived from Abendroth et al (2011) and Neild et al (1990)[^5][^6]. It should be noted that these growth stages may not be applicable to some of the corn varieties grown in Montana, but they are included here for reference. 

|Stage|Stage Name|Accumulated GDDs Required|
|-----|----|----|
|VE|Emergence|120|
|V2|Two leaves fully emerged|200|
|V3|Three leaves fully emerged|350|
|V6|Six leaves fully emerged|475|
|V9|Nine leaves fully emerged|610|
|V10|Ten leaves fully emerged|740|
|VT|Tasseling|1135|
|R2|Kernel blister stage|1660|
|R4|Kernels half grown|1925|
|R5|Dent Stage|2450|
|R6|Physiological maturity|2700|

<sub>Growth stage description taken from [https://www.corn-states.com/app/uploads/2018/07/corn-growth-stages-and-gdu-requirements.pdf](https://www.corn-states.com/app/uploads/2018/07/corn-growth-stages-and-gdu-requirements.pdf)</sub>

[^5]: Abendroth, L.J., Elmore, R.W., Boyer, M.J., and Marlay, S.R. 2011. Corn growth and development. PMR 1009. Iowa State University Extension.
[^6]: Neild, R.E. and Newman, J.E.. 1990. Growing season characteristics and requirements in the Corn Belt. National Corn Handbook, Purdue University, Cooperative Extension Service, West Lafayette, IN

## Sugarbeet Growing Degree Days

**This section's text is adapted from the NDAWN [sugarbeet GDD help page](https://ndawn.ndsu.nodak.edu/help-sugarbeet-growing-degree-days.html).**

Holen (1998)[^7], and Holen and Dexter (1997)[^8] showed that a lower threshold (base) temperature for sugarbeet development of 34 °F (1.1 °C) provided the best statistical results. They also found that no upper threshold was needed. However, their research was done during three relatively cool growing seasons, 1991-1993, when few high temperatures occurred. The average daily temperature exceeded 90 °F on 11 days in 1991, but in 1992 and 1993, the maximum temperature never reached 90 °F. This explains why the inclusion of a 90 °F maximum limit did not improve their model performance. However, others have reported that an upper limit of 86°F (30 °C) will provide better results. A base temperature of 34°F and an upper threshold temperature of 86°F are used by the MCO.

### Sugarbeet Leaf Growth Characteristics (Reprinted from Holen and Dexter)
Sugarbeet emerges from the soil with a pair of cotyledonary leaves. These leaves serve as a temporary source of food reserves for the developing seeding. The next leaves to emerge from the crown are the first two true leaves. Although these leaves appear as a pair and seem to be oppositely arranged, they are alternate and one of the leaves is developmentally behind the other. Stage separation between the first and second true leaves does not occur. Thereafter, all leaves emerge from the crown in an alternate pattern and are arranged in a 5/13 phyllotaxus. Phyllotaxus is a term used by botanists to describe the pattern of leaf emergence of a plant. A 5/13 arrangement means the leaves emerge from 13 vertical ranks around the crown and there are five turns around the crown as you follow leaf emergence before another leaf emerges in the same vertical rank.

Reasonable leaf stage predictions from GDD require that leaf stages of sugarbeet plants be correctly and uniformly identified. Staging sugarbeet is not difficult but a uniform system for designating stages has not been proposed in the sugarbeet growing regions of the United States. Sugarbeet is a unique crop as it is a biennial plant grown as an annual for its sucrose reserves. In the first year of growth it remains in a vegetative state and produces an indeterminate number of leaves. Under Belgium conditions (110 day growing season) sugarbeet produced an average of 40 leaves and under full canopy maintained an average of 25 leaves with new leaves replacing ones that died. Fortunately, it isn't necessary or even useful to precisely know the sugarbeet leaf number beyond the eight- to ten-leaf stage when herbicide applications usually end because management decisions will not be improved by knowing crop leaf stage later in the season.

### Proposed Sugarbeet Leaf Stage System (Reprinted from Holen and Dexter)
The following table is a proposed staging system for sugarbeet up to the nine-leaf stage. This staging method designates the leaf stages as vegetative stages V1.0 through V9.0. Leaves are counted when the leaf blade is fully unrolled. This system also uses decimal fractions of each leaf stage to allow better separation of leaf stages and increased accuracy of GDD predictions. The decimal fractions are used to represent the percentage or amount of the next emerging leaf that has unrolled. For example, if the plant has three fully unrolled leaves and the fourth leaf is approximately 60 percent unrolled the stage is V3.6. At later leaf stages, when several unrolled leaf initials may be present, use the most advanced leaf in the estimate. This staging method has at least one major deficiency. As crop development progresses beyond the V2.0 leaf stage, two or more developing leaf initials always are present. This means true V3.0 to V9.0 stages do not exist. For example, as the fifth-leaf fully unrolls, the sixth leaf initial is present and the earliest V5 stage is V5.1 or V5.2.

The division of each leaf stage into decimal fractions allows for more accurate predictions of plant development. For example, if a plant is correctly staged at V2.5 but you ignore the decimal fraction and call it a two-leaf plant or V2.0 there are 70 GDD of development not taken into account (141 GDD from V2.0 to V3.0 versus 70 GDD from V2.5 to V3.0).

|Stage|Stage Description|Accumulated GDDs Required|
|-----|-----------|----|
|V1 (Emergence)|Emergence. Cotyledons emerged and no evidence of first and second leaf initials|237|
|V2|Two true leaves unrolled and no evidence of three leaf stage. These are the first two leaves that develop simultaneously. At this stage and subsequent stages the cotyledons are no longer counted as leaves.|572|
|V3|Three true leaves unrolled and no evidence of four leaf stage.|713|
|V4|Four true leaves unrolled and no evidence of five leaf stage.|821|
|V5|Five true leaves unrolled and no evidence of six leaf stage.|913|
|V6|Six true leaves unrolled and no evidence of seven leaf stage.|993|
|V7|Seven true leaves unrolled and no evidence of eight leaf stage.|1066|
|V8|Eight true leaves unrolled and no evidence of nine leaf stage.|1133|
|V9|Nine true leaves unrolled and no evidence of ten leaf stage.|1195|
|V10|Ten true leaves unrolled and no evidence of eleventh leaf stage.|1253|

[^7]: Carlyle D. Holen. 1998. A Growing Degree Day Equation For Predicting Early Sugarbeet Leaf Stages. Ph.D. Dissertation, Plant Sciences Dept., North Dakota State University, Fargo.
[^8]: Carlyle D. Holen and Alan G. Dexter. 1997. A Growing Degree Day Equation For Early Sugarbeet Leaf Stages. Published in the 1996 Sugarbeet Research and Extension Reports, Vol 27: pages 152-157. Sugarbeet Research and Extension Board of Minnesota and North Dakota.

## Sunflower Growing Degree Days
We define a low temperature threshold of 44°F, with no upper temperature threshold.

### Sunflower Growth Stages

**This section's text is adapted from the NDAWN [sunflower GDD help page](https://ndawn.ndsu.nodak.edu/help-sunflower-growing-degree-days.html).**

The time from planting to emergence varies somewhat because of variations in planting depth and seedbed conditions that affect soil temperature, soil water content, surface residue, and soil type. Because of this variation the number of GDD required from planting until emergence is not constant which causes variation in estimated growth stages. Despite this uncertainty, growth stages on NDAWN are calculated based on planting date rather than emergence because planting date is more readily available in producers records.

The relationship between sunflower development and GDD is displayed in the table below. Growing degree days are accumulated beginning with the day after planting.[^9] VE represents emergence. "The hypocotyl arch and cotyledons have emerged from the soil surface, and the first true leaf blade is less than 4 cm in length".[^9] V1, V2, V3 - V20 represent the number of true leaves at least 4 cm in length. "The criterion of not counting a leaf blade until it has attained a length of 4 cm does not represent a distinct physiological stage of leaf development. It is simply a guideline to eliminate some of the confusion which can occur as a result of the very small leaflets which surround the terminal bud".[^9]

|Stage|Accumulated GDDs Required|
|-----|----|
|VE|206|
|V1|241|
|V2|276|
|V3|311|
|V4|347|
|V5|382|
|V6|417|
|V7|452|
|V8|487|
|V9|522|
|V10|557|
|V11|592|
|V12|627|
|V13|662|
|V14|697|
|V15|732|
|V16|767|
|V17|802|
|V18|837|
|V19|872|
|V20|908|
|R1|1048|
|R2|1188|
|R3|1328|
|R4|1469|
|R5.1|1609|
|R5.5|1749|
|R6|1889|
|R7|2030|
|R8|2170|
|R9|2310|

[^9]: Schneiter and Miller. 1981. Description of Sunflower Growth Stages. Crop Science 11: 635-638

## Wheat Growing Degree Days

**This section's text is adapted from the NDAWN [wheat GDD help page](https://ndawn.ndsu.nodak.edu/help-wheat-growing-degree-days.html).**

Although the lower growth limit for wheat is about 42°F, Bauer found better correlation in the GDD predictions by defining the lower threshold temperature as 32 °F (0 °C). This also makes conversion to °Celsius GDD's much easier. We set an upper threshold temperature of 95°F. Several additional constraints on maximum and minimum temperature were introduced to eliminate very low and high temperatures that prevent or retard growth.[^3][^4] They are:

1. If daily Max or Min Temp < 32°F (0°C) it's set equal to 32°F (0°C). Prior to Haun stage 2.0, (395 GDD accumulated since planting);
2. If daily Max Temp > 70°F (21°C) then it's set equal to 70°F (21°C). After Haun stage 2.0;
3. If daily Max Temp > 95°F (35°C) it's set equal to 95°F (35°C).


|Stage|Stage Name|Stage Description|Accumulated GDDs Required|
|-----|----|-----------|----|
|0.5|Emergence Date|Emergence is defined here as the date leaf 1 reaches half of its length (Stage 0.5). The GDD required from planting until emergence depends on planting depth, soil water, soil temperature, surface residue, and soil type. Predicting emergence is the most uncertain part of this model.|180|
|1|Leaf 1 fully extended|Leaf 1 is fully developed when the second leaf is visible in the rolled part of leaf 1.|252|
|2|Leaf 2 fully extended|Leaf 2 is fully developed when the third leaf is visible in the rolled part of leaf 2. This is the same concept for leaves 2 through 7.|395|
|3|Leaf 3 (Tillers Begin To Emerge)|Tillering begins at a Haun stage of 2.0 to 2.5, but tillers are not visible until Haun stage of 3.0-3.5|538|
|4|Leaf 4|Leaf 4 fully extended|681|
|5|Leaf 5 (Tillering ends)|Cool, moist weather, and abundant N fertilizer will extend tillering period|824|
|6|Leaf 6 (Tillering ends)|Cool, moist weather, and abundant N fertilizer will extend tillering period|967|
|7|Leaf 7 fully extended.|Severe drought stessed plants may pass directly to stage 9.|1110|
|7.5|Flag Leaf Visible||1181|
|8|Flag Leaf Emerged|The flag leaf (Leaf 8) is fully developed when the flag leaf collar is visible|1255|
|9|Boot Swelling Begins|Flag leaf stem elongates elevating the flag leaf above the previous leaf. This usually ends with the first signs of boot swelling.|1396|
|10|Boot Completed|Complete when awns become visible at the flag leaf collar.|1539|
|10.2|Heading Begins|Heading begins when the head begins to emerge through the flag leaf collar.|1567|
|11|Headed (Head Extenstion Begins)|Heading is complete when the head has completely cleared the collar and head extension begins. Head extension refers to continued growth of the stem which raises the head about the flag leaf. Head extension is usually complete when flowering begins.|1682|
|11.4|Flowering Begins|Flowering or anthesis begins about in the middle of the head, and simultaneously progresses toward the top and the bottom of the head.|1739|
|11.6|Flowering Completed|Most tillers (T0, T1, T2 tillers) flower within a few days of the main stem. Later-emerging tillers flower later, and are the most common source of green nuisance heads at swathing time.|1768|
|12|Kernel Watery Ripe|During watery ripe stage the kernel length and width are established, but little dry matter is accumulated.|1825|
|13|Early Milk|A white, milk-like fluid can be squeezed from the kernel||
|14|Early Dough|During the dough stages, kernel water content continues to decrease as more and more dry matter is accumulated.||
|14.5|Soft Dough|||
|15|Hard Dough|By the end of the hard dough stage, the kernel reaches physological maturity. Reductions in yield after this stage result from harvest losses and/or environmental injuries such as sprouting and hail.||
|15.4|Swathing can begin|||
|15.6|Physiological Maturity|The kernel is hard, but can still be dented with a thumbnail. The plant is completely yellow. Swathing is still necessary.||
|16|Ripe (Kernel Hard)|Kernel is dry, brittle, and hard. It can no longer be dented with thumbnail and, if crushed, it splits into pieces.||
|16.4|Direct Combining|Water content is low enough for direct (straight) combining||

## References