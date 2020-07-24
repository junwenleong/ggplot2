# GE2020: Comparing opposition parties' performances

## Preface
The results of the 2020 GE have been debated and discussed quite widely, but one of the more innocuous yet interesting less-talked about aspects is the issue of rejected votes.

## Results
* For obvious reasons, the win percentage is out of the number of valid votes, while the rejected percentage is out of the total electorate base for the district.

- Based on the data, there is a fairly decent (moderate-high with correlation coefficient ~0.745) positive relationship between the proportion of rejected votes in a constituency and the win percentage it garnered.

- As can be seen, there are no large outliers from the trend and one can at first glance make the inference that PAP-won wards tended to have greater higher rejected vote percentage, as compared to opposition-won wards/wards that had high opposition vote shares leading to close fights (eg. East Coast, West Coast). Interestingly, it is often said that in the older generation, there has been a long-standing myth of people being afraid of voting against the incumbent and although this data shows a correlation for that, the sample size could be too small to make any concrete conclusions (there are a limited number of GRCs/SMCs anyway).

![](https://github.com/junwenleong/ggplot2/blob/master/GE2020%20Rejected%20votes%20proportion%20analysis/image.PNG)

Some other interesting observations:

- the three wards won by the Workers' Party had some of the lowest rejected voted percentages, perhaps displaying the resolve of the voters in those constituencies in voting against the PAP, or for the opposition. Though, a sample size of three is a limit to most analyses here.

- the ward with the lowest proportion of rejected votes is newly carved-out Punggol West SMC, where long-time incumbent Sun Xueling of the PAP defeated WP first-timer Tan Chen Chen with around 3/5ths of the total votes cast.

- the four (non-three way fight) wards contested by the Reform Party and Peoples' Voice were the wards with the most rejected votes per capita, possibly displaying a greater tendency for people to spoil their votes when the opposition was from these parties. Although again, there is merely a sample size of 2+2 here.

Of course, the win percentage and rejected votes percentage is not the only way to determine the strength of the opposition party, but it gives a sufficient gauge of the party's performance in this general election.

## Methodology
The plot was produced by first extracting the data from the source (explained below) in xlsb format in R, followed by mutation of the variables Results, votes_cast, Winpercentage, Rejectedpercentage, PAPpercentage and Oppopercentage. Then, the base mean() function was used with R's raw data frame access commands to extract the major-wise means for each dimension, which contributed to the horizontal and vertical lines in the plot. The visualisation was achieved by using ggplot2's geom_point(), geom_smooth() and geom_text_repel() geoms, and other auxiliary functions to fine tune the accuracy and precision of the plot and the labels. After which, the colour, shape and position of data ink in the plot was fine tuned to optimise aesthetic readibility for the viewer. Manual customiser scale_color_manual() was then utilised to colour code the opposition parties for each district, according to ggplot2's raw and hybrid colour palettes (link provided below). Tidyverse methods geom_hline() and geom_vline() were used to create the 4-partition in the visualisation for faster derivation of 2-dimensional insights. This was important to ensure the readibility of the plot and its integrity in motivating conclusions. The method attribute of geom_smooth() was set to be a simple linear regression model.

## Dataset
Data was solely obtained from the Elections Department Website at: https://www.eld.gov.sg/finalresults2020.html

## Used resources/packages
Tidyverse (dplyr and piping operations for efficiency and code clarity)

ggplot2

ggrepel (for neater data point labelling)

base ggplot2 raw/hybrid colour palettes obtained from: http://sape.inf.usi.ch/quick-reference/ggplot2/colour
