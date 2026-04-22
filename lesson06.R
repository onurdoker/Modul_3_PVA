# Creating regression table

# We will continue our analysis using the x_survey dataset created in lesson04. Therefore, we load the lesson04.RData file.
load("lesson04.RData")

# Installing and loading packages

# Check if the survey package is installed and install it if not installed. Then load it.
if (!requireNamespace('survey', quietly = TRUE)) {
  install.packages('survey')
}
library(survey)

# Check if the broom package is installed and install it if not installed. Then load it.
if (!requireNamespace('broom', quietly = TRUE)) {
  install.packages('broom')
}
library(broom)

# Check if the writexl package is installed and install it if not installed. Then load it.
if (!requireNamespace('writexl', quietly = TRUE)) {
  install.packages('writexl')
}
library(writexl)

# Check if the gtsummary package is installed and install it if not installed. Then load it.
if (!requireNamespace('gtsummary', quietly = TRUE)) {
  install.packages('gtsummary')
}
library(gtsummary)

# Check if the flextable package is installed and install it if not installed. Then load it.
if (!requireNamespace('flextable', quietly = TRUE)) {
  install.packages('flextable')
}
library(flextable)

# Check if the officer package is installed and install it if not installed. Then load it.
if (!requireNamespace('officer', quietly = TRUE)) {
  install.packages('officer')
}
library(officer)

# Regression
results <- svyglm(
  formula = depression ~
    lonely +
    age +
    education +
    female +
    married +
    hh_size +
    hh_income +
    firm_size +
    essround_factor +
    country_factor +
    occupation,
  design = x_survey,
  family = 'quasibinomial'
)

# The exponential values of the obtained results are calculated to compute the odds ratios.
result_tidy <- tidy(
  results,
  exponentiate = TRUE
)
View(result_tidy)


# Exporting the results to an Excel file.
write_xlsx(
  result_tidy,
  'results1.xlsx'
)

# Using the gtsummary package to create a regression table.
tbl_regression(
  results
)

# Calculating odds ratios for each variable in the regression model.
tbl_regression(
  results,
  exponentiate = TRUE
)


# Adding constant in our regression table.
tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE
)

# Reporting the variables we want in our regression table
tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  )
)

# Adjusting the p-values in the regression table to 3 digits after the demical point
tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  pvalue_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  }
)

# Adjusting the estimate values in the regression table to 3 digits
tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  pvalue_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  },
  estimate_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  }
)

# Adjusting the variable names in the regression table
tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  pvalue_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  },
  estimate_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  },
  label = list(
    lonely ~ 'Lonely dummy',
    age ~ 'Age',
    education ~ 'Education',
    female ~ 'Female',
    married ~ 'Married',
    hh_size ~ 'Household Size',
    hh_income ~ 'Household Income (Reference: Low Household Income)',
    firm_size ~ 'Firm Size (Reference: Under 25)'
  )
)

# Removing the referance rows from the table
tbl_result1 <- tbl_regression(
  results,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  pvalue_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  },
  estimate_fun = function(x) {
    format(
      round(
        x,
        digits = 3
      )
    )
  },
  label = list(
    lonely ~ 'Lonely dummy',
    age ~ 'Age',
    education ~ 'Education',
    female ~ 'Female',
    married ~ 'Married',
    hh_size ~ 'Household Size',
    hh_income ~ 'Household Income (Reference: Low Household Income)',
    firm_size ~ 'Firm Size (Reference: Under 25)'
  )
)
tbl_result1 <- remove_row_type(
  tbl_result1,
  variables = c(
    hh_income,
    firm_size
  ),
  type = 'reference'
)

# Changing variables name from "Charecteristic" to "Variables" in the column header
tbl_result1 <- modify_header(
  tbl_result1,
  label = '**Variables**'
)

# Saving the created table as a Word document

# Before saving the table, it needs to be saved in an object
tbl_result2 <- as_flex_table(
  tbl_result1
)

tbl_result3 <- read_docx()

tbl_result3 <- body_add_flextable(
  tbl_result3,
  tbl_result2
)

print(
  tbl_result3,
  target = "regression_results.docx"
)


save.image(file = 'lesson06.RData')
