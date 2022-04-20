library(rtweet)
source(file="src/openstreetmap_url.R")

compose_tweet_text <- function(postcode, latitude, longitude, altitude){
  # composes the text of the tweet, including the url to a
  # openstreetmap view of the same patch:
  openstreetmap_url <- get_openstreetmap_url(latitude, longitude)
  text_string = 
    paste(
      paste0(postcode, ':'),
      paste0("(", latitude, ",", longitude, ")"),
      paste0(altitude, "m above sea level"),
      "->",
      openstreetmap_url)
    if (nchar(text_string)>280){
      print('tweet too long?', length(text_string))
      print(text_string)
      stop('cannot tweet more than 280 characters')
    }
    return(text_string)
}


get_twitter_mapbot_token <- function(){
  return(
    rtweet::create_token(
      # this uses secret keys set in my local environment specification file (~/.Renviron)
      app = "brighton mapbot",
      consumer_key    = Sys.getenv("TWITTER_API_KEY"),
      consumer_secret = Sys.getenv("TWITTER_API_KEY_SECRET"),
      access_token    = Sys.getenv("TWITTER_MAPBOT_ACCESS_TOKEN"),
      access_secret   = Sys.getenv("TWITTER_MAPBOT_ACCESS_TOKEN_SECRET") 
    )
  )
}

post_mapbot_tweet <- function(random_point_tb, image_payload){
  # composes and sends a tweet and image at the requested point
  # 1. open up access to mapbot account on twitter to get an access token. 
  # 2. post the tweet plus image using token.
  tweet_text <- compose_tweet_text(
    random_point_tb$Postcode,
    random_point_tb$Latitude,
    random_point_tb$Longitude,
    random_point_tb$Altitude
  )
  print(paste0('about to post:', tweet_text))
  rtweet::post_tweet(
    status=tweet_text,
    media=image_payload,
    token=get_twitter_mapbot_token()
  )
  # rtweet::post_tweet(
  #   status=tweet_text,
  #   media=image_payload,
  #   token=posting_token
  # )
  
}


