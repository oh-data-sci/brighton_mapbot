# open streetmap request url

# Build the status message (text and URL)
get_openstreetmap_url <- function(latitude, longitude, zoom=17){
  base_url <- "https://www.openstreetmap.org/#map="
  return(paste0(base_url, zoom, "/", latitude, "/", longitude))
}