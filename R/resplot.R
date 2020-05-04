#' Produces an interactive residual plot from an lm object
#'
#'
#' @param mod an object of class lm
#'
#'
#' @return g Interactive residual plot of class plotly
#'
#'
#' @importFrom ggplot2
#' @importFrom plotly ggplotly
#' @importFrom ggthemes theme_fivethirtyeight
#' @importFrom dplyr
#'
#' @export
#'

resplot <- function(mod){
  resdf <- data.frame(mod$fitted.values, rstandard(mod))
  
  resdf <- resdf %>%
    mutate(isprob = abs(resdf[,2]) > (3 * sd(resdf[,2])))
  
  g <- ggplot(resdf, aes(x = resdf[,1], y = resdf[,2], text = row.names(resdf), fill = isprob, color = isprob)) +
    geom_point() +
    theme_fivethirtyeight() +
    theme(legend.position = "none", axis.title = element_text()) +
    ggtitle("Residuals vs Predicted - Possible Outliers Shaded") +
    xlab("Predicted Values") +
    ylab("Studentized Residuals") +
    scale_fill_viridis_d() + 
    scale_color_viridis_d() +
    geom_hline(yintercept = 0, weight = .5)
  
  g <- ggplotly(g, tooltip = c("text"))
  
  return(g)
}

