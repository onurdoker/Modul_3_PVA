# Creating an overview statistic table

# Since we will continue with the data sets created in the previous lesson, lesson04.RData file is loaded here.
load("lesson04.RData")

# The R package gtsummary will be used for the following processing, so the relevant packages are loaded

# Check if the gtsummary package is installed and install it if not installed. Then load it.
if (!requireNamespace('gtsummary', quietly = TRUE)) {
  install.packages('gtsummary')
}
library(gtsummary)

# Check if the flextable package is installed and install it if not installed. Then load it.
if (!requireNamespace('flextable')) {
  install.packages('flextable')
}
library(flextable)

# Check if the officer package is installed and install it if not installed. Then load it.
if (!requireNamespace("officer", quietly = TRUE)) {
  install.packages('flextable')
}
library(officer)

# Create a summary table for each variable in the dataset
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

# We will split table by ESS periods
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

# We will change the reported statistics
# by default,
# The number of observations and percentage for categorical variables are reported
# The continous variables, the median and quartiles (Q1 and Q3) are reported

# We want to arrange it so that for continuous variables, we report mean and standard deviation and range instead of median and quartiles
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

# By default, gtsummary treats categorical variables as factors. Therefore we will convert continuous variables like depression and lonely to continuous variables.
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
  type = list(
    depression ~ 'continuous',
    lonely ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  )
)

# We need all the data to be formatted with three digits after the demical point
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
  type = list(
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
  type = list(
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
  type = list(
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

# Removing annotations
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
  type = list(
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
  type = list(
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
    label = '**Variables**'
  )

# Saving the created table as a Word document

# Before saving the table, it needs to be saved in an object
summary_stat_table <- tbl_svysummary(
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
  type = list(
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
    label = '**Variables**'
  )

# The most efficient table display package is the flextable package. It provides a lot of flexibility and customization options for tables.
summary_stat_table2 <- as_flex_table(
  summary_stat_table
)

# Creating as word document
summary_stat_table3 <- read_docx()

# Saving the final output to a Word document
summary_stat_table3 <- body_add_flextable(
  summary_stat_table3,
  summary_stat_table2
)
print(
  summary_stat_table3,
  target = 'summary_stat_table.docx'
)

save.image(file = "lesson05.RData")
