---
permalink: /mesonet/ag_tools/feels_like/
title: "Feels Like Temperature Calculation"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---

The "Feels Like" temperature is a combination of the heat index, wind chill, and air temperature. Wind chill combines the air temperature and wind speed to provide a real feel temperature when temperatures are less than 50°F and wind speed is greater than 3 mph[^1]:  

$$
Wind Chill (°F) = 35.74 + 0.6215T -35.75(V^0.16)+0.4275T(V^0.16) 
$$

where T is the temperature in °F and V is wind speed in miles per hour. When temperatures are above 80 °F, the heat index is used to calculate the feels like temperature. The heat index combines temperature and relative humidity to provide a real feel temperature in warm conditions[^2]:

<span style="font-size: 0.45rem">
$$
HI = -42.379+2.04901523*T+10.14333127*RH-0.22475541*T*RH-0.00683783*T*T-0.05481717*RH*RH+0.00122874*T*T*RH+0.00085282*T*RH*RH-0.00000199*T*T*RH*RH
$$
</span>

where T is the temperature in °F and RH is the relative humidity expressed as percent. If RH is less than 13% and the temperature is between 80 and 112 °F, the following is subtracted from the HI value given above:

$$
((13-RH)/4)*\sqrt{(17 - |T-95|)/17}
$$

If RH is greater than 85% and the temperature is between 80 and 87°F, the following is added to the HI value given above:

$$
((RH-85)/10)*((87-T)/5)
$$

If the temperature, wind speed, or relative humidity don't meet the criteria for calculating the wind chill or heat index, raw temperature is used to calculate the feels like temperature. Below is an example API call to access the feels like temperature:

[https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-12-01&end_time=2023-12-15&elements=etr&premade=True](https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-12-01&end_time=2023-12-15&elements=etr&premade=True)
<div style="width: 100%; height: 300px;"><iframe style="width: 100%; height: 300px;" src="https://mesonet.climate.umt.edu/api/derived/daily?stations=crowagen&start_time=2023-12-01&end_time=2023-12-15&elements=etr&premade=True" frameborder="0px"></iframe></div>

[^1]: [https://www.weather.gov/media/epz/wxcalc/windChill.pdf](https://www.weather.gov/media/epz/wxcalc/windChill.pdf)
[^2]: [https://www.wpc.ncep.noaa.gov/html/heatindex_equation.shtml](https://www.wpc.ncep.noaa.gov/html/heatindex_equation.shtml)