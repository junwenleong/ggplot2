library(tidyverse)
library(ggrepel)
library(ggplot2)

data <- read_excel("NUSGES.xlsx")
meanIGP <- mean(data[[4]])
meanstartpay <- mean(data[[3]])
data %>% mutate(Degree = str_remove_all(Degree, 'Bachelor of')) %>% ggplot() + geom_point(aes(y=`Median Gross Monthly Salary`, x=`10th percentile IGP (AY2019/2020)`)) + geom_smooth(aes(y=`Median Gross Monthly Salary`, x=`10th percentile IGP (AY2019/2020)`),method='lm',se=F,color='black') + geom_text_repel(aes(y=`Median Gross Monthly Salary`, x=`10th percentile IGP (AY2019/2020)`,label = Degree),size = 2.5) + labs(title="NUS majors' starting renumeration vs A Lvl IGP (10th %tile)",subtitle="Based on latest data available(2019)") + geom_text(aes(x=70,y=4700,label="Easier to enter, higher starting pay"),color='red') + geom_text(aes(x=82,y=4700,label="Harder to enter, higher starting pay"),color='blue') + geom_hline(yintercept = meanstartpay) + geom_vline(xintercept = meanIGP) + geom_text(aes(x=70,y=3000,label="Easier to enter, lower starting pay"),color='blue')  + geom_text(aes(x=82,y=3000,label="Harder to enter, lower starting pay"),color='red')





