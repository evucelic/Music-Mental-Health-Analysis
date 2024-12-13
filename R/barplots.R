library(ggplot2)
library(dplyr)
library(tidyr)

create_binary_plots <- function(data) {
  # Priprema podataka s grupiranjem i sortiranjem
  binary_data <- data %>%
    select(Instrumentalist, Composer, Exploratory) %>%
    pivot_longer(
      cols = everything(),
      names_to = "Variable",
      values_to = "Response"
    ) %>%
    drop_na() %>%
    group_by(Variable, Response) %>%
    summarise(count = n(), .groups = "drop") %>%
    group_by(Variable) %>%
    mutate(yes_count = sum(count * (Response == "Yes"))) %>%
    ungroup() %>%
    mutate(Variable = fct_reorder(Variable, yes_count))
  
  # Plot za binarne varijable
  p1 <- ggplot(binary_data, aes(x = Response, y = count, fill = Variable)) +
    geom_col(position = "dodge") +
    labs(title = "Distribucija binarnih varijabli",
         x = NULL,
         y = "Broj ispitanika",
         fill = "Varijabla") + 
    scale_fill_brewer(palette = "Set2") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  return(p1)
}

create_fav_genre_plot <- function(data){
  p2 <- data %>%
    drop_na(`Fav genre`) %>%
    group_by(`Fav genre`) %>%
    summarise(count = n()) %>%
    arrange(desc(count)) %>%
    mutate(`Fav genre` = fct_reorder(`Fav genre`, count)) %>%
    ggplot(aes(x = `Fav genre` , y = count, fill = `Fav genre`)) +
    geom_col() +
    labs(title = "Distribucija omiljenih žanrova",
         x = NULL,
         y = "Broj ispitanika") + 
    theme_minimal() +
    theme(
      axis.text.x = element_blank(),
    ) + guides(fill = guide_legend(reverse = TRUE))
  
  return (p2)
}