library(readr)
library(readxl)
library(jsonlite)
library(tidyverse)
library(ggrepel)

y1 <- read_csv("season-0910_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y2 <- read_csv("season-1011_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y3 <- read_csv("season-1112_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y4 <- read_csv("season-1213_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y5 <- read_csv("season-1314_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y6 <- read_csv("season-1415_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y7 <- read_csv("season-1516_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y8 <- read_csv("season-1617_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y9 <- read_csv("season-1718_csv.csv") %>% select(Referee,HR,AR,HY,AY)
y10 <- read_csv("season-1819_csv.csv") %>% select(Referee,HR,AR,HY,AY)



rbind(y1,y2,y3,y4,y5,y6,y7,y8,y9,y10) -> binded
binded %>% group_by(Referee) %>% summarise(Games=n(),totalR=sum(HR)+sum(AR),totalY=sum(HY)+sum(AY)) %>% filter(Games>=100) %>% ggplot() + geom_point(aes(x=totalY,y=totalR)) + geom_smooth(aes(x=totalY,y=totalR),method='lm',se=F,color='black') + geom_text_repel(aes(x=totalY,y=totalR,label=Referee)) + labs(title="Do some referees hold back their red cards?",subtitle="PL referees' RC to YC ratios (09/10 to 18/19, refs with >= 100 games)", y="Red cards given", x="Yellow cards given",color='blue')  + geom_text(aes(x=500,y=45,label="Gives more Reds per Yellow"),color='red') + geom_text(aes(x=900,y=20,label="Gives fewer Reds per Yellow"),color='blue')
