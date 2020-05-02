#' Calculates VIF and correlation matrix for a given Multiple Regression equation.
#'
#' @param dataset The dataset to be used
#' @param equation A multiple regression equation supplied by user
#'
#'
#' @return Plot and VIF
#'
#' @importFrom dplyr ggplot2 car reshape2 knitr irr dplyr
#' 
#'
#' @export

MR <- function(dataset, eq){
  data.from.eq <- dataset[ ,intersect(colnames(wine), names(eq$coefficients))]
  VIF <- vif(eq)
  corr.matrix <- round(cor(data.from.eq),2)
  corr.matrix.melt <- melt(corr.matrix)
  heatmap <- ggplot(data = corr.matrix.melt, aes(x=Var1, y=Var2, fill=value)) + 
    geom_tile() + 
    scale_fill_continuous(type = "viridis") + 
    ggtitle("Correlation Matrix")+
    theme(axis.title.x=element_blank(),
          axis.title.y=element_blank()) + 
    labs(fill = "Corr.")
  heatmap
    result <- list(heatmap, VIF)
    return(result)
}

