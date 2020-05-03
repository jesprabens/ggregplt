#' Creates an interactive regression plot for a given regression model.
#'
#' @param mod The model that needs to be plotted
#'
#' @return An interactive plot or plots of the model
#'
#' @importFrom plotly ggplotly
#' @importFrom tidyverse
#' @importFrom ggthemes
#'
#' @export
int_reg <- function(mod){

  df <- data.frame(reg2$model)

  names <- colnames(df)

  response <- df[,1]

  # cycles through each predictor
  for(i in 2:length(df)){

    predictor <- df[,i]

    # creates a regression plot, response vs predictor
    p <- df %>%
      ggplot(aes(x = predictor, y = response)) +
      geom_point() +
      geom_smooth(method=lm, se = FALSE) +
      ggtitle(paste("Regression Plot", names[1] ,"vs.", names[i])) +
      labs(x = names[i],
           y = names[1]) +
      theme_fivethirtyeight() +
      theme(axis.title = element_text())

    # makes the plots interactive
    p_int <- ggplotly(p)

    print(p_int)

  }

}
