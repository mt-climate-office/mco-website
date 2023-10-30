#!/bin/bash

curl -H 'Authorization: token $GH_TOKEN' \
  -H 'Accept: application/vnd.github.v3.raw' \
  -o /data/arcgis_mac.md \
  -L https://api.github.com/repos/mt-climate-office/technical-guides/arcgis_mac/arcgis_mac.md

# * * * * * . $HOME/.env; /git/mco-website/scripts/get_arc_guide.sh