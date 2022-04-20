library(tidyverse)
# short script to get to know the postcode file
source(file='src/prep_coordinates.R')

# brighton and hove postcodes
filepaths <- c(
  'data/BN1_postcodes.csv', # brighton
  'data/BN2_postcodes.csv', # kemptown-marina-rottingdean
  'data/BN3_postcodes.csv'  # hove
)

# randomly choose one brightonian area and load their post codes
filepath = sample(filepaths, 1) # brighton: latitude=50.82253 and longitude=-0.137163
post_code_df <- fetch_postcode_data(filepath)
print(paste("file", filepath, 'contains', nrow(post_code_df), 'entries'))

print(paste('latitudes:  from', min(post_code_df$Latitude),  'to', max(post_code_df$Latitude)))
print(paste('longitudes: from', min(post_code_df$Longitude), 'to', max(post_code_df$Longitude)))

hist(post_code_df$Latitude)
hist(post_code_df$Longitude)
plot(post_code_df$Longitude, post_code_df$Latitude)
chosen_point_tb = choose_point_coordinates(post_code_df)
print(chosen_point_tb)

range_lati <- max(post_code_df$Latitude) - min(post_code_df$Latitude)
stepsize_lati = range_lati/1000.0
stepsize_long = stepsize_lati
