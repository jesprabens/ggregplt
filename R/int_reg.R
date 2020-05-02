#' Creates an interactive regression plot for a given simple linear regression model.
#'
#' @param mod The model that needs to be plotted
#'
#' @return Aninteractive plot of the model
#'
#' @importFrom plotly ggplotly
#' @importFrom tidyverse
#' @importFrom ggthemes
#'
#' @export
int_reg <- function(mod){
  df <- data.frame(mod$model)
  names <- colnames(df)
  predictor <- df[,2]
  response <- df[,1]
  p <- iris %>%
    ggplot(aes(x = predictor, y = response)) +
    geom_point() +
    geom_smooth(method=lm, se = FALSE) +
    labs(title = "Regression Plot", x = names[2], y = names[1]) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text())
  ggplotly(p)
}
