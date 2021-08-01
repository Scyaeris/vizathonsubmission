library(ggplot2)
library(tidyverse)

Canadian_province <- c("AB", "BC", "MB", "NB", "NL", "NS", "NT","NU", "ON","PE", "QC","SK","YT")
Hospitals_per_capita <- c(0.00007461243237, 0.0002895378824, 0.0001549674677, 0.00007927598015, 0.0001844600125, 0.00019909153, 0.0001550868486, 0.00007612860659, 0.0002529953655, 0.0002189977412, 0.0002750717589, 0.0004012446218, 0.0009243458476)

data <- data_frame(Canadian_province, Hospitals_per_capita)

ggplot(data, aes(x = Canadian_province, y = Hospitals_per_capita)) + geom_bar(fill = "steelblue", stat = 'identity') + ggtitle("Hospitals Per Capita By Province") + xlab("Canadian Provinces") + ylab("Hospitals Per Capita")+
  theme_minimal() + theme(plot.background = element_rect(fill = "lightblue")) + theme(plot.title = element_text(face = "bold", colour = "steelblue")) +
  theme(axis.text = element_text(color = "steelblue", size = 12)) +
  theme(axis.title = element_text(face = "bold", color = "steelblue")) +
  theme(panel.background = element_rect(fill = "linen"))