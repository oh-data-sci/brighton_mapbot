# main program. loads helper functions and runs them in order.  ----

# 0. load helper functions: ----
if (!require('tidyverse', character.only=TRUE)) {
  install.packages('tidyverse', dependencie=TRUE)
  library('tidyverse', character.only=TRUE)
}
source(file='src/prep_coordinates.R')
source(file='src/send_mapbox_requests.R')
source(file='src/send_tweet.R')

path_to_data_folder = "data/"

# 1. select random coordinates ----
random_point_tb <- get_random_postcode(path_to_data_folder)

# 2. from coordinates to satellite image ----
image_filepath <- 
  fetch_image_of_coordinates_from_mapbox(
    random_point_tb$Latitude, 
    random_point_tb$Longitude)

# 3. post as a tweet ----
post_mapbot_tweet(random_point_tb, image_filepath)
print(paste(
  Sys.Date(), Sys.time(),
  'posted the following tweet:',
  random_point_tb$Postcode, ":",
  paste0(
    '(',random_point_tb$Latitude,',',
    random_point_tb$Longitude,')'),
  image_filepath))
