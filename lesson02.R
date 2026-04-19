# Installing and loading wooldridge package for database operatons
install.packages('wooldridge')
library(wooldridge)

# We are obtaining information about the CEOs of 209 companies
ceosal1 <- ceosal1
View(ceosal1)

lm(
  salary ~ roe,
  data = ceosal1
) #Intercept: 963.2 roe: 18.5

# To see the original regression results
res_ceosal1 <- lm(
  salary ~ roe,
  data = ceosal1
)
summary(res_ceosal1)

# A P-value less than 0.05 indicates that this value is statistically significant.
# Since the P-value of our study is 0.0978, the ROE value is not statistically significant compared to the Salary value.

# Scatter Plot for ROE vs. CEO Salary
plot(
  ceosal1$roe,
  ceosal1$salary,
  xlab = "Return of equity (ROE)",
  ylab = "CEO Salary",
  ylim = c(0, 4000)
)
# Adding a regression line to the plot
abline(
  res_ceosal1,
  col = "red"
)

# Another Regression Analysis: lin-lin Model
# The analysis of the relationship between employees' hourly wages ant their education durations
# y = ß0 + ß1x + u

wage1 <- wage1
lm(
  wage ~ educ,
  data = wage1
) #Intercept: -0.9049 educ: 0.5414

res_wage1 <- lm(
  wage ~ educ,
  data = wage1
)
summary(res_wage1)

# Scatter Plot for Education vs. Hourly Wage
plot(
  wage1$educ,
  wage1$wage,
  xlab = ("Education Duration (years)"),
  ylab = ("Hourly Wage ($)")
)

# Adding a regression line to the plot
abline(
  res_wage1,
  col = "red"
)

# Another Regression Model: log-lin Model
# In a log-lin model, the left-hand side of the equation (the dependent variable) is expressed as the logarith of its value, while the right-hand side (independent variables) are linear.

# log-lin regression
# log(y) = ß0 + ß1x + u
lm(
  log(wage) ~ educ,
  data = wage1
) # Intercept: -0.58377 educ: 0.08274

res_wage2 <- lm(
  log(wage) ~ educ,
  data = wage1
)
summary(res_wage2)

plot(
  wage1$educ,
  exp(predict(res_wage2)),
  xlab = 'Education Duration (years)',
  ylab = 'Hourly Wage ($)'
)

# log-log model
# log(y() = ß0 + ß1log(x) + u

lm(
  log(salary) ~ log(sales),
  data = ceosal1
) # Intercept: 4.8220 log(salary): 0.2567

res_ceosal2 <- lm(
  log(salary) ~ log(sales),
  data = ceosal1
)
summary(res_ceosal2)

# MULTIPLER REGRESSION
#  y = ß0 + ß1*x1 + ... + βk*xk + u

# THE CEO's salary, the firm's sales and the firm's market value (mktval)) are all explained.
# Log-log model

# Looking values
ceosal2 <- ceosal2
View(ceosal2)

res_ceosal3 <- lm(
  log(salary) ~ log(sales) + log(mktval),
  data = ceosal2
)
summary(res_ceosal3)
# log(salary) = 4.62092 + 0.16213log(sales) + 0.10671log(mktval)
# The R² value is 0.2991, meaning that these two explanatory variables account for 29.91% of the variation in the CEO's annual salary.

# Another example
# The CEO's salary, the firm's sales, the firm's market value (mktval), the firm's profit margin (profmarg), how many years the CEO has been employed in the company (cepten), and how many years the CEO has been an employee of the company (comten) are all explained

res_ceosal4 <- lm(
  log(salary) ~ log(sales) + log(mktval) + profmarg + ceoten + comten,
  data = ceosal2
)
summary(res_ceosal4)
# log(salary) = 4.571977 + 0.187787log(sales) + 0.099872log(mktval) -0.002211profmarg + 0.017104ceoten - 0.009238comten
# Upon examining the results, there is no significant impact of the firm's profit margin on CEO salary because the p-value has exceeded 0.05 (0.29514)
# The R² value is 0.3525, meaning that these five explanatory variables account for 35.25% of the variation in the CEO's annual salary.

# Another example
# The modelexpalined by wage rate, educational level (educ), work experience (exper), and the tenure in the last job (tenure)
# log(wage) = ß0 + ß1educ + ß2exper + ß3tenure
res_wage4 <- lm(
  log(wage) ~ educ + exper + tenure,
  data = wage1
)
summary(res_wage4)
# log(wage) = 0.284360 + 0.092029educ + 0.004121exper + 0.022067tenure

# The model explained by education level of person (educ), the number of siblings (sibs), the mother's education level (meduc), and the father's ecudation level (feduc)
# educ = ß0 + ß1sibs + ß2meduc + ß3feduc + u

wage2 <- wage2
View(wage2)

res_educ1 <- lm(
  educ ~ sibs + meduc + feduc,
  data = wage2
)
summary(res_educ1)
# educ = 10.36426 - 0.09364sibs + 0.13079meduc + 0.2100feduc

save.image(file = "lesson02.RData")
