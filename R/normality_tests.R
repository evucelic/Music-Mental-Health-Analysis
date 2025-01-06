library(tidyverse)
library(nortest)
library(dplyr)
library(ggplot2)

analyze_normality <- function(music_data) {
  vars <- c("Hours per day", "Anxiety", "Depression", "Insomnia", "OCD")
  data_long <- music_data %>%
    select(all_of(vars)) %>%
    mutate(`log_Hours per day` = if_else(`Hours per day` > 0, log(`Hours per day`), NA_real_)) %>%
    pivot_longer(cols = everything(), names_to = "Varijabla", values_to = "Value") %>%
    filter(!is.na(Value))
  
  ggplot(data_long, aes(x = Value)) +
    geom_histogram(binwidth = if_else(data_long$Varijabla == "log_Hours per day", 0.5, 1), fill = "lightblue", color = "black") +
    facet_wrap(~Varijabla, scales = "free") +
    theme_minimal()
  
  results <- data_long %>%
    group_by(Varijabla) %>%
    summarize(`p-vrijednost` = lillie.test(Value)$p.value,
              Distribucija = if_else(`p-vrijednost` < 0.05, "Ne normalna", "Normalna"))
  
  print(results)
}
