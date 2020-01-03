# BPL Away/Home team fouls called ratio

## Preface:
With my keen interest in football and in particular the Barclay's Premier League, I have always wondered if referees called more fouls on away teams than home teams, and utilised my expertise in R and the Tidyverse/ggplot2 packages to set out to answer this question.

## Results
This is based on data for the past 10 full seasons of the BPL, only for referees with at least 100 games. Most referees consistently call more fouls on the away team throughout their matches.

![](https://github.com/junwenleong/ggplot2/blob/master/EPL%20A-H%20fouls%20ratio/Rfoulsratio.png)

Although one might jump to the conclusion that this is direct evidence that most referees are biased and the atmosphere of the home crowd sways foul decisions in their team's favour, there could also be other confounders. For instance,it is not uncommon to see away teams set up more defensively (especially Mourinho-esque for weaker teams that visit the stadiums of the bigger clubs), meaning the home team carries more of the possession and attacking onus, resulting in more fouls from the more defensive away team.
One interesting observation is that Anthony Taylor seems to consistently call more fouls on the home team than the away team, something in contrast to most of his colleagues.

## Methodology:
I produced the plot by first extracting the data from the source (explained below) in JSON/CSV format in R, then filtered the (10 seasons combined by rbind() function) data frame using Tidyverse's filter() function. Afterwards, I utilised Tidyverse's group_by() and summarise() functions to collapse the data into aggregate means of fouls for each referee. The visualisation was achieved by using  ggplot2's geom_point() and geom_text() geoms, topped off by ggrepel's geom_text_repel and other auxiliary function like geom_abline, xlim, ylim to fine tune the accuracy and precision of the plot and the labels. This was important to ensure the readibility of the plot and its integrity in motivating conclusions.

## Dataset:
This dataset contains data for last 10 seasons of English Premier League including the current season. The data is updated on weekly basis via Travis-CI. The dataset is sourced from http://www.football-data.co.uk/ website and contains various statistical data such as final and half time result, corners, yellow and red cards etc.
