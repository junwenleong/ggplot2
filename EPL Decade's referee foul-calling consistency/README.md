# BPL Decade's referees foul-calling consistency

## Preface
Another interesting question I pondered was about the consistency of the decade's full-serving referees. Again, I set out to explore this through R's ggplo2 capabilities.

## Results
In the last decade, only 6 referees served through all 10 seasons, so indeed there could be more consistent referees that did not serve all 10 seasons. But for the purpose of the question, this graph shows their average fouls called per game each season.

![](https://github.com/junwenleong/ggplot2/blob/master/EPL%20Decade's%20referee%20foul-calling%20consistency/decade6refs.PNG)

Interesting observations are the common dip from 09/10 to 11/12 (well, except L Mason) and the fact that Andre Marinner has had a (pretty) steady and smooth decrease in fouls called over the 10 seasons. Perhaps someone with good memory remembers an IFAB rule relaxation/relaxation or something of the sort that could explain the dip at the start of the decade?

Other than that, Anthony Taylor seems to be the most inconsistent out of these fully-serving referees, with year-on-year increases and decreases greater than that of the other referees. Another eye-catching notice was the alarming decrease in the fouls called by Kevin Friend from 16/17 to 17/18, a decrease of around 25% from 23.8 to 18.1 fouls called per game.

## Methodology
I produced the plot by first extracting the data from the source (explained below) in JSON/CSV format in R, then filtered the (10 seasons combined by rbind() function) data frame using Tidyverse's filter() function. This was followed by tagging each season with a categorical 'Season' tag with Dplyr's mutate function wrapped over an as.factor() call. In fact, an alternative way to do this is by the Lubridate package's year() function which could be used with recode() to tag in the same way. After filtering for referees that served the full decade, I utilised Tidyverse's group_by() and summarise() functions to collapse the data into aggregate means of fouls per game for each referee, for each season. The visualisation was achieved by using ggplot2's geom_line(), geom_point() and geom_text() geoms, and other auxiliary functions to fine tune the accuracy and precision of the plot and the labels. This was important to ensure the readibility of the plot and its integrity in motivating conclusions.

## Dataset
This dataset contains data for last 10 seasons of English Premier League including the current season. The data is updated on weekly basis via Travis-CI. The dataset is sourced from http://www.football-data.co.uk/ website and contains various statistical data such as final and half time result, corners, yellow and red cards etc.

## Used resources/packages
Tidyverse (dplyr and piping operations for efficiency and code clarity)

ggplot2

lubridate (possible alternative to tag seasons)
