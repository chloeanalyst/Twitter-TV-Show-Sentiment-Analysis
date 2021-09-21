library(rtweet)
library(tidyverse)
library(tidytext)
library(textdata)
library(lubridate)
library(RSQLite)


conn <- dbConnect(RSQLite::SQLite(), "GBBO_Tweets.db")

dbExecute(conn, "CREATE TABLE GBBO_Tweets(
                                           created_at TEXT,
                                           text TEXT,
                                           media_url TEXT,
                                           media_type TEXT
                                           )")



tweets <- search_tweets(  # Collect Tweets.
  "#GBBO",  # Hashtag you would like to analyse
  n = 10000, # Increase to collect the number of tweets you are interested in.
  lang = "en", # Language of tweets
  include_rts = FALSE, # Exclude duplicated retweeted Tweets
  retryonratelimit = TRUE # If TRUE script will sleep until rate limit has reset.
                        ) #Calculates the word count of each tweet (not used in output but is useful for checking quality).


tweets <- tweets %>% select(created_at, text, media_url, media_type)

tweets$created_at <- as.character(as.Date(tweets$created_at))
tweets$media_url <- unlist(tweets$media_url)
tweets$media_type <- unlist(tweets$media_type)

tweets <- as.data.frame(tweets)


dbWriteTable(conn, "GBBO_Tweets", tweets, append = T)

dbDisconnect(conn)

