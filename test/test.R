
library(testthat)
# see here https://testthat.r-lib.org/reference/index.html
# and here: https://codingclubuc3m.rbind.io/post/2019-11-26/

# collated test input:
input_df <- data.frame(
  latitude= 50.842,
  longitude=-0.1142,
  token="test",
  zoom=15
)


# expect_identical(a, b)
# expect_equal(my_good_sum(0.1, 0.2), 0.3)

error_report <- function(fun_name, input, output, expected){
  print(paste("failed test of function:", fun_name))
  print(paste("input:   ", input))
  print(paste("output:  ", output))
  print(paste("expected:", expected))
}


source("src/send_mapbox_requests.R")
test_generate_request_url<- function(){
  generated <- generate_request_url(
      input_df$latitude,
      input_df$longitude,
      input_df$token)
  expected  <- "https://api.mapbox.com/styles/v1/mapbox/satellite-v9/static/-0.1142,50.842,15,0/600x400@2x?access_token=test"
  if (generated != expected){
    error_report('test_generate_request_url', input_df, generated, expected)
    stop('test_failed')
  }
  return()
}

source("src/openstreetmap_url.R")
test_get_openstreetmap_url<- function(){
  expected <- "https://www.openstreetmap.org/#map=15/50.842/-0.1142"
  generated <- get_openstreetmap_url(
    input_df$latitude,
    input_df$longitude,
    input_df$zoom)
  if (generated != expected){
    print(generated)
    error_report("test_get_openstreetmap_url", input_df, generated, expected)
    stop('test_failed')
  }
}

# run tests
test_generate_request_url()
test_get_openstreetmap_url()

expect_equal(
  compose_tweet_text('BN1 3AP',50.830494,-0.14906,53),
  "BN1 3AP: (50.830494,-0.14906) 53m above sea level -> https://www.openstreetmap.org/#map=17/50.830494/-0.14906"
)

expect_equal(
  get_openstreetmap_url(50.842, -0.1142, 15),
  "https://www.openstreetmap.org/#map=15/50.842/-0.1142"
)

