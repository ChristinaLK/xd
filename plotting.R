library(ggplot2)
library(dplyr)
library(reshape2)

df <- read.csv("madison_PI_2015-04-01_to_2015-04-30_aggregate.csv")

total_hours <- df %>%
  mutate(PI = reorder(PI, CPU.Hours..Total)) %>%
  ggplot(aes(y=CPU.Hours..Total, x=PI)) + 
  geom_bar(stat="identity", color="blue", fill="blue") + 
  coord_flip() +
  theme(panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  labs(title="Total CPU Hours", x="CPU Hours", y="PI")

cpu_usage <- df %>% 
  select(PI,
              max_cores = Job.Size..Max..Core.Count.,
              min_cores = Job.Size..Min..Core.Count.,
              avg_cores = Job.Size..Per.Job..Core.Count.) %>%
  mutate(PI = reorder(PI, max_cores)) %>%
  melt(value.name = "num_cores") %>%
  ggplot(aes(x=num_cores,y=PI,color=variable)) + 
  geom_point() + 
  theme(panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  labs(title="Core Usage", x="Number of Cores", y="PI", color="")
