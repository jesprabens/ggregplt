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

  g <- buildplot(qqdf,
                 ptitle = "Studentized Residual Normal QQ Plot",
                 pxlab = "Sample Quantiles",
                 pylab = "Theoretical Quantiles",
                 hlinew = .4,
                 makeline = T)

  return(g)

}
