#load libraries
library(ggplot2)
library(dplyr)
library(reshape2)

#file name w/o csv extension
aggregate_file <- "madison_PI_2015-01-01_to_2015-05-01_aggregate"

#load prepared csv
df <- read.csv(paste0(aggregate_file,".csv"))
colnames(df) <- c("PI","CPU_Hours","Max_Cores","Min_Cores","Avg_Cores")

#create graph of total hours used
total_hours <- df %>%
  mutate(PI = reorder(PI, CPU_Hours)) %>%
  ggplot(aes(y=CPU_Hours, x=PI)) + 
  geom_bar(stat="identity", color="blue", fill="blue") + 
  coord_flip() +
  theme(panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  labs(title="Total CPU Hours", y="CPU Hours", x="PI")

#save total hours graph
ggsave(paste0(aggregate_file,"_hours",".png"), 
       plot = total_hours, 
       width=6, 
       height=4)

#graph min/max/avg cpu usage
cpu_usage <- df %>% 
  select(PI,
        Max_Cores,
        Avg_Cores,
        Min_Cores) %>%
  mutate(PI = reorder(PI, Max_Cores)) %>%
  melt(variable.name="Val", value.name = "Num_Cores") %>%  
  ggplot(aes(x=PI, y=Num_Cores, color=Val)) + 
  geom_point(size=4) + 
  geom_linerange(data=df, aes(
    x=PI, 
    y=Avg_Cores, 
    ymin=Min_Cores, 
    ymax=Max_Cores, 
    color="Range"),
    color="black") +
  coord_flip() + 
  theme(panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) +
  labs(title="Core Usage", x="PI", y="Number of Cores", color="")

#save CPU use plot
ggsave(paste0(aggregate_file,"_CPU_use",".png"), 
       plot = cpu_usage, 
       width=6, 
       height=4)
