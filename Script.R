library(rtweet)
library(tidyverse)
library(tidytext)
library(textdata)
library(lubridate)


contestants <- c('Aaron', # List of contestants
                 'Sharon',
                 'Liberty',
                 'Hugo',
                 'Shannon',
                 'Jake',
                 'Kaz',
                 'Brad',
                 'Chloe',
                 'Toby',
                 'Faye',

                  )


tweets <- search_tweets(  # Collect Tweets.
                        "#loveisland",  # Hashtag you would like to analyse
                        n = 10, # Increase to collect the number of tweets you are interested in.
                        lang = "en", # Language of tweets
                        include_rts = FALSE, # Exclude duplicated retweeted Tweets
                        retryonratelimit = TRUE # If TRUE script will sleep until rate limit has reset.
                      ) %>% select(text, created_at) %>%
                        mutate(word_count = str_count(text,"\\S+")) #Calculates the word count of each tweet (not used in output but is useful for checking quality).




output <-  tweets %>% unnest_tokens(word,text, drop=FALSE) %>% # Calculate Sentiment.
                      inner_join(get_sentiments("afinn")) %>% # Using AFINN lexicon for sentiment score.
                      group_by(text,created_at) %>%
                      summarise(sentiment_score = sum(value)) # Calculates score for each tweet.


output$created_at <- as.Date(output$created_at) # Change date to date format.



daily_overall <- output %>% group_by(created_at) %>% # Sentiment score per day.
                            summarise(avg_sentiment = mean(sentiment_score),
                                      total_sentiment = sum(sentiment_score)) #Calculates avg and total score.

write.csv(daily_overall,"./data/daily.csv") # Save to CSV.


 
for (i in contestants) {
                        output[[i]] <- ifelse(grepl(i, output$text),i,'') # Creates a column for each contestant. 
                        }                                                 # Contestant name will appear in the row if they appear in the tweet.



output$contestant <- apply(output[4:37], 1, function(x) paste(x[!is.na(x) & x != ""], collapse = ", ")) # Stack columns in to 1 column, 
                                                                                                        # this puts tweets about multiple contestants
                                                                                                        # onto one row seperated by a comma
x <- as.numeric(length(contestants)+4) # Calculating a value to use to subset the output.
                                       # 1. Total number of contestants.
                                       # 2. Total number of columns from the left that we want to subset +1. 

output <- output[c(1:3,x)] # Select required columns (created at, ).


output <- output %>% mutate(contestant = strsplit(gsub("[][\"]", "", contestant), ",")) %>% # Create a new row for any tweets that contain multiple contestants and group to find avg sentiment.
                     unnest(contestant) %>%
                     group_by(created_at,contestant) %>%
                     summarise(avg_sentiment = mean(sentiment_score)) #Add any additional calculations here.


output <- output %>% select(created_at, avg_sentiment, contestant) # Reorder output.

write.csv(output,paste0("./data/result-",today(),".csv"))          # Save to CSV.
















