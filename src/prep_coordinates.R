fetch_postcode_coordinates <- function(filepath){
  # read postcode data file in csv format.
  # (downloaded from: https://www.doogal.co.uk/UKPostcodes.php)
  # most columns are of no use to us
  post_code_data <- 
    read_csv(filepath, guess_max=5000) %>% 
    select("Postcode", "Latitude", "Longitude", "Altitude", "Average Income")
  return(post_code_data)
}

# choose_point_coordinates <- function(post_code_data){
#   # draw a single random point from a dataframe of options
#   return(post_code_data[sample(1:nrow(post_code_data), 1),])
# }
# 
# determine_angle_ranges_patch <- function(latitude, longitude, width){
#   # latitude: (in fractional degrees)
#   # longitude: (in fractional degrees)
#   # width: in meters
#   delta_latitude = sin(pi*longitude/180.0)
#   delta_longitude = sin(pi*latitude/180.0)
#   
# }
# expand_point_to_patch <- function(latitude,longitude, delta_lati, delta_long = delta_lati){
#   # pad a gps coordinate point  to a patch.
#   return(
#     data.frame(
#       lower_lati = latitude  - delta_lati,
#       upper_lati = latitude  + delta_lati,
#       lower_long = longitude - delta,
#       upper_long = longitude + delta
#       )
#   )
# }

# cols(
#   .default = col_character(),
#   num = col_double(),
#   Latitude = col_double(),
#   Longitude = col_double(),
#   Easting = col_double(),
#   Northing = col_double(),
#   Introduced = col_date(format = ""),
#   Terminated = col_date(format = ""),
#   `National Park` = col_logical(),
#   Population = col_double(),
#   Households = col_double(),
#   Altitude = col_double(),
#   `London zone` = col_logical(),
#   `Local authority` = col_logical(),
#   `Index of Multiple Deprivation` = col_double(),
#   Quality = col_double(),
#   `User Type` = col_double(),
#   `Last updated` = col_date(format = ""),
#   `Distance to station` = col_double(),
#   `Average Income` = col_double(),
#   `Sewage Company` = col_logical()
#   # ... with 2 more columns
# )
