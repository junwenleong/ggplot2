library(readr)
library(readxl)
library(jsonlite)
library(tidyverse)
library(ggrepel)

y1 <- read_csv("season-0910_csv.csv") %>% select(Referee,HF,AF)
y2 <- read_csv("season-1011_csv.csv") %>% select(Referee,HF,AF)
y3 <- read_csv("season-1112_csv.csv") %>% select(Referee,HF,AF)
y4 <- read_csv("season-1213_csv.csv") %>% select(Referee,HF,AF)
y5 <- read_csv("season-1314_csv.csv") %>% select(Referee,HF,AF)
y6 <- read_csv("season-1415_csv.csv") %>% select(Referee,HF,AF)
y7 <- read_csv("season-1516_csv.csv") %>% select(Referee,HF,AF)
y8 <- read_csv("season-1617_csv.csv") %>% select(Referee,HF,AF)
y9 <- read_csv("season-1718_csv.csv") %>% select(Referee,HF,AF)
y10 <- read_csv("season-1819_csv.csv") %>% select(Referee,HF,AF)



rbind(y1,y2,y3,y4,y5,y6,y7,y8,y9,y10) -> binded
binded %>% group_by(Referee) %>% summarise(Games=n(),AF=mean(AF),HF=mean(HF)) %>% filter(Games>=100) %>% ggplot() + geom_point(aes(x=HF,y=AF)) + geom_text_repel(aes(x=HF,y=AF,label=Referee)) + geom_abline(slope=1,intercept=0,color='black') + labs(title="Which referees are swayed by the home crowd?",subtitle="EPL A-H Fouls ratio for season 09/10 to 18/19 (Referees with >= 100 games)", x="Mean fouls for home team", y="Mean fouls for away team",color='blue') + xlim(c(9.8,11.6)) + ylim(c(9.8,11.6)) + geom_text(aes(x=10,y=11.25,label="Calls more fouls on away team"),color='red') + geom_text(aes(x=11.25,y=10,label="Calls more fouls on home team"),color='blue') + geom_text(aes(x=10,y=10,label='Calls fouls on both teams equally'))


