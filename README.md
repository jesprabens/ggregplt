# ggregplt

The package, ggregplt, uses ggplot and plotly to make interactive regression plots, diagnostic plots, and correlation matrices for regression.

This package can be downloaded using the following steps:
```{r}
library(devtools)
install_github("jesprabens/ggregplt")

library(ggregplt)
```
## int_reg - Interactive Regression Plot

This function allows the user to input a regression model and get an itneractive regression plot returned.  Moreover, if a simple linear model is plotted this function can also take in an x value to produce a predited point on the plot.  Multiple linear regression models can also be plotted, but not with an inputted x.

### Example: int_reg

```{r}
regression <- lm(Sepal.Width~Sepal.Length, data = iris)

int_reg(mod = regression, x = 3)
```

This will prodcue an interactive plot with a predicted value of Sepal.Width when Sepal.Length is 5.


## MR - Multiple Regression 

This function  allows the user to plug in a multiple regression equation along with its' data set and gives the corresponding VIF values with the correlation matrix in order to diagnose multicollinearity

```{r}
equation <- lm(Sepal.Width~Sepal.Length+Petal.Length, data = iris)
equation
iris <- iris[,-5]
MR(iris, equation)
```

