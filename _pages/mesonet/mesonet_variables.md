---
layout: single
permalink: /mesonet/variables/
title: "Variables Measured"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Variables Measured"
  nav: mesonet-sidebar
---

# Variables Measured at Montana Mesonet Stations

Below is a list of all variables measured at Montana Mesonet stations. Variables measured and the measurement interval differs between the AgriMet and HydroMet. AgriMet stations take a reading every 10 seconds, these readings are averaged (or totalled for precipitation) in the 15-minute data that is reported by the MCO. The HydroMet stations take readings every 3 seconds, with the readings being averaged (or totalled for precipitation) in the 5-minute data that is reported by the MCO (except for precipitation, soil data, and snow depth, which are read every 1, 5, and 5 minutes, respectively). To see exactly which variables are measured at a given station, visit the `elements` endpoint of our API for a given station (e.g. [https://mesonet.climate.umt.edu/api/elements/acebozem](https://mesonet.climate.umt.edu/api/elements/acebozem))

| Variable | Description | Reported Units |
|----------|-------------|-------|
|Air Temperature|The average temperature over the reporting period at 2 meters above the ground (for the HydroMet; 2.44 meters for the AgriMet)|degF|
|Atmospheric Pressure|The average atmospheric pressure over the reporting perod measured at the station|millibar|
|Precipitation|The total precipitation recorded since the last report|inches|
|Precipitation Max Rate|The maximum rate of precipitation since the last report|inches hr^-1|
|Relative Humidity|The average relative humidity of the air over the reporting period|%|
|Soil Bulk EC|The electrical conductivity of the soil at a given depth|mS cm^-1|
|Soil VWC|The volumetric water content of the soil at a given depth|%|
|Soil Temperature|The temperature of the soil at a given depth|degF|
|Snow Depth|The depth of the snow on the ground|inches|
|Solar Radiation|The average incoming solar radiation over the reporting period.|W m^-2|
|Well Water Level|The depth of the water level in the groundwater well|inches|
|Well EC|The electrical conductivity of the groundwater well.|mS cm^-1|
|Wind Gust Speed| The maximum wind speed observed over a reporting interval|mi hr^-1|
|Wind Speed|The average wind speed since the last report|mi hr^-1|
|Wind Direction|The average wind direction since the last report|arcdeg|