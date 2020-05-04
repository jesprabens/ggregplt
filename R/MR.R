#' Calculates VIF and interactive correlation matrix for a given Multiple Regression equation.
#'
#'
#' @param eq A multiple regression equation supplied by user
#'
#'
#' @return Plot and VIF
#'
#' @import dplyr
#' @import ggplot2
#' @import car
#' @import reshape2
#' @import knitr
#' @import irr
#' @import viridis
#' @import ggiraph
#' @import lmf
#' @import ggcorrplot
#' @import plotly
#'
#' @export

MR <- function(eq){
  dataset <- eq$model[,-1]
  corr <- round(cor(dataset), 1)
  p.mat <- cor_pmat(dataset)
  corr.plot <- ggcorrplot(
    corr, hc.order = TRUE, outline.col = "white",
    p.mat = p.mat, colors = c("#FDE725FF", "#1F968BFF", "#440154FF")) +
    ggtitle("Correlation Matrix")
    result <- ggplotly(corr.plot)
  return(result)

}

