# open streetmap request url

# Build the status message (text and URL)
get_openstreetmap_url <- function(latitude, longitude){
  base_url <- "https://www.openstreetmap.org/#map=17/"
  return(paste0(base_url, latitude, "/", longitude))
}


# latlon_details <- paste0(
#   lat, ", ", lon, "\n",
#   "https://www.openstreetmap.org/#map=17/", lat, "/", lon, "/"
# )
