#'
#' @param mod List output from an lm() call
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
  pquants <- 1:n / n
  tquants <- qnorm(pquants)


  y <- res[order(res, decreasing = T)] #sort x = data values
  x <- tquants[order(tquants,decreasing = T)] #sort generated values

  qqdf <- data.frame(x,y) #bind together

  qqp <- ggplot(qqdf, aes(x,y, text = row.names(qqdf))) + #x is data values, y is normal values
    geom_point() +
    geom_abline() + #fit line y = x
    xlab("Data Values") +
    ylab("Theoretical Qunatiles") +
    ggtitle("Normal QQ Plot") +
    theme_fivethirtyeight()

  g <- ggplotly(qqp, tooltip = c("Row: ", "text"))

  return(g)
}
