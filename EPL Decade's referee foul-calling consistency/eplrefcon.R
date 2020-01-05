library(tidyverse)
library(lubridate)

y1 <- read_csv("season-0910_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(0910))
y2 <- read_csv("season-1011_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1011))
y3 <- read_csv("season-1112_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1112))
y4 <- read_csv("season-1213_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1213))
y5 <- read_csv("season-1314_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1314))
y6 <- read_csv("season-1415_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1415))
y7 <- read_csv("season-1516_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1516))
y8 <- read_csv("season-1617_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1617))
y9 <- read_csv("season-1718_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1718))
y10 <- read_csv("season-1819_csv.csv") %>% select(Referee,HF,AF,HY,AY) %>% mutate(Season=as.factor(1819))

rbind(y1,y2,y3,y4,y5,y6,y7,y8,y9,y10) -> binded

eligiblerefs <- binded %>% group_by(Referee) %>% summarise(Games=n()) %>% filter(Games>=200)
binded <- binded %>% filter(Referee %in% eligiblerefs$Referee) %>% filter(Referee!='M Oliver') %>% filter(Referee!='J Moss') %>% filter(Referee!='M Clattenburg')

binded %>% group_by(Referee,Season) %>% summarise(TotalF = (mean(AF) + mean(HF)),TotalY = (mean(AY) + mean(HY)) )  %>% ggplot() + geom_line(aes(x=Season,y=TotalF,group=Referee,colour=Referee)) + ylab("Mean fouls per game") + labs(title="Who was the decade's most consistent referee?",subtitle="in terms of mean fouls called per game") + geom_point(aes(x=Season,y=TotalF,group=Referee,colour=Referee))
#geom_text_repel(aes(x=HF,y=AF,label=Referee)) + geom_abline(slope=1,intercept=0,color='black') + labs(title="Which referees are swayed by the home crowd?",subtitle="EPL A-H Fouls ratio for season 09/10 to 18/19 (Referees with >= 100 games)", x="Mean fouls for home team", y="Mean fouls for away team",color='blue') + xlim(c(9.8,11.6)) + ylim(c(9.8,11.6)) + geom_text(aes(x=10,y=11.25,label="Calls more fouls on away team"),color='red') + geom_text(aes(x=11.25,y=10,label="Calls more fouls on home team"),color='blue') + geom_text(aes(x=10,y=10,label='Calls fouls on both teams equally'))


