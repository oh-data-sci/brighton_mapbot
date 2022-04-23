# brighton and hove postcodes from: https://www.doogal.co.uk/UKPostcodes.php
# 'data/BN1_postcodes.csv', - brighton
# 'data/BN2_postcodes.csv', - kemptown-marina-rottingdean
# 'data/BN3_postcodes.csv'  - hove

fetch_postcode_coordinates <- function(filepath){
  # given path to postcode data file, 
  # (downloaded from: https://www.doogal.co.uk/UKPostcodes.php
  # see here for column descriptions: 
  # https://www.doogal.co.uk/PostcodeCsvFields.php)
  # read file in csv format, select columns of interest and return a tibble
  post_code_data <- 
    read_csv(filepath, guess_max=5000) %>% 
    select("Postcode", "Latitude", "Longitude", "Altitude", "Average Income")
  return(post_code_data)
}


get_random_postcode <- function(path_to_data_folder){
  # given path to folder with postcode csv files, select one at random,
  # read it into a tibble, then select a row at random.
  filepaths <- list.files(path=path_to_data_folder, pattern=".*_postcodes.csv")
  filepath = paste0(path_to_data_folder, sample(filepaths, 1))
  # read postcode data file in csv format.
  post_code_df <- fetch_postcode_coordinates(filepath)
  # select 1 postcode at random
  return(dplyr::slice_sample(post_code_df, n=1))
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
