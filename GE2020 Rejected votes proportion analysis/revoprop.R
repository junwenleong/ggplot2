library(tidyverse)
library(ggrepel)
library(lubridate)
library(readxl)
library(ggplot2)

data <- read_excel("2020GE.xlsx")
data <- data %>% mutate(Result=ifelse(PAP>Opposition,'PAP','Opposition')) %>% mutate(votes_cast = Opposition + PAP) %>% mutate(Winpercentage = ifelse(PAP>Opposition,PAP/votes_cast,Opposition/votes_cast)) %>% mutate(Winpercentage = round(Winpercentage*100,4)) %>%  mutate(Rejectedpercentage = round(100 *Rejected/Electors,2))  %>% mutate(PAPpercentage = round(100*PAP/votes_cast,4)) %>% mutate(Oppopercentage = round(100*Opposition/votes_cast,4))

meanwin = mean(data$Winpercentage)
meanrej = mean(data$Rejectedpercentage)
meanpap = mean(data$PAPpercentage)
meanoppo = mean(data$Oppopercentage)

# Win percentage vs rejection rate coloured by PAP vs non-PAP
ggplot(data) + geom_point(aes(x=Winpercentage,y=Rejectedpercentage,color=Result),size = 4) + geom_smooth(aes(x=Winpercentage,y=Rejectedpercentage),method ='lm',se=F,color = 'black') + geom_text_repel(aes(x=Winpercentage,y=Rejectedpercentage,label = Constituency),size = 3) + labs(title="GE2020",subtitle="Rejected vote percentage versus win percentage") + geom_hline(yintercept = meanrej) + geom_vline(xintercept = meanwin) + geom_text(aes(x=70,y=1,label="Higher win, lower rejection %"),color = 'firebrick1',size = 3.5)  + geom_text(aes(x=56.25,y=2.5,label="Lower win, higher rejection %"),size = 3.5,color = 'firebrick1') + geom_text(aes(x=64.125,y=3.25,label ='mean=62.85%'),size = 3,color = 'chartreuse4') + geom_text(aes(x=51.75,y=1.65,label ='mean=1.71%'),size = 3,color = 'chartreuse4') + xlab('Win percentage') + ylab('Percentage of rejected votes') # + geom_text(aes(x=70,y=8.25,label="Higher win and rejection %"),size = 3.5) + geom_text(aes(x=56.25,y=4.5,label="Lower win and rejection %"),size = 3.5)
