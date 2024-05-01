library(magrittr)
library(ggplot2)
con <-
  DBI::dbConnect(RPostgres::Postgres(),
                 host = "??",
                 dbname = "??",
                 user = "??",
                 password = "??"
  )

qc_vals <- dplyr::tbl(con, RPostgres::Id(schema = "data", table = "station_elements")) %>%
  dplyr::filter(
    station == 'aceabsar',
    is.na(date_end)
  ) %>%
  dplyr::select(element, range_min, range_max, step_size, persistence_delta, flag_min, flag_max, shared_sensor) %>% 
  dplyr::collect()

dplyr::tbl(con, RPostgres::Id(schema = "data", table = "elements")) %>% 
  dplyr::select(element, description_short, base_units) %>% 
  dplyr::collect() %>% 
  dplyr::right_join(qc_vals, by='element') %>% 
  dplyr::select(-element) %>% 
  dplyr::rowwise() %>% 
  dplyr::mutate(
    description_short = stringr::str_split_1(
      description_short, "@"
    ) %>% 
      head(1) 
  ) %>% 
  dplyr::distinct() %>% 
  dplyr::arrange(description_short) %>% 
  readr::write_csv("~/git/mco-website/assets/qaqc_vals.csv")
