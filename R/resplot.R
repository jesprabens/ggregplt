#'
#' Produces an interactive residual plot from an lm object
#'
#'
#' @param mod an object of class lm
#'
#'
#' @return g Interactive residual plot of class plotly
#'
#'
#' @import dplyr
#'
#'
#' @export
#'
#'


resplot <- function(mod){

  resdf <- data.frame(mod$fitted.values, rstandard(mod))

  resdf <- resdf %>%
    mutate(isprob = abs(resdf[,2]) > (3 * sd(resdf[,2])))


  g <- buildplot(resdf,
                 ptitle = "Residuals vs Predicted - Possible Outliers Shaded",
                 pxlab = "Predicted Values",
                 pylab = "Studentized Residuals",
                 hlinew = T)

  return(g)

}


#' Builds plotly interactive plot for each diagnostic function
#'
#'
#' @param plotdf dataframe with x, y, and isprob data
#' @param ptite title of plot
#' @param pxlab x label
#' @param pylab y label
#' @param hlinew whether or not to make horizontal line at y = 0
#' @param makeline whether or not to fit y = x abline
#'
#'
#' @return g Interactive plot of class plotly
#'
#'

#' @import ggplot2
#' @importFrom plotly ggplotly
#' @importFrom ggthemes theme_fivethirtyeight
#' @import dplyr

#'
#'
#' @export
#'
#'


buildplot <- function(plotdf, ptitle, pxlab, pylab, hlinew = F, makeline = F){

  if (!"isprob" %in% names(plotdf)){
    plotdf <- plotdf %>%
      mutate(isprob = F)
  }

  g <- ggplot(plotdf, aes(x = plotdf[,1], y = plotdf[,2], text = row.names(plotdf), fill = isprob, color = isprob)) +
    geom_point() +
    theme_fivethirtyeight() +
    theme(legend.position = "none", axis.title = element_text()) +
    ggtitle(ptitle) +
    xlab(pxlab) +
    ylab(pylab) +
    scale_fill_viridis_d() +
    scale_color_viridis_d()

  if (makeline){
    g <- g + geom_abline()
  }

  if (hlinew){
    g <- g + geom_hline(yintercept = 0)
  }

  g <- ggplotly(g, tooltip = c("text"))

  return(g)

}

