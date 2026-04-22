''
'
We have previously completed the regression process with depression as dependent variable and loneliness as the main indepentent variable. From this point forward, it will be examined from a reverse causality perspective. At this stage, the regression analysis will be conducted wirh lonelineess as the dependent variable and depression as the main independent variable.

For this reason, the organised dataset in lesson04 will be used.

'
''

# Uploading Lesson04 Dataset
load("lesson04.RData")

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

x_survey <- svydesign(
  ids = ~psu,
  weights = ~anweight,
  data = x
)

# Regression
results2 <- svyglm(
  formula = lonely ~
    depression +
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

# Generate a summary statistics table for each variable in the dataset
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
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

# Split table by ESS periods
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor
)

# Change the report statistics
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  )
)

# Removing rows labeled "Unknown" in the table
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no'
)

# The gtsummary package treats categorical variables as factors by default. It is necessary to control for these factors and differentiate between those that are continuous
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  )
)

#  Format the demical numbers to display up to three demical places
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  )
)

# Labeling variable names
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    depression ~ 'Depression dummy, mean (SD, range)',
    lonely ~ 'Lonely dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size, mean (SD, range)',
    hh_income ~ 'Household income, n (%)',
    firm_size ~ 'Firm size, n (%)'
  )
)

# Adding the total column
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    depression ~ 'Depression dummy, mean (SD, range)',
    lonely ~ 'Lonely dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size, mean (SD, range)',
    hh_income ~ 'Household income, n (%)',
    firm_size ~ 'Firm size, n (%)'
  )
) %>%
  add_overall()

#  Removing annotations
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    depression ~ 'Depression dummy, mean (SD, range)',
    lonely ~ 'Lonely dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size, mean (SD, range)',
    hh_income ~ 'Household income, n (%)',
    firm_size ~ 'Firm size, n (%)'
  )
) %>%
  add_overall() %>%
  modify_footnote(
    all_stat_cols() ~ NA
  )

# Changing variables name from "Charecteristic" to "Variables" in the column header
tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    depression ~ 'Depression dummy, mean (SD, range)',
    lonely ~ 'Lonely dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size, mean (SD, range)',
    hh_income ~ 'Household income, n (%)',
    firm_size ~ 'Firm size, n (%)'
  )
) %>%
  add_overall() %>%
  modify_footnote(
    all_stat_cols() ~ NA
  ) %>%
  modify_header(
    label = '**Variable**'
  )

# Exporting the table to an word document.
summary_stat2_table1 <- tbl_svysummary(
  data = x_survey,
  include = c(
    depression,
    lonely,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    firm_size
  ),
  by = essround_factor,
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = c(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    depression ~ 'Depression dummy, mean (SD, range)',
    lonely ~ 'Lonely dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size, mean (SD, range)',
    hh_income ~ 'Household income, n (%)',
    firm_size ~ 'Firm size, n (%)'
  )
) %>%
  add_overall() %>%
  modify_footnote(
    all_stat_cols() ~ NA
  ) %>%
  modify_header(
    label = '**Variable**'
  )

summary_stat2_table2 <- as_flex_table(
  summary_stat2_table1
)

summary_stat2_table3 <- read_docx()

summary_stat2_table3 <- body_add_flextable(
  summary_stat2_table3,
  summary_stat2_table2
)
print(
  summary_stat2_table3,
  target = 'summary_stat2_table.docx'
)

# Regression
tbl_regression(
  results2
)

# The exponential values of the obtained results are calculated to compute the odds ratios.
results2_tidy <- tidy(
  results2,
  exponentiate = TRUE
)

# Adding constant in our regression table.
tbl_regression(
  results2,
  exponentiate = TRUE,
  intercept = TRUE
)

# Reporting the variables we want in our regression table
tbl_regression(
  results2,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    depression,
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
  results2,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    depression,
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
  results2,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    depression,
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
  results2,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    depression,
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
    depression ~ 'Depression Dummy',
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
tbl2_result <- tbl_regression(
  results2,
  exponentiate = TRUE,
  intercept = TRUE,
  include = c(
    depression,
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
    depression ~ 'Depression Dummy',
    age ~ 'Age',
    education ~ 'Education',
    female ~ 'Female',
    married ~ 'Married',
    hh_size ~ 'Household Size',
    hh_income ~ 'Household Income (Reference: Low Household Income)',
    firm_size ~ 'Firm Size (Reference: Under 25)'
  )
)
tbl2_result <- remove_row_type(
  tbl2_result,
  variables = c(
    hh_income,
    firm_size
  ),
  type = 'reference'
)

# Changing variables name from "Charecteristic" to "Variables" in the column header
tbl2_result <- modify_header(
  tbl2_result,
  label = '**Variables**'
)

# Saving the created table as a Word document
tbl2_result2 <- as_flex_table(
  tbl2_result
)

tbl2_result3 <- read_docx()

tbl2_result3 <- body_add_flextable(
  tbl2_result3,
  tbl2_result2
)

print(
  tbl2_result3,
  target = "regression_results2.docx"
)


save.image(file = 'lesson07.RData')
