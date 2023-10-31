---
permalink: /mesonet/qaqc/
title: "Montana Mesonet Quality Control"
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---
# Montana Mesonet Quality Control Procedures
We perform operational and daily quality checks on station data to ensure the data reported by our stations is reliable and accurate. We currently perform four tests that are recommended by [the Oklahoma Mesonet](https://cig.mesonet.org/staff/shafer/Mesonet_QA_final_fixed.pdf):

1. Range Test: For a given measurement, an upper and lower threshold of reasonable measurement values are provided. If the measurement falls outside of those values, a flag is raised.
2. Step Test: For two consecutive measurements of a given variable, the difference between the two values is compared to a maximum allowable “step” size. If the difference is larger than the step size, a flag is raised.
3. Persistence Test: The standard deviation of all values of a given variable over the course of a day is calculated. If the standard deviation is smaller than a specified threshold value, a flag is raised for all values that day.
4. Shared Sensor Test: If a given sensor observes more than one variable, all variables reported for a time step will be removed if a check fails on an associated variable. For example, the rain gauges at HydroMet stations record both precipitation and the maximum rate of precipitation over a 5-minute interval. If the maximum precipitation rate fails any of the three tests listed above but precipitation does not, precipitation will still be flagged by this test. 

Below is a table showing the QA/QC value that are used for each element reported by our stations for all the tests given above. Note that this is an example for the Absarokee HydroMet stations. The values below can change slightly depending on the exact make and model deployed at a station: 

|Element     |Units|Valid Min. Range|Valid Max. Range|Allowed Step Size|Min. Daily Std. Dev.|Shared Element|
|----------------------|----------|---------|---------|---------|-----------------|-------------|
|Air Temperature       |degC      |-80      |60       |10       |0.1              |           |
|Atmospheric Pressure  |kPa       |60       |110      |10       |0.001            |           |
|Bulk EC               |mS cm^-1  |0        |6        |0.5      |0                |           |
|Gust Speed            |m s^-1    |0        |100      |80       |0.1              |wind_spd     |
|Max Precip Rate       |mm hr^-1  |0        |3000     |125      |0                |ppt          |
|Pluviometer Fill Level|mm        |0        |1800     |25       |0                |           |
|Soil Pore EC               |mS cm^-1  |0        |6        |0.5      |0                |           |
|Precipitation         |mm        |0        |500      |25       |0                |ppt_max_rate |
|Soil Rel. Permittivity     |          |1        |100      |0.5      |0                |           |
|Relative Humidity     |percent   |0        |100      |20       |0.1              |           |
|Snow Depth            |cm        |0        |950      |10       |0                |snow_depth_q |
|Snow Depth Quality    |          |0        |600      |600      |0                |           |
|Soil Temperature      |degC      |-40      |60       |5        |0                |           |
|Soil VWC              |percent   |0        |100      |2.5      |0                |           |
|Solar Radiation       |W m^-2    |0        |2000     |800      |0.1              |           |
|Wind Direction        |arcdeg    |0        |360      |360      |0.1              |wind_dir_sd  |
|Wind Direction SD     |arcdeg    |0        |180      |90       |0.1              |wind_dir     |
|Wind Speed            |m s^-1    |0        |100      |40       |0.1              |     |


All the code used to perform these QA/QC checks is open-source and available on our GitHub at [https://github.com/mt-climate-office/mesonet-qc](https://github.com/mt-climate-office/mesonet-qc).