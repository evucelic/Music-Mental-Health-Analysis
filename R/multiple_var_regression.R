library(ggplot2)
library(dplyr)

multiple_var_analysis <- function(chosen_data) {
  
  chosen_data <- na.omit(chosen_data)
  
  model <- lm(Age ~ ., data = chosen_data)
  predictions <- predict(model, newdata = chosen_data)
  
  # Variable importance
  importance <- data.frame(
    Feature = names(coef(model))[-1],
    Importance = abs(coef(model)[-1])
  ) %>% arrange(desc(Importance))
  
  
  # Importance plot
  top_10_plot <- ggplot(importance %>% head(10), 
                        aes(x = reorder(Feature, Importance), y = Importance)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    theme_minimal() +
    labs(title = "Top 10 Faktora za Predviđanje dobi",
         x = "Faktori",
         y = "Važnost")
  
  prediction_plot <- ggplot(data.frame(Actual = chosen_data$Age, 
                                       Predicted = predictions), 
                            aes(x = Actual, y = Predicted)) +
    geom_point(alpha = 0.5) +
    geom_abline(intercept = 0, slope = 1, color = "red") +
    theme_minimal() +
    labs(title = "Actual vs Predicted Values",
         x = "Actual Age",
         y = "Predicted Age")
  
  return(list(
    model = model,
    top_10_plot = top_10_plot,
    prediction_plot = prediction_plot
  ))
}