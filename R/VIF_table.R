#' Calculates VIF for given multiple regression model
#'
#'
#' @param eq A multiple regression equation supplied by user
#'.@param limit A user defined limit for VIF value 
#'
#' @return VIF with decision if the value is too high or not
#'
#' @importFrom dplyr ggplot2 car reshape2 knitr irr dplyr lmf
#' 
#'
#' @export


VIF_table <- function(eq, limit){
  VIF <- data.frame(vif(eq))[,1]
  for (i in 1:length(VIF)){ 
  if (VIF[i] >= limit){
    decision <- "VIF value is above threshold. Multicollinearity may be violated for the specified threshold.
           See correlation matrix to find and remove correlated variables"
  }
  else{
    decision <- "VIF value is below specified range."
  }}
  result <- cbind(data.frame(vif(eq)), decision)
  colnames(result) <- c("VIF value", "notes")
  return(result)
}

