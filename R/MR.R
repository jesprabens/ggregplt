MC <- function(dataset, eq){
  xvars <- data.frame(attr(eq$terms, "term.labels"))
  data.from.eq <- dataset  %>% subset(colnames(dataset) == xvars)
  VIF <- vif(eq)
  corr.matrix <- round(cor(data.from.eq),2)
  corr.matrix.melt <- melt(cormat)
  corr.matrix.melt <- corr.matrix.melt[,-c(3,4)]
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
