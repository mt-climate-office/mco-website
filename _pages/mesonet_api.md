---
title: "Montana Mesonet API"
permalink: /mesonet/api/
header:
  overlay_image: /assets/images/mesonet_banner.jpg
excerpt: " <br />"
classes: wide
sidebar:
  title: "Mesonet Resources"
  nav: mesonet-sidebar
---
# Free Station Data
The Montana Climate Office (MCO) is committed to providing free and easily accessed weather data to the public. The MCO provides this data through the [Montana Mesonet API](https://mesonet.climate.umt.edu/api/v2/docs). The API adheres to the REST architecture and provides a variety of useful endpoints for easy data access.

## `latest`
The latest endpoint provides the latest data available at all mesonet stations. Access the data using [https://mesonet.climate.umt.edu/api/v2/stations/](https://mesonet.climate.umt.edu/api/v2/latest/):
<div style="width: 100%; height: 300px;"><iframe style="width: 100%; height: 300px;" src="https://mesonet.climate.umt.edu/api/v2/stations/" frameborder="0px"></iframe></div>

## `stations`
The stations endpoint lists all the stations that are a part of the Montana Mesonet. Access the data using [https://mesonet.climate.umt.edu/api/v2/stations/](https://mesonet.climate.umt.edu/api/v2/stations/):
<div style="width: 100%; height: 300px;"><iframe style="width: 100%; height: 300px;" src="https://data.climate.umt.edu/website/assets/stations.html" frameborder="0px"></iframe></div>

## `photos`
The photos endpoint provides the lates photo available at a given HydroMet station. Access the data using [https://mesonet.climate.umt.edu/api/v2/photos/{station}/{direction}/](https://mesonet.climate.umt.edu/api/v2/photos/aceabsar/s/?force=True):
{% include image.html url="https://mesonet.climate.umt.edu/api/v2/photos/aceabsar/s/?force=True" description="The latest image from the Absarokee HydroMet station" external="true" %}
