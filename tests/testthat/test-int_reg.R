y <- c(1,4,2,6,3,5,2,1,4,5)
x1 <- c(2,5,6,8,6,4,9,3,1,3)
x2 <- c(1,2,3,2,4,5,3,6,6,4)
reg1 <- lm(y ~ x1)
reg2 <- lm(y ~ x1 + x2)


test_that("int_reg produces a simple linear interactive plot with predcited y", {

  correct_result <- c(3.161398) # the predcited response when 3 is plugged into this regression

  test_plot1 <- int_reg(reg1, 3)
  predicted_value <- test_plot1$x$data[[3]]$y[1]

  my_result <- predicted_value

  expect_equal(my_result, correct_result)
})


test_that("multi_reg produces several interactive plots for the y and each x variable", {

  correct_result <- multi_reg(reg2)

  my_result <- int_reg(reg2)

  expect_equal(my_result, correct_result)
})
