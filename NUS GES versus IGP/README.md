# NUS Graduate Employment Survey (GES) versus 10% entrance Indicative Grade Profile (IGP)

## Preface
This plot was made to analyse the relation between difficulty of entrance (with respect to A Level score) to starting pay for majors in NUS.

## Results
There is a visibly strong positive linear correlation between the two variables. Apart from a few outliers like Accountancy and Science, most of the majors fell in the "harder to enter and higher starting pay" or "easier to enter and lower starting pay" regions. This does make logical sense as more students would be attracted to courses with greater remuneration and thus, a higher demand for slots into the course leading to upwards pressure on its entrace IGP.

![](https://github.com/junwenleong/ggplot2/blob/master/NUS%20GES%20versus%20IGP/NUSGESplot.PNG)

Now this is one of the kinds of analysis that when interpreting the visualisation there should be in mind a few caveats. Although it is generally advised not to pick a course solely on remuneration, undoubtedly some are willing to sacrifice their happiness working in a field they later find they dislike for a higher pay, and this is their decision.

That being said, this plot is still interesting enough although with a few important things to note:
- 10% IGP is not the minimum and may be a good measure, but A lvl Rank points does not solely determine the difficulty of entrance for some courses. Especially for courses with interviews, it is quite often the case where the real difficulty lies in passing the interview and not the RP filtering stage
- For 85 RP courses, it is obvious that quite a few could, and will be greater than 85 RP. This is just a result of the published IGPs holding GP to be a 'C' grade, a decision made by the universities/MOE.
- This does not take into account non-normal admission like discretionary admission scheme
- <Honour> variants of the majors were assumed to have the same IGP. If this does not seem to make sense do point out!
- Horizontal and Vertical lines are the major-wise mean of the courses analysed here. If your major is not here, it must have meant I could not obtain the data for either dimension.
- Importantly, starting salary is not necessarily the best measure for some majors. For one example, accountancy is known to have lower starting pay but more well-known for its increment/progression. 
- Business Analytics is from Computing but it is a Bachelor of Science
- The usual problems for GES in general still apply, like reporting bias, sample size etc. (although all here are >30, but that is still not significantly big).
- Decided to do for gross starting remuneration but basic could also hold some insights.
- For obvious reasons, there is a 3/4 year lag between the latest batch(IGP) and the batch whose GES was considered.
- With the 4-partition, linear model line may not be needed but I have left it there in case some are interested to see.

## Methodology
I produced the plot by first extracting the data from the source (explained below) in xlsx format in R, after conversion of the IGPs from character form to numerical form (out of 90). The mean() function was used with R's raw data frame access commands to extract the major-wise means for each dimension, which contributed to the horizontal and vertical lines in the plot. A mutate() was then used with a str_remove_all() regex to trim the names of the major to reduce visualisation clutter. The visualisation was achieved by using ggplot2's geom_point(), geom_smooth() and geom_text_repel() geoms, and other auxiliary functions to fine tune the accuracy and precision of the plot and the labels. geom_hline() and geom_vline() were used to create the 4-partition in the visualisation for faster derivation of 2-dimensional insights. This was important to ensure the readibility of the plot and its integrity in motivating conclusions. The method attribute of geom_smooth() was set to be a linear regression model, "lm".

## Dataset
Data was taken from MOE at: https://www.moe.gov.sg/docs/default-source/document/education/post-secondary/files/web-publication-nus-ges-2019.pdf and from NUS at: http://www.nus.edu.sg/oam/undergraduate-programmes/indicative-grade-profile-(igp)

Some footnotes copy and pasted from their report: 
" 6. Data on law, medicine and pharmacy graduates is obtained from a follow-up survey on 2018 graduates after they have completed their
one-year practical law course/pupillage/housemanship/first-year residency/practical training. Data on architecture graduates is
obtained from a follow-up survey on 2016 architecture graduates after they have completed their practical training.
7. The Bachelor of Environmental Studies degree is a multidisciplinary programme that allows students to specialise in either
Environmental Biology within the Faculty of Science or Environmental Geography within the Faculty of Arts and Social Sciences.
8. *: Data is based on a sample size of fewer than 30 respondents. "

## Used resources/packages
Tidyverse (dplyr and piping operations for efficiency and code clarity)

ggplot2

ggrepel (for neater labelling)
