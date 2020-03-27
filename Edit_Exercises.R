options(stringsAsFactors=FALSE)

library(tidyverse)


e_s<-read.csv(file="data/exercises_strength.csv") 

d_s<-read.csv(file="data/strength.csv") 

tmp<-d_s %>%
  select(Exercise) %>%
  unique() %>%
  left_join(e_s, by=c("Exercise")) %>%
  arrange(desc(Group1), Exercise)

tmp2<-edit(tmp)

e_s<-tmp2 %>% select( X, Exercise, Group1)

write.csv(e_s, file="data/exercises_strength.csv")
