#'
#' @param mod lm object
#'
#'
#' @return ggplot object
#'
#' @importFrom ggplot2 ggthemes
#'
#'
#' @export

qq <- function(mod){
  res <- rstandard(mod)

  n = length(res)
  pquants <- 1:n / n #evenly spaced
  tquants <- qnorm(pquants) #theoretical quantiles from normal dist

  y <- res[order(res, decreasing = T)]
  x <- tquants[order(tquants,decreasing = T)]

  qqdf <- data.frame(x,y)

  qqp <- ggplot(qqdf, aes(x,y, text = row.names(qqdf))) + #adding row number for labeling
    geom_point() +
    geom_abline() + #fit line y = x
    xlab("Sample Quantiles") +
    ylab("Theoretical Qunatiles") +
    ggtitle("Normal QQ Plot") +
    theme_fivethirtyeight()

  g <- ggplotly(qqp, tooltip = c("Row: ", "text"))

  return(g)
}
