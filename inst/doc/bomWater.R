## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bomWater)
library(ggplot2)

## -----------------------------------------------------------------------------
parameters()

## -----------------------------------------------------------------------------
# Get a list of groundwater bores available from water data online
get_station_list(parameter_type = "Ground Water Level")

# Return information for a single station and customise return fields
get_station_list(station_number = "410730")

## -----------------------------------------------------------------------------
# Cotter River at Gingera
get_hourly(
  parameter_type = "Water Course Discharge",
  station_number = "410730",
  start_date = "2020-01-01",
  end_date = "2020-01-31"
)

# Corin Reservoir
get_hourly(
  parameter_type = "Storage Volume",
  station_number = "410742",
  start_date = "2020-01-01",
  end_date = "2020-01-31"
)

## -----------------------------------------------------------------------------
corin <- get_hourly(
  parameter_type = "Storage Volume",
  station_number = "410742",
  start_date = "2020-01-01",
  end_date = "2020-01-31"
)
ggplot(corin, aes(Timestamp, Value)) +
  geom_line() +
  labs(x = "Time", y = "Storage Volume (ML)")

## -----------------------------------------------------------------------------
# Daily mean streamflow from Cotter River at Gingera (in m3/s) between 09-09
get_daily(
  parameter_type = "Water Course Discharge",
  station_number = "410730",
  start_date     = "2020-01-01",
  end_date       = "2020-01-31",
  aggregation    = "09HR"
)

# Daily max, only available over the standard day
get_daily(
  parameter_type = "Water Course Discharge",
  station_number = "410730",
  start_date     = "2020-01-01",
  end_date       = "2020-01-31",
  var            = "max"
)

# Daily mean wind speed at Corin Dam
get_daily(
  parameter_type = "Wind Speed",
  station_number = "570947",
  start_date     = "2020-01-01",
  end_date       = "2020-01-31"
)

## -----------------------------------------------------------------------------
# Monthly total rainfall in mm at Cotter Hut
get_monthly(
  parameter_type = "Rainfall",
  station_number = "570946",
  start_date     = "2019-01-01",
  end_date       = "2019-12-31"
)

# Monthly mean streamflow rate m3/s at Cotter River at Gingera
get_monthly(
  parameter_type = "Water Course Discharge",
  station_number = "410730",
  start_date     = "2019-01-01",
  end_date       = "2019-12-31"
)

# Monthly evaporation at Blowering Dam
get_monthly(
  parameter_type = "Evaporation",
  station_number = "410102",
  start_date     = "2019-01-01",
  end_date       = "2019-12-31"
)
# No data

## -----------------------------------------------------------------------------
# Annual rainfall at Berthong in Cootamundra
berthong <- get_yearly(
  parameter_type = "Rainfall",
  station_number = "41000207",
  start_date     = "2010-01-01",
  end_date       = "2019-12-31"
)

# Example plot
ggplot(berthong, aes(Timestamp, Value)) +
  geom_col() +
  labs(x = "Time", y = "Rainfall (mm/year)")

## -----------------------------------------------------------------------------
# Annual rainfall at Berthong in Cootamundra
berthong <- get_as_stored(
  parameter_type = "Rainfall",
  station_number = "41000207",
  start_date     = "2019-01-01",
  end_date       = "2019-12-31"
)
berthong

