library(ggplot2)
library(tidyverse)

read.csv("vizathon.csv")
data("vizathon.csv")
Vizathon <- read.csv("vizathon.csv")
data <- read.csv("vizathon.csv")

#ggplot
ggplot(data = data, aes(x = Hospitals.per.100000, y = raterecovered)) + geom_point() +
  geom_smooth(method='lm',color="blue") + ggtitle("              Hospitals Per 100,000 People vs. Recovery Rate") + xlab("Hospitals Per 100,000 People") + ylab("Recovery Rate") +
  theme_minimal() + theme(plot.background = element_rect(fill = "white")) + theme(plot.title = element_text(face = "bold", colour = "black")) +
  theme(axis.text = element_text(color = "black"))