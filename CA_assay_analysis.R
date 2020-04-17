install.packages("growthcurver")
install.packages("readxl")
library(growthcurver)
library(readxl)
library(tidyverse)
library(lubridate)

data <- read_excel("~/Documents/CA_test1_assay_no_MDEA.xlsx", range = "A3:CT66")
data <- data %>% 
  select(-`Temperature(¡C)`) %>% 
  mutate(time = minute(Time) + second(Time)/60) %>% 
  select(-Time) %>% 
  select(time, everything())

gc_out <- SummarizeGrowthByPlate(data, plot_fit = TRUE, plot_file = "no_MDEA_plots.pdf")

# write.csv(gc_out, file = "~/Documents/test1_assay_no_MDEA_gc_fit", quote = FALSE, sep = ",", row.names = FALSE)

# platemap <- read.csv("~/Documents/CA_test1_assay_platemap.csv", sep = ",")
