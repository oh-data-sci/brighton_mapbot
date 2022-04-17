# main program. loads helper functions and runs them in order. 

library(tidyverse)

# load helper functions
source(file='src/prep_coordinates.R')
source(file='src/send_mapbox_requests.R')
source(file='src/send_tweet.R')

# brighton and hove postcodes
filepaths <- c(
  'data/BN1_postcodes.csv', # brighton
  'data/BN2_postcodes.csv', # kemptown-marina-rottingdean
  'data/BN3_postcodes.csv'  # hove
)

# randomly choose one brightonian area 
filepath = sample(filepaths, 1) # brighton: lati=50.82253 and long=-0.137163

post_code_df <- fetch_postcode_data(filepath)

random_point_tb <- choose_point_coordinates(post_code_df)
generate_request_url(
  random_point_tb$Latitude, 
  random_point_tb$Longitude,
  Sys.getenv("MAPBOX_PUBLIC_ACCESS_TOKEN")
)

image_file <- fetch_image_of_coordinates_from_mapbox(
  random_point_tb$Latitude, 
  random_point_tb$Longitude,
  access_token=Sys.getenv("MAPBOX_PUBLIC_ACCESS_TOKEN"))

openstreemap_url <- get_openstreetmap_url(random_point_tb$Latitude, random_point_tb$Longitude)

post_mapbot_tweet()

max(post_code_data$Latitude)
max(post_code_data$Latitude)
min(post_code_data$Latitude)
chosen_point_tb = choose_point_coordinates(post_code_df)
print(chosen_point_tb)

hist(post_code_df$Latitude)
hist(post_code_df$Longitude)
plot(post_code_df$Longitude, post_code_df$Latitude)
range_lati <- max(post_code_df$Latitude) - min(post_code_df$Latitude)
stepsize_lati = range_lati/1000.0
stepsize_long = stepsize_lati
