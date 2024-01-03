---
permalink: /mesonet/ag_tools/etr/
title: "Reference Evapotranspiration Calculation"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---

Reference evapotranspiration (ETr) is defined as the potential water lost to evaporation and plant transpiration from a reference surface:
> The reference surface is a hypothetical grass reference crop with an assumed crop height of 0.12 m, a fixed surface resistance of 70 s m<sup>-1</sup> and an albedo of 0.23. The reference surface closely resembles an extensive surface of green, well-watered grass of uniform height, actively growing and completely shading the ground. The fixed surface resistance of 70 s m<sup>-1</sup> implies a moderately dry soil surface resulting from about a weekly irrigation frequency.[^1] 

To calculate ETr, we use the Food and Agriculture Organization's [Penman-Monteith ETr algorithm](https://www.fao.org/3/x0490e/x0490e08.htm). This method allows ETr to be calculated with using either hourly or daily meteorological observations collected at our Mesonet stations. With this method, daily ETr is calculated as:

$$
ET_r = \frac{0.408 \Delta (R_n - G) + \gamma \frac{900}{T + 273} u_2 (e_s - e_a)}{\Delta + \gamma (1 + 0.34 u_2)}
$$

where:
- $ET_r$ is the reference surface evapotranspiration (mm/day)
- $R_n$ is the net radiation at the crop surface (MJ/m<sup>2</sup>/day)
- $G$ is soil heat flux (MJ/m<sup>2</sup>/day)
- $T$ is the average temperature (°C)
- $u_2$ is the wind speed at 2 meters height (m/s)
- $e_s$ is the saturation vapor pressure (kPa)
- $e_a$ is the actual vapor pressure (kPa)
- $\Delta$ is the slope of the vapor pressure curve (kPa/°C)
- $\gamma$ is the psychrometric constant (kPa/°C)

For more details about how ETr is calculated and how meteorological data are used to derive these variables, please visit the following webpage: [https://www.fao.org/3/x0490e/x0490e08.htm](https://www.fao.org/3/x0490e/x0490e08.htm)

[^1]: [https://www.fao.org/3/X0490E/x0490e05.htm](https://www.fao.org/3/X0490E/x0490e05.htm)