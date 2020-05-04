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
  return(cbind(VIF, decision))
}
