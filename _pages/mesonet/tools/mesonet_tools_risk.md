---
permalink: /mesonet/ag_tools/risk/
title: "Livestock Risk Index Calculation"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---

## The Livestock Risk Index

The Livestock Risk Index (also known as the Comprehensive Climate Index), uses temperature, relative humidity, wind speed and solar radiation to produce an adjusted temperature value that represents risk to livestock [^1]. The index is output in °C, and the index stress levels for hot and cold conditions are provided in the table below:

|Stress Level|Hot Conditions|Cold Conditions|
|||Newborn|Adult|
|-|-|-|-|
|No Stress|<25|>5|>0|
|Mild|25 to 30|0 to 5| 0 to -10|
|Moderate|>30 to 35|<0 to -5|<-10 to -20|
|Severe|>25 to 40|<-5 to -10|<-20 to -30|
|Extreme|>40 to 45|<-10 to -15|<-30 to -40|
|Extreme Danger|>45|<-15|<-40|

<sub>This table is adapted from Mader et al. 2010</sub>

The Livestock Risk Index is calculated by correcting relative humidity, wind speed, and solar radiation values so they can be used to adjust temperature:

<span style="font-size: 0.8rem">
$$
RH_{cor} = \exp{(0.00182 \times RH_{avg} + 1.8 \times 10^{-5} \times T_{avg} \times RH_{avg})} \times (0.000054 \times T_{avg}^2 + 0.00192 \times T_{avg} - 0.0246) \times (RH_{avg} - 30)
$$
</span>

<span style="font-size: 0.8rem">
$$
WS_{cor} = \frac{-6.56}{\exp{\left[ \frac{1}{(2.26 \times WS + 0.23)^{0.45}} \times (2.9 + 1.14 \times 10^{-6} \times WS^{2.5}-\log_{0.3}(2.26 \times WS + 0.33)^{-2}) \right]}} - 0.00566 \times WS^2 + 3.33
$$
</span>

<span style="font-size: 0.8rem">
$$
RAD_{cor} = 0.0076 \times RAD_{avg} - 0.00002 \times RAD_{avg} \times T_{avg} + 0.00005 \times T_{avg}^2 \sqrt{RAD_{avg}} + 0.1 \times T_{avg} - 2
$$
</span>

$$
Livestock\ Risk\ Index = T_{avg} + RH_{cor} + WS_{cor} + RAD_{cor}
$$

where $T_{avg}$ is average temperature (°C), $RH_{avg}$ is average relative humidity (%), $WS_{avg}$ is average wind speed (mph), and $RAD_{avg}$ is average solar radiation (W/m^2). Variables ending in "cor" are the corrected values for calculation the index. 

[^1]: [Mader TL, Johnson LJ, Gaughan JB. A comprehensive index for assessing environmental stress in animals. J Anim Sci. 2010 Jun;88(6):2153-65. doi: 10.2527/jas.2009-2586. Epub 2010 Jan 29. Erratum in: J Anim Sci. 2011 Sep;89(9):2955. PMID: 20118427.](https://digitalcommons.unl.edu/cgi/viewcontent.cgi?article=1004&context=extfacpub)