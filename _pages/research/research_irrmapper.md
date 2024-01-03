---
layout: single
title: IrrMapper
permalink: /research/irrmapper/
header:
  overlay_image: /assets/images/research_banner.jpg
  caption: "Photo Credit: Unsplash"
excerpt: " <br />"
classes: wide
sidebar:
  title: "Research"
  nav: research-sidebar
---

# IrrMapper: A Machine Learning Approach for High Resolution Mapping of Irrigated Agriculture Across the Western U.S. 
High frequency and spatially explicit irrigated land maps are important for understanding the patterns and impacts of consumptive water use by agriculture. We built annual, 30 m resolution irrigation maps using Google Earth Engine for the years 1986–2018 for 11 western states within the conterminous U.S. We built an extensive geospatial database of land cover from each of four irrigated- and non-irrigated classes, including over 50,000 human-verified irrigated fields, 38,000 dryland fields, and over 500,000 km^2 of uncultivated lands.

We compared our results to Census of Agriculture irrigation estimates over the seven years of available data and found good overall agreement between the 2832 county-level estimates (r^2 = 0.90), and high agreement when estimates are aggregated to the state level (r^2 = 0.94). We analyzed trends over the 33-year study period, finding an increase of 15% (15,000 km 2 ) in irrigated area in our study region. We found notable decreases in irrigated area in developing urban areas and in the southern Central Valley of California and increases in the plains of eastern Colorado, the Columbia River Basin, the Snake River Plain, and northern California.

Our maps are available on Google Earth Engine and are free to use under the [Creative Commons 4 license](https://creativecommons.org/licenses/by/4.0/legalcode). Plese contact [david2.ketchum@umconnect.umt.edu](david2.ketchum@umconnect.umt.edu) for more information, read our paper at [https://www.mdpi.com/2072-4292/12/14/2328/htm](https://www.mdpi.com/2072-4292/12/14/2328/htm), and view our code repository at [https://github.com/dgketchum/EEMapper/tree/IrrMapper_RF](https://github.com/dgketchum/EEMapper/tree/IrrMapper_RF).

This research was primarily funded by the National Science Foundation under Grant No. 1633831, the University of Montana BRIDGES Fellowship. Additional funding was provided by the Montana Climate Office and the [OpenET project](https://etdata.org/).

{% include image.html url="assets/images/irrmapper_1.png" description="Figure 1: Training data from the irrigated class used to train IrrMapper." external='false' %}

{% include image.html url="assets/images/irrmapper_2.png" description="Figure 2: Training data from the unirrigated classes used to train IrrMapper (i.e., wetlands, dryland agriculture, and uncultivated lands)." %}

{% include image.html url="assets/images/irrmapper_3.png" description="Figure 3: Irrigation status as predicted for the year 2018 by IrrMapper, at 30-m resolution." %}
