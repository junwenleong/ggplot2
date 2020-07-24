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

#PAP percentage vs rejection rate coloured by party
ggplot(data) + geom_point(aes(y=Oppopercentage,x=Rejectedpercentage,color=Party),size = 4) + geom_smooth(aes(y=Oppopercentage,x=Rejectedpercentage),method ='lm',se=F,color = 'black',size = 0.5) + geom_text_repel(aes(y=Oppopercentage,x=Rejectedpercentage,label = Constituency),size = 3) + labs(title="GE2020 opposition parties' performances",subtitle="Opposition votes percentage versus Rejected vote percentage") + geom_hline(yintercept = meanoppo) + geom_vline(xintercept = meanrej) + geom_text(aes(x=2.75,y=52.5,label="Higher Opposition and rejected votes %"),color = 'firebrick1',size = 3.5)  + geom_text(aes(x=1.2,y=27.5,label="Lower Opposition and rejected votes %"),size = 3.5,color = 'firebrick1') + geom_text(aes(x=0.75,y=40,label ='mean=38.76%'),size = 3,color = 'chartreuse4') + geom_text(aes(x=1.85,y=60,label ='mean=1.71%'),size = 3,color = 'chartreuse4') + ylab('Opposition votes percentage') + xlab('Percentage of rejected votes') + geom_hline(yintercept = 50,linetype = 'dashed',color = 'black',size = 0.1) + scale_colour_manual(values = c("PSP" = "red1", "PPP" = "orange1","NSP"="green4","PV" = "violet",'RDU' = 'black','RP' = 'yellow','SDP' ='magenta4', 'SPP' ='midnightblue','WP' = 'deepskyblue')) # + geom_text(aes(x=70,y=8.25,label="Higher win and rejection %"),size = 3.5) + geom_text(aes(x=56.25,y=4.5,label="Lower win and rejection %"),size = 3.5) 
