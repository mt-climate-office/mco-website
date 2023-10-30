library(magrittr)
library(leaflet)

setwd("~/git/mco-website")

mt <- mcor::mt_state_simple %>% 
  sf::st_transform(4326)


stations <- readr::read_csv(
  "https://mesonet.climate.umt.edu/api/v2/stations?type=csv", 
  show_col_types=FALSE
) %>% 
  sf::st_as_sf(coords=c("longitude", "latitude"), crs = 4326) %>%
  dplyr::mutate(
    name = glue::glue("{name} ({sub_network})"),
    elevation = glue::glue("{round(elevation * 3.281)} ft."),
    lab = glue::glue(
      "<b>Station:</b> {name} <br> 
      <b>Elevation:</b> {elevation} <br> 
      <b>Install Date:</b> {date_installed} <br>
      <b>Visualize Data:</b> <a href='https://mesonet.climate.umt.edu/dash/{station}/' target='_blank'> Mesonet Dashboard</a> <br>
      <b>Latest Data:</b> <a href='https://mesonet.climate.umt.edu/api/v2/latest/?stations={station}' target='_blank'> Mesonet API</a>"
    )
  )

pal <- colorFactor(c("navy", "red"), domain = c("HydroMet", "AgriMet"))

gesturePlugin = htmltools::htmlDependency("Leaflet.GestureHandling", "1.1.8",
                               src = c(file = "/home/cbrust/git/mco-website/assets/libs/Leaflet.GestureHandling-master/dist"),
                               stylesheet = "leaflet-gesture-handling.min.css",
                               script = "leaflet-gesture-handling.min.js"
)

registerPlugin <- function(map, plugin) {
  map$dependencies <- c(map$dependencies, list(plugin))
  map
}

m <- leaflet(stations) %>% 
  registerPlugin(gesturePlugin) %>% 
  addTiles() %>% 
  addCircleMarkers(
    color = ~pal(sub_network),
    # radius = 6, 
    fillOpacity = 0.75,
    clusterOptions = markerClusterOptions(
      freezeAtZoom = 11,
      zoomToBoundsOnClick = T),
    popup = ~lab, label = ~name
  ) %>% 
  addPolygons(data = mt, color="#444444", fillColor = NA, fillOpacity = 0) %>% 
  addLegend(pal = pal, values = ~sub_network, title="Sub Network") %>%
  setView(lat=47.05217, lng=-109.633, zoom=5.5)

htmlwidgets::saveWidget(m, "./assets/maps/mesonet_map.html", selfcontained = TRUE)
