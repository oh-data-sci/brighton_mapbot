# main program. loads helper functions and runs them in order. 
library(tidyverse)

## load helper functions:
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

post_code_df <- fetch_postcode_coordinates(filepath)
random_point_tb <- dplyr::slice_sample(post_code_df,n=1)

image_filepath <- fetch_image_of_coordinates_from_mapbox(
  random_point_tb$Latitude, 
  random_point_tb$Longitude,
  access_token=Sys.getenv("MAPBOX_PUBLIC_ACCESS_TOKEN"))
print('posting a tweet!')

post_mapbot_tweet(random_point_tb, image_filepath)

