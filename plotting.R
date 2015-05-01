library(ggplot2)
library(dplyr)

df = read.csv("madison_PI_2014-04-30_to_2015-04-30_aggregate.csv")

df %>%
  mutate(PI = reorder(PI, CPU.Hours..Total)) %>%
  ggplot(aes(x=CPU.Hours..Total, y=PI))+geom_point()