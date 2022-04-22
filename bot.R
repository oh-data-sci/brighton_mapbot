# main program. loads helper functions and runs them in order. 
library(tidyverse)

## load helper functions:
source(file='src/prep_coordinates.R')
source(file='src/send_mapbox_requests.R')
source(file='src/send_tweet.R')

path_to_data_folder = "data/"
filepaths <- list.files(path="data", pattern=".*_postcodes.csv")
  # brighton and hove postcodes from: https://www.doogal.co.uk/UKPostcodes.php
  # see here for column descriptions: https://www.doogal.co.uk/PostcodeCsvFields.php
  # 'data/BN1_postcodes.csv', - brighton
  # 'data/BN2_postcodes.csv', - kemptown-marina-rottingdean
  # 'data/BN3_postcodes.csv'  - hove

# randomly choose one area file
filepath = paste0(path_to_data_folder, sample(filepaths, 1))
# read postcode data file in csv format.
post_code_df <- fetch_postcode_coordinates(filepath)
random_point_tb <- dplyr::slice_sample(post_code_df,n=1)
print(random_point_tb)
image_filepath <- fetch_image_of_coordinates_from_mapbox(
  random_point_tb$Latitude, 
  random_point_tb$Longitude)

print(paste('posting a tweet:', 
            random_point_tb$Postcode, ":",
            paste0(
              '(',random_point_tb$Latitude,',', 
              random_point_tb$Longitude,')'),
            image_filepath))

post_mapbot_tweet(random_point_tb, image_filepath)

