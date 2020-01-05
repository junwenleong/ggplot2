# Do some referees hold back their red cards?
## Preface
With some English Premier League referees notorious for card-giving and drama (Mike Dean or Mark Clattenburg) and some quite the opposite (Kevin Friend is known for holding back on his cards), I created a ggplot2 visualisation to compare the referees' Red/Yellow card ratios.

## Results
This is based on data for the last decade/last 10 full seasons of the EPL, for referees that had at least a hundred games in that time period. Take note that the correct way to interpret this graph is the referees' positions with respect to the trend line, ie. whether they are above or below, and how far away. Referees lying above the trend line (linear regression model) give more red cards per yellow that they give and the converse is true for those lying below. From this graph, it seems that for reasons unknown, Kevin Friend, Howard Webb and Neil Swarbrick shy away from giving red cards, if we go by the metric of red cards per yellow cards.

![](https://github.com/junwenleong/ggplot2/blob/master/EPL%20Referees'%20Red-Yellow%20card%20ratios/ryratio.PNG)

As mentioned above, the correct way to read the graph is the points' positions with respect to the trend line, not with respect to the other points. For instance, the purpose of this graph is not to point out that Mike Dean and Martin Atkinson gave out more yellow and red cards over the decade: they simply could have had more games and the graph is not normalised to a per-game aspect for those purposes. In fact, the per-game plot (https://imgur.com/a/IvjWzrQ), which is also pretty interesting in itself, shows a somewhat unexpected pattern and trend, which could be explained by Probert and Foy's outlying points greatly affecting the trend line. Perhaps a sporting/IFAB rule-related reason could be found for their strong inclination to give reds relative to yellows.

## Methodology
I produced the plot by first extracting the data from the source (explained below) in JSON/CSV format in R, then filtered the (10 seasons combined by rbind() function) data frame using Tidyverse's filter() function.  After filtering for referees that served at least 100 games throughout the decade, I utilised Tidyverse's group_by() and summarise() functions to collapse the data into aggregate totals of yellow and red cars given for each referee. The visualisation was achieved by using ggplot2's geom_smooth(), geom_point() and geom_text() geoms, and other auxiliary functions including ggrepel's geom_text_repel() to fine tune the accuracy and precision of the plot and the labels. This was important to ensure the readibility of the plot and its integrity in motivating conclusions. The method attribute of geom_smooth() was set to be a linear regression model, "lm".

## Dataset
This dataset contains data for last 10 seasons of English Premier League including the current season. The data is updated on weekly basis via Travis-CI. The dataset is sourced from http://www.football-data.co.uk/ website and contains various statistical data such as final and half time result, corners, yellow and red cards etc.

## Used resources/packages
Tidyverse (dplyr and piping operations for efficiency and code clarity)

ggrepel

ggplot2


