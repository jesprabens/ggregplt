#' Produces an interactive leverage plot from an lm object
#'
#'
#' @param mod an object of class lm
#'
#'
#' @return g Interactive leverage plot of class Plotly
#'
#' @importFrom ggplot2
#' @importFrom plotly ggplotly
#' @importFrom ggthemes theme_fivethirtyeight
#' @importFrom dplyr
#'
#'
#' @export
#'

levplot <- function(mod){
  levdf <- data.frame(hatvalues(mod), rstandard(mod))

  levdf <- levdf %>%
    mutate(isprob = levdf[,1] > (2 * (mod$rank-1) / nrow(levdf)))

  g <- ggplot(levdf, aes(x = levdf[,1], y = levdf[,2], text = row.names(levdf), color = !isprob)) +
    geom_point() +
    geom_smooth() +
    ggtitle("Residuals vs Leverage - Points Over 2*k / n Shaded") + #fit line y = x
    xlab("Leverage") +
    ylab("Studentized Residuals") +
    scale_fill_viridis_d() +
    scale_color_viridis_d() +
    theme_fivethirtyeight() +
    theme(legend.position = "none", axis.title = element_text())

  g <- ggplotly(g, tooltip = c("text"))

  return(g)
}
