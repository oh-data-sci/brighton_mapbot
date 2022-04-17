library(rtweet)

post_mapbot_tweet <- function(tweet_text, image_payload){
  # sends a tweet with the requested text and image
  # 1. open up access to mapbot account on twitter to get an access token. 
  # 2. post the tweet plus image using token.
  mapbot_token <- rtweet::create_token(
    # this uses secret keys set in my local environment specification file (~/.Renviron)
    app = "brighton mapbot",
    consumer_key    = Sys.getenv("TWITTER_API_KEY"),
    consumer_secret = Sys.getenv("TWITTER_API_KEY_SECRET"),
    access_token =    Sys.getenv("TWITTER_BEARER_TOKEN")
  )
  
  rtweet::post_tweet(
    status=tweet_text,
    media=image_payload,
    token=mapbot_token
  )
}


