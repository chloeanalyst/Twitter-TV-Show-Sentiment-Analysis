# Twitter-TV-Show-Sentiment-Analysis

### Project History & Overview

This project started out as from a small Google Sheets exploration piece using third party tools around 2/3 years ago. 


In the summer of 2017, I watched Love Island for the first time and was HOOKED on the memes. I’d head straight over to twitter during the ad breaks and scroll for hours after the show laughing my head off at the hilarious content.  

If you’ve still managed to resist the show again this year or you’ve been living under a rock and have no idea what Love Island is I’ll fill you in. 

Love Island is a reality TV show a bit like Big Brother that films contestants for 24 hours a day with the end goal of finding love. Contestants are picked mainly for their looks although this year they through in some scientists who were still very beautiful to even it out abit. 

The contestants spend 8 weeks in a villa in Majorca coupling and recoupling each week for the chance to win £50K and sponsorship deals, sorry, I mean Love…
In 2018, the show has had over 6 Million viewers watching live and on demand with over 400K daily viewers on Mobile devices. 

Twitter is HUGE with Love Island viewers expressing their opinions about the nights episode. This graph shows how quickly the #LoveIsland hashtag grew. At one point, #LoveIsland was averaging 1.2M Tweets a week with a estimated reach of 11.1 Billion! 


Initially I used a tool called Microsoft Flow which has a very user friendly interface to select the hashtag and insert the tweet into a row in a Google Sheet. Very easy to use with a list of additional content you can pull from Twitter. My plan was to run this 1 hour before show, during the show and 1 hour after the show. To gather a sample of data in order to analyse sentiment before, during and after the show to see how much people’s opinions change. Unfortunetly, due to the volume of tweets the tool ran very slowly and I soon hit Flow’s free limit.


*But, it is what it is*


Using the small set of data I’d manage to collect from Flow I took a look at the data to figure out what I needed to manipulate in order to start the analysis. 
I noticed there was some issues with the data where emoji’s had been used in the tweets and the date format was something that the visualisation tool I was using couldn’t read which meant a lot of clean up.

I then figured out what I needed to do to analyse the tweets sentiment:

1 – Count the words in the tweet.

2- Figure out how many positive and negative words there are.

3 – Determine whether the tweet was positive, negative or neutral.

<img width="629" alt="Screenshot 2021-07-28 at 13 15 07" src="https://user-images.githubusercontent.com/52977984/127320523-44de2a0d-e1f0-4a64-898e-308ed5b4b3a9.png">

At the time I hadn't been introduced to R so I was using Google Sheets to calculate sentiment. 

<img width="632" alt="Screenshot 2021-07-28 at 13 15 29" src="https://user-images.githubusercontent.com/52977984/127320637-63dc4012-ba7e-46b0-96df-70ff82973b4b.png">

I shared my project frustrations with a Data Scientist at the company I was employed at and they gave myself and the rest of the team an intro into R. With a little bit of help to get started I was able to transfer my logic from Google Sheets into R which immediately resolved the speed issues I had. 

<img width="622" alt="Screenshot 2021-07-28 at 13 16 29" src="https://user-images.githubusercontent.com/52977984/127320819-10804bbe-dafb-4bdb-bfa5-c64cbacf7364.png">


I spent the summer watching the show and collecting data and began to visualise the findings using Google Data Studio.

<img width="597" alt="Screenshot 2021-07-28 at 13 21 02" src="https://user-images.githubusercontent.com/52977984/127321325-1687bfcf-d67e-47bf-bf20-72a1db3a404e.png">

<img width="728" alt="Screenshot 2021-06-26 at 19 13 42" src="https://user-images.githubusercontent.com/52977984/127321336-2bf8aabc-0e29-4465-ba1d-97b2ca3bb7d3.png">

I initially looked at the distribution of sentiment tweets had for each contestant. After exploring the data I'd captured I created a sentiment score. 1 point for a positive tweet, 0 points for neutral and -1 points for negative tweets. Plotting this on a chart by day I discovered a fantastic piece of insight. The scene highlighted in the image below sent Tweeters into a storm. From this point I've been working on capturing Tweeters opinion on each episode to discover some great TV moments.

<img width="601" alt="Screenshot 2021-07-28 at 13 22 22" src="https://user-images.githubusercontent.com/52977984/127321719-d3390f1e-782b-4f51-839b-66901e62a57a.png">


I now use R for everyday problems in my day job and working on this project has taken my understanding from strength to strength and each year as my R skills improve I make some tweaks to the script to enhance performance and analysis methodology through lots of tears, dead end google searches and reading lots of stackoverflow solutions. 

Below are some snippets of 2021's project progress:

<img width="716" alt="Screenshot 2021-07-08 at 22 02 37" src="https://user-images.githubusercontent.com/52977984/127321997-04cfc0a1-02a2-4bb6-a6b3-eaff2686b822.png">

<img width="762" alt="Screenshot 2021-07-06 at 00 08 52" src="https://user-images.githubusercontent.com/52977984/127322032-ed0c336b-8520-484a-ae29-ffd63841aa3f.png">


I feel that the sciript is now at a point where it is useful for others, please feel free to fork, use for your projects and improve.


I have some ideas for future iterations of this script and intend to dig deeper into sentiment methodology throughout the year. 


### Methodology

- Sentiment - AFINN Lexicon
- Average Sentiment Score, total & by contestant
- Total Sentiment Score, total & by contestant


### Love Island Sentiment Analysis

[Link to data studio](https://datastudio.google.com/s/kyKKX4Tjz3c)

![Screenshot 2021-07-17 at 11 38 14](https://user-images.githubusercontent.com/52977984/127322114-1fe39784-a69f-456d-9a98-b819b3926524.png)



### Required R packages

[rtweet](https://cran.r-project.org/web/packages/rtweet/index.html)

[tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html)

[tidytext](https://cran.r-project.org/web/packages/tidytext/index.html) Similar to Tidyverse

[textdata](https://cran.r-project.org/web/packages/textdata/index.html)

[lubridate](https://cran.r-project.org/web/packages/lubridate/index.html)
