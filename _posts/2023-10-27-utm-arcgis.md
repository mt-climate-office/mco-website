---
title: "How to Set Up UTM and ArcGIS on a Mac"
categories:
  - Guides
tags:
  - UTM
  - ArcGIS
  - How to
author: Kyle Bocinsky
wide: true
---

Below is a tutorial on how to spin up a Windows virtual machine and install ArcGIS on the new Mac machines with Apple Silicon chips.

<head>
    <script src="https://cdn.jsdelivr.net/npm/showdown@1.9.1/dist/showdown.min.js"></script>
</head>
<div id="response-container"></div>
<script>
    const url = 'https://raw.githubusercontent.com/mt-climate-office/technical-guides/master/arcgis_mac/arcgis_mac.md?token=GHSAT0AAAAAACGGKBDBCBY5BZDPLKS7CUEGZJ4DRQQ'

    const responseContainer = document.getElementById('response-container');

    fetch(url, {
      method: 'GET',
    })
    .then(response => {
      if (response.ok) {
        return response.text();
      } else {
        throw new Error('Failed to fetch data');
      }
    })
        .then(markdownText => {
          const converter = new showdown.Converter();
          const htmlText = converter.makeHtml(markdownText);
          responseContainer.innerHTML = htmlText;
    })
    .catch(error => {
      // Handle any errors
      console.error(error);
    });
</script>
