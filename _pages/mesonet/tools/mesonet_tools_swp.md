---
permalink: /mesonet/ag_tools/swp/
title: "Soil Water Potential Calculation"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---

## Soil Water Potential 

Soil water potential is the amount of pressure that must be applied to the soil to move water through the soil column. In the context of agriculture, it can be thought of as the amount of energy crop roots must exert to obtain water. When the soil water potential approaches zero, it is easy for crops to obtain water. As the potential becomes more and more negative, it becomes increasingly harder for crops to obtain water. At a potential of -1500 kPa, the "wilting point" is reached, and the water in the soil becomes unavailable to plants. Because soil water potential is not a relative measure, it is a more objective measure for assessing crop stress.

## Water Potential Curve Derivation

Soil water potential varies by soil type, so soil samples are needed for it to be calculated. At select Montana Mesonet stations, soil samples have been collected, allowing for the derivation of soil water potential curves in our lab. In this process, the soil samples are saturated and progressively dried. The potential is then measured at various points in the drying process. With these data points, the Fredlund-Xing (FX) [^1] function is parameterized, which allows soil water content to be calculated from water potential. We then invert the FX equation to solve for soil water potential. This allows us to provide realtime estimates of soil water potential using measured volumetric water content:

$$
SWP = h \times \left( (\exp\left( \frac{s - r}{VWC - r} \right)^{\frac{1}{m}} - \exp(1))^{\frac{1}{n}} \right)
$$

where $h$, $s$, $r$, $m$ and $n$ are the parameters fit to the FX model, VWC is soil volumetric water content (m^3/m^3), and SWP is soil water potential (kPa)

[^1]: Fredlund, D. G., & Xing, A. (1994). Equations for the soil-water characteristic curve. Canadian geotechnical journal, 31(4), 521-532.