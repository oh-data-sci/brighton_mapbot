brighton twitter bot
===
# introduction
this is a project to build the brighton mapbot, a twitter bot (`@brighton_mapbot`) which posts a tweet every 6 hours with:

- a randomly selected postcode within bn1 (brighton, uk).
- a satellite photograph of that spot.
- a link to openstreetmap showing the same patch
- altitude over sea level assigned to that postcode. 

the photographs are sourced from [mapbox.com](https://mapbox.com). the bot is run as a github action.

please note that very little of this code is originally mine. this project is merely a copy the work of the very clever [matt dray](https://twitter.com/mattdray) from [here](https://github.com/matt-dray/londonmapbot). the talented matt presented his bot (`@londonmapbot`) with flair to the londonR meeting in february 2022 (see [here](https://www.ascent.io/london-r-february-gathering-welcometoascent-followup) for a recording well worth your time).

the minor differences between this effort and matt's include:

- matt could get away with setting a rectangular bounding box (with the latitude limits independent of the longitude limits and vice versa) delimiting central london. that doesn't work well for brighton, as many of the chosen points would land in the ocean. instead, `@londonmapbot`'s "cousin in brighton" reads in a data file, downloaded from [doogal](https://www.doogal.co.uk/UKPostcodes.php), containing a list of all the postcodes within brighton and hove, along with their gps coordinates (latitude, longitude in fractional degrees), and altitude. the bot randomly selects one of these postcodes, and a zoom level, for the satellite image. 

- twitter's api access keys have are different versions: `rtweet`

# instructions - short version
- copy or clone this repository to your system.
- sign up for a twitter account [here](twitter.com).
    + or use a previously set up twitter account.
    + apply for a developer access and eleveted api access.
    + create a twitter  app.
    + generate api access key, access key secret, and bearer token for this account and store as environment variables in `~/.Renviron` file on the root of your home directory.
    + create an app.
- sign up for an account with [mapbox.com](https://mapbox.com/), if not already established.
    + generate an api key and save in the `~/.Renviron` file.
- fetch a postcode data file of interest from [doogal](https://www.doogal.co.uk/UKPostcodes.php. and save in the repository's `data/` folder
- install required packages: `rtweet`, `tidyverse`.
- edit the `filepath`  variable in `run.R` to point to the postcode datafile(s) just downloaded


# detailed instructions
## set up access to twitter's api
twitter is more often accessed from python than it is from `R`, and consequently there are a lot more examples and tutorials available for python than there are for `R`. nevertheless, there are a number of `R` packages that support accessing twitter's api from within an `R` session. i am aware of:

- `rtweet`
- `twitteR`
- `streamR`
- `RTwitterAPI`

these seem mostly intended to fetch data from twitter (and then do some analysis on that data). most of the tutorials, instructions, and documentation focus on that use case. only the first two packages allow an `R` session to post content to twitter, which is what our bot application is meant to do. 

following matt's lead, we use first of those two packages, `rtweet`. the documentation for that package recommends using twitter's oauth v1.0 support (and not v2.0). 

that packages instructions on how to set up the access key are defunct (dead link to [here](https://rtweet.info/articles/auth.html)). nevermind, we

first of all we need to note that though twitter offers 
following instructions from [here](https://theusualstuff.com/generate-twitter-consumer-key-access-token/), am building a twitter bot with the intention of using github actions to run an r-script to fetch satellite images from mapbox and tweet them out. 

the steps involved opening up a new twitter account (using seniordatascientistoh@gmail.com), as @brighton_mapbox, andt creating a new app


## setup mapbox access
this step is much easier. set up [instructions here] (https://docs.mapbox.com/help/getting-started/access-tokens/#how-access-tokens-work)

## set up github actions:

