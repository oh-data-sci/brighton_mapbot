set.seed(1)

fetch_postcode_data <- function(filepath){
  # read postcode datafile in csv format. (download from: https://www.doogal.co.uk/UKPostcodes.php)
  post_code_data <- 
    read_csv(filepath) %>% 
    select(Postcode, Latitude, Longitude, "In Use?", "Altitude")
}

choose_point_coordinates <- function(post_code_data){
  # draw a single random point from a dataframe of options
  return(post_code_data[sample(1:nrow(post_code_data), 1),])
}

# determine_angle_ranges_patch <- function(latitude, longitude, width){
#   # latitude: (in fractional degrees)
#   # longitude: (in fractional degrees)
#   # width: in meters
#   delta_latitude = sin(pi*longitude/180.0)
#   delta_longitude = sin(pi*latitude/180.0)
#   
# }
  

expand_point_to_patch <- function(latitude,longitude, delta_lati, delta_long = delta_lati){
  # pad a gps coordinate point  to a patch.
  return(
    data.frame(
      lower_lati = latitude  - delta_lati,
      upper_lati = latitude  + delta_lati,
      lower_long = longitude - delta,
      upper_long = longitude + delta
      )
  )
}