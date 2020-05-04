#' Produces an interactive leverage plot from an lm object
#'
#'
#' @param mod an object of class lm
#'
#'
#' @return g Interactive qqnorm plot of class Plotly
#'
#' @importFrom ggplot2
#' @importFrom plotly ggplotly
#' @importFrom ggthemes theme_fivethirtyeight
#' @importFrom dplyr
#'
#' @export
#'


qq <- function(mod){
  
  res <- rstandard(mod)

  n = length(res)
  
  pquants <- 1:n / n 
  tquants <- qnorm(pquants) 

  y <- res[order(res, decreasing = T)]
  x <- tquants[order(tquants,decreasing = T)]

  qqdf <- data.frame(x,y)

  qqp <- ggplot(qqdf, aes(x,y, text = row.names(qqdf))) +
    geom_point() +
    geom_abline() + 
    xlab("Sample Quantiles") +
    ylab("Theoretical Qunatiles") +
    ggtitle("Studentized Residual Normal QQ Plot") +
    scale_fill_viridis_d() +
    scale_color_viridis_d() +
    theme_fivethirtyeight() +
    theme(axis.title = element_text()) 

  g <- ggplotly(qqp, tooltip = c("Row: ", "text"))

  return(g)
}
