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
int_reg <- function(mod, x = NULL){

  if (is.null(x) == FALSE){

    df <- data.frame(mod$model)

    names <- colnames(df)

    response <- df[,1]

    for(i in 2:length(df)){

      predictor <- df[,i]

      intercept <- mod$coefficients[1]

      predictor_val <- mod$coefficients[i]

      pred <- (intercept + predictor_val * x)

      p <- df %>%
        ggplot(aes(x = predictor, y = response)) +
        geom_point() +
        geom_smooth(method=lm, se = FALSE) +
        geom_point(aes(x = x, y = pred, size = 4, color = "red")) +
        ggtitle(paste("Regression Plot", names[1] ,"vs.", names[i])) +
        labs(x = names[i],
             y = names[1]) +
        theme_fivethirtyeight() +
        theme(axis.title = element_text(),
              legend.position = "none")

      p_int <- ggplotly(p)

      print(p_int)

    }

  } else {

    no_pred_plot(mod)

  }

}



#' Plots the interactive regression with no predicted x
#'
#' @param mod The regression model
#'
#' @return An interactive plot or plots
#'
#' @importFrom plotly ggplotly
#' @importFrom tidyverse
#' @importFrom ggthemes
no_pred_plot <- function(mod){

  df <- data.frame(mod$model)

  names <- colnames(df)

  response <- df[,1]

  for(i in 2:length(df)){

    predictor <- df[,i]

    p <- df %>%
      ggplot(aes(x = predictor, y = response)) +
      geom_point() +
      geom_smooth(method=lm, se = FALSE) +
      ggtitle(paste("Regression Plot", names[1] ,"vs.", names[i])) +
      labs(x = names[i],
           y = names[1]) +
      theme_fivethirtyeight() +
      theme(axis.title = element_text(),
            legend.position = "none")

    p_int <- ggplotly(p)

    print(p_int)

  }

}











}
