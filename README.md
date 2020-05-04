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

## VIF_table
This function  allows the user to plug in a multiple regression equation along with its' data set and gives the corresponding VIF values with the correlation matrix in order to diagnose multicollinearity

### Example: VIF_table
```{r}
equation <- lm(Sepal.Width~Sepal.Length+Petal.Length, data = iris)
VIF_Table(equation, 3)
```
This example will produce a dataframe of the VIF values of the predictor variables predicting Sepal.Width based on Sepal.Length, and Petal.Length from. the iris dataset and a note telling the user whether or not the VIF values are below their given threshold.

## MR - Multiple Regression 

This function  allows the user to plug in a multiple regression equation and returns a corresponding interactive correlation matrix in order to diagnose which variables are causing multicollinearity. 

### Example: MR
```{r}
equation <- lm(Sepal.Width~Sepal.Length+Petal.Length, data = iris)
MR(iris, equation)
```
This example will produce an interactive correlation matrix of the predictor variables predicting Sepal.Width based on Sepal.Length, and Petal.Length from. the iris dataset.
