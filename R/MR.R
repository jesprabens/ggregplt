#' Calculates VIF and interactive correlation matrix for a given Multiple Regression equation.
#'
#'
#' @param eq A multiple regression equation supplied by user
#'
#'
#' @return Plot and VIF
#'
#' @importFrom dplyr
#' @importFrom ggplot2
#' @importFrom car
#' @importFrom reshape2
#' @importFrom knitr
#' @importFrom irr
#' @importFrom viridis
#' @importFrom ggiraph
#' @importFrom lmf
#' @importFrom ggcorrplot
#' @importFrom plotly
#'
#' @export

MR <- function(eq){
  dataset <- eq$model[,-1]
  corr <- round(cor(dataset), 1)
  VIF <- vif(eq)
  p.mat <- cor_pmat(dataset)
  corr.plot <- ggcorrplot(
    corr, hc.order = TRUE, outline.col = "white",
    p.mat = p.mat, colors = c("#FDE725FF", "#1F968BFF", "#440154FF")) +
    ggtitle("Correlation Matrix")
    result <- list(VIF, ggplotly(corr.plot))
  return(result)

}
