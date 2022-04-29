# helper functions to communicate with mapbox.com:
#   build api request string for mapbox api call for a static satellite image
#   centered on the given coordinates, using the api access token from 
#   the MAPBOX_PUBLIC_ACCESS_TOKEN environmental variable.

# ---- generate_request_url
generate_request_url <-
  function(latitude,    # latitude:  numeric (fractional degrees)
           longitude,   # longitude: numeric (fractional degrees)
           x_px=600,    # x_px: number of width-wise pixels in output image
           y_px=400,    # y_px: number of height-wise pixels in output image
           zoom=15,     # zoom: image scale (i.e. one of c(13,14,15,16,17,18,19))
           token=Sys.getenv("MAPBOX_PUBLIC_ACCESS_TOKEN")
  ){
    base_url <- "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/static/"
    request_url <- 
      paste0(
        base_url,
        round(longitude, 4), # note the order: longitude, latitude:
        ",",
        round(latitude, 4),
        ",",
        zoom,
        ",0/", # 0 deg rotation
        x_px, 
        "x",
        y_px,
        "@2x?access_token=",
        token
      )
    return(request_url)
  }

# ---- fetch_satellite_image_save_to_file
fetch_satellite_image_save_to_file <- 
  function(mapbox_request_url){
    # given a well-formed request url to mapbox, this function fetches the 
    # corresponding image and saves as a file in temporary location
    temp_file <- tempfile(fileext = ".jpeg")
    download.file(mapbox_request_url, temp_file)
    return(temp_file)
  }


# ---- fetch_image_of_coordinates_from_mapbox
fetch_image_of_coordinates_from_mapbox <- 
  function(latitude, longitude, zoom_level=15.5){
    # wrapper function for the two above
    request_url <- generate_request_url(
      latitude, 
      longitude, 
      x_px=600, 
      y_px=400, 
      zoom=zoom_level
    )
    mapbox_image_filepath <- fetch_satellite_image_save_to_file(request_url)
    return(mapbox_image_filepath)
  }






# ---- fetch_image_sequence_of_coordinates_from_mapbox
fetch_image_sequence_of_coordinates_from_mapbox <- 
  function(latitude, longitude, access_token){
    # wrapper function for the two above
    zoom_levels <- c(14.5,15.0, 15.5)
    mapbox_image_filepaths <- c("","","")
    for (idx in 1:3){
      request_url <- generate_request_url(latitude, longitude, access_token, zoom=zoom_levels[idx])
      mapbox_image_filepaths[idx] <- fetch_satellite_image_save_to_file(request_url)
    }
    return(mapbox_image_filepaths)
  }

