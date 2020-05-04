 #' Produces an interactive leverage plot from an lm object
#'
#'
#' @param mod an object of class lm
#'
#'
#' @return g Interactive leverage plot of class Plotly
#'
#'
#' @import dplyr
#'
#'
#' @export
#'

levplot <- function(mod){
  levdf <- data.frame(hatvalues(mod), rstandard(mod))

  levdf <- levdf %>%
    mutate(isprob = levdf[,1] > (2 * (mod$rank-1) / nrow(levdf)))

  g <- buildplot(levdf,
                 ptitle = "Residuals vs Leverage - Points Over 2*k / n Shaded",
                 pxlab = "Leverage",
                 pylab = "Studentized Residuals")

  return(g)

}
