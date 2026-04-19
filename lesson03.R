# The real estate prices data (HPRICE1) from Wooldridge package will be used.

# A model that explains the price of a house (price) by its size (sqrft) and the number of bedrooms (bdrms)
# price = ß0 + ß1sqrft + ß2bdrms + u

# Load Wooldridge package and data set HPRICE1
library(wooldridge)
hprice1 <- hprice1
View(hprice1)

res_hprice1 <- lm(
  price ~ sqrft + bdrms,
  data = hprice1
)
summary(res_hprice1)
# price = -19.3150 + 0.12844sqrft + 15.19819bdrms
# The R² value is 0.6319, meaning that the variation in house size and the number of bedrooms explains 63.2% of the variation in the house price.

# Quadratic Models
# y = ß0 + ß1x + ß2x^2 + u
# ß1 indicates whether the relationship between x and y is positive or negative
# ß2 indicates how much the slope changes as x
wage1 <- wage1
View(wage1)

# The "I" function allows you to use a variable in your regression model as if it were an independent variable. In this case, we are using the square of the exper variable (exper^2) as an independent variable.
# If the "I" function is not used, R will treat exper as a continuous variable and create multiple dummy variables for each level of exper. This can lead to multic ollinearity in your model. In this case, we are using the square of exper as an independent variable because it allows us to capture non-linear relationships between exper and wage.
# Interaction term, which is a variable that represents the product of two or more other variables.

res_wage5 <- lm(
  wage ~ exper + I(exper^2),
  data = wage1
)
summary(res_wage5)
# wage = 3.72540 + 0.29810exper - 0.00612exper^2

''
'
DUMMY VARIABLES

Dummy variables are variables that take on only two values, typically 0 and 1. They are used to represent categorical variables in regression models. For example, if we have a variable called " gender" that takes on the values "male" and "female", we can create a dummy variable called "gender_male" that takes on the value 1 if the person is male and 0 if the person is female. This allows us to include the effect of gender in our regression model.
'
''

# Example of dummy variable in R
# wage = ß0 + ß1female + ß2educ + ß3exper + ß4tenure + u
res_wage6 <- lm(
  wage ~ female + educ + exper + tenure,
  data = wage1
)
summary(res_wage6)
# wage = -1.56794 - 1.81085female + 0.57150educ + 0.02540exper + 0.14101tenure

# Another example of dummy variable in R
# From Woodridge package's GPA1 dataset
# A model that explains a student's university GPA (colGPA), high school GPA (hsGPA), ACT Score while taking the college major (ACT), and whether or not they have access to a computer (PC).
# colGPA = ß0 + ß1hsGPA + ß2ACT + ß3PC + u

gpa1 <- gpa1
View(gpa1)

res_colgpa1 <- lm(
  colGPA ~ hsGPA + ACT + PC,
  data = gpa1
)
summary(res_colgpa1)
# colGPA = 1.2635 + 0.4472hsGPA + 0.0086ACT + 0.1573PC

# Another Example of dummy variable in R

# log(wage) = ß0 + ß1female + B2educ + ß3exper + ß4exper^2 + ß5tenure + ß6tenure^2 + u

res_wage7 <- lm(
  log(wage) ~ female + educ + exper + I(exper^2) + tenure + I(tenure^2),
  data = wage1
)
summary(res_wage7)
# log(wage) = 0.41669 - 0.29511female + 0.08019educ + 0.029432exper - 0.00058exper^2 + 0.03171tenure - 0.00058tenure^2

# if we add the previous example's marriage variable as well

# log(wage) = ß0 + ß1female + ß2marriage + B3educ + ß4exper + ß5exper^2 + ß6tenure + ß7tenure^2 + u

res_wage8 <- lm(
  log(wage) ~ female +
    married +
    educ +
    exper +
    I(exper^2) +
    tenure +
    I(tenure^2),
  data = wage1
)
summary(res_wage8)
# log(wage) = 0.41778 - 0.29018female + 0.05292married + 0.07915educ + 0.02695exper - 0.00053exper^2 + 0.03129tenure - 0.00057tenure^2

#
# Creating dummy variables
# dummy variables for married and male
wage1$marrmale <- ifelse(
  wage1$female == 0 & wage1$married == 1,
  1,
  0
)

# dummy variables for female and married
wage1$marrfemale <- ifelse(
  wage1$female == 1 & wage1$married == 1,
  1,
  0
)

# dummy variables for female and single
wage1$singfem <- ifelse(
  wage1$female == 1 & wage1$married == 0,
  1,
  0
)

# using the dummy variables in the regression model
res_wage9 <- lm(
  log(wage) ~ marrmale +
    marrfemale +
    singfem +
    educ +
    exper +
    I(exper^2) +
    tenure +
    I(tenure^2),
  data = wage1
)
summary(res_wage9)
# log(wage) = 0.32137 + 0.21267marrmale - 0.19826marrfemale - 0.11035singfem +0.07891educ + 0.02680exper -0.00053exper^2 + 0.02908tenure - 0.00053tenure^2

save.image(file = "lesson03.RData")
