library(magrittr)

dat <- readr::read_csv("https://mesonet.climate.umt.edu/api/v2/stations?type=csv") %>% 
  dplyr::transmute(
    sort_name = name,
    long_name = glue::glue("{name} ({sub_network})"),
    short_name = station
  ) 

fileConn <- file("../_data/stations.yml")

split(dat, dat$sort_name) %>% 
  lapply(function(line) {
    lines <- glue::glue(
      "
      - short_name: {line$short_name}
        long_name: {line$long_name}
      
      "
    )
  }) %>% 
  unname() %>% 
  unlist() %>% 
  writeLines(fileConn)

close(fileConn)