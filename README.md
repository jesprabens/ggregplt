# ggregplt
 Uses ggplot to make diagnostic plots for regression

## MR - Multiple Regression 
* with this function you can plug in a multiple regression equation along with its' data set and gives the corresponding VIF values with the correlation matrix in order to diagnose multicollinearity

```{r}
equation <- lm(Sepal.Width~Sepal.Length+Petal.Length, data = iris)
equation
iris <- iris[,-5]
MR(iris, equation)
```

