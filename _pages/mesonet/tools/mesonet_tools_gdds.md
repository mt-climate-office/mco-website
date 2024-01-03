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

Daily GDDs are calculated as follows. If there are low or high cutoff temperature thresholds for a given crop, the daily minumum ($T_{min}$) and maximum ($T_{max}$) temperature are clipped to that range. For example, if the low cutoff temperature is 35°F, the high cutoff is 80°F, $T_{min}$ is 32°F, and $T_{max}$ is 82°F, $T_{min}$ and $T_{max}$ would be set to 35°F and 80°F, respectively. Once the values are adjusted to the propper range, the daily average temperature  ($T_{avg}$) is calculated from the clipped daily $T_{min}$ and $T_{max}$:

$$
T_{avg} = (T_{min} + T_{max}) / 2
$$

Finally, the daily total GDD units are calculated by subtracting the minumum temperature threshold from $T_{avg}$:

$$
GDDs = T_{avg} - Minimum Threshold
$$

As the growing season progresses, GDDs are typically summed to help predict and monitor different crop growth stages. 

### Example Mesonet API Call
Daily cumulative GDDs are available both through the dashboard and the Montana Mesonet API. An example API call to see GDD data is available below:

[https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat](https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat)
<div style="width: 100%; height: 300px;"><iframe style="width: 100%; height: 300px;" src="https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-04-01&end_time=2023-07-01&elements=gdd&premade=True&crop=wheat" frameborder="0px"></iframe></div>

## Barley Growing Degree Days

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


## Canola Growing Degree Days

|Stage|Accumulated GDDs Required|
|-----|----|
|Planting|0|
|Seedling|256|
|Rosette - 3rd Leaf|396|
|Rosette - 4th Leaf|727|
|Early Bud|828|
|Late Bud|932|
|Early Flower|1165|
|Late Flower|1397|
|Early Ripening|1634|
|Late Ripening|1874|
|Ripe||


## Corn Growing Degree Days

|Stage|Stage Name|Accumulated GDDs Required|
|-----|----|----|
|VE|Emergence|120|
|V2||200|
|V3||350|
|V6||475|
|V9||610|
|V10||740|
|VT|Tasseling|1135|
|R2||1660|
|R4||1925|
|R5||2450|
|R6||2700|


## Sugarbeet Growing Degree Days

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


## Sunflower Growing Degree Days

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


## Wheat Growing Degree Days

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

