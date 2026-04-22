""
"
Within the scope of this lesson, the dateset from Turkish General Social Survey (TGSS) conducted across Turkish in 2024 will be utilized. This survey convers the country's social, cultural, economic, and politic structures.

The dataset canbe downloaded from the following link: https://www.tgss.org.tr/

"
""

# Check if the haven package is installed and install it if not installed. Then load it.
if (!requireNamespace('haven', quietly = TRUE)) {
  install.packages('haven')
}
library(haven)

# Check if the labelled package is installed and install it if not installed. Then load it.
if (!requireNamespace('labelled', quietly = TRUE)) {
  install.packages('labelled')
}
library(labelled)

# Check if the broom package is installed and install it if not installed. Then load it.
if (!requireNamespace('broom', quietly = TRUE)) {
  install.packages('broom')
}
library(broom)

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

# Check if the writexl package is installed and install it if not installed. Then load it.
if (!requireNamespace('writexl', quietly = TRUE)) {
  install.packages('writexl')
}
library(writexl)

# Upload the dataset from TGSS2024.sav
x <- read_sav(
  'TGSS2024.sav'
)
View(x)

# The defination of the dependent variables
# Lonely
x$lonely <- x$welalone
x$lonely <- ifelse(
  x$lonely == 1,
  0,
  x$lonely
)
x$lonely <- ifelse(
  x$lonely %in%
    c(
      2,
      3,
      4
    ),
  0,
  x$lonely
)

# Main dependent variable
# Depression
x$depression <- x$weldepp
x$depression <- ifelse(
  x$depression == 1,
  0,
  x$depression
)
x$depression <- ifelse(
  x$depression %in%
    c(
      2,
      3,
      4
    ),
  1,
  x$depression
)

# Household Income
x$hh_income <- x$incomehh
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      1:8
    ),
  'Low household income',
  x$hh_income
)
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      9:15
    ),
  'Middle household income',
  x$hh_income
)
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      16:24
    ),
  'High household income',
  x$hh_income
)
x$hh_income <- factor(
  x$hh_income,
  levels = c(
    'Low household income',
    'Middle household income',
    'High household income'
  )
)
x$hh_income <- relevel(
  x$hh_income,
  ref = 'Low household income'
)

# Education
x$education <- x$degree
x$education <- ifelse(
  x$education == 1,
  'None',
  x$education
)
x$education <- ifelse(
  x$education %in%
    c(
      2,
      3
    ),
  'Primary and middle school',
  x$education
)
x$education <- ifelse(
  x$education == 4,
  'High school',
  x$education
)
x$education <- ifelse(
  x$education %in%
    c(
      5,
      6,
      7,
      8
    ),
  'University and above',
  x$education
)
table(x$education)
x$education <- factor(
  x$education,
  levels = c(
    'None',
    'Primary and middle school',
    'High school',
    'University and above'
  )
)
x$education <- relevel(
  x$education,
  ref = 'None'
)

# Urban Rural
x$urban_rural <- ifelse(
  x$degurba == 1,
  'Rural',
  x$degurba
)
x$urban_rural <- ifelse(
  x$urban_rural == 2,
  'Medium density urban',
  x$urban_rural
)
x$urban_rural <- ifelse(
  x$urban_rural == 3,
  'High density urban',
  x$urban_rural
)
x$urban_rural <- factor(
  x$urban_rural,
  levels = c(
    'Rural',
    'Medium density urban',
    'High density urban'
  )
)
x$urban_rural <- relevel(
  x$urban_rural,
  ref = 'Rural'
)

# Married
x$married <- ifelse(
  x$marital %in%
    c(
      1,
      4,
      5,
      6
    ),
  0,
  1
)

# Female
x$female <- ifelse(
  x$gender == 1,
  0,
  1
)

# Household Size
# In the TGSS dataset we are using, for household-related questions, the variable hhsize indicates the number of people living in a household. However, this variable does not include the respondent themselves. Therefore, for each individual in a household, the value of hhsize is one less than the actual number of people living in the household. Therefore, we need to add 1 to the value of hhsize to get the correct household size

x$hh_size <- x$hhsize + 1

# Region
x$region <- x$nuts1
x$region <- factor(
  x$region
)

# Regression
result_lonely <- glm(
  lonely ~
    depression +
    age +
    education +
    female +
    married +
    hh_size +
    hh_income +
    urban_rural +
    region,
  data = x,
  family = 'binomial'(link = 'logit')
)

# Summary of the regression results
summary(
  result_lonely
)

# Calculate odds ratios for each variable in the regression model
result_lonely_tidy <- tidy(
  result_lonely,
  exponentiate = TRUE
)
View(result_lonely_tidy)

# Save the summary and tidy output to an Excel file
write_xlsx(
  result_lonely_tidy,
  'results_lonely.xlsx'
)

# Summary Statistics Table for the Regression Model
summary_stat_table_lonely <- tbl_summary(
  data = x,
  include = c(
    lonely,
    depression,
    age,
    education,
    female,
    married,
    hh_size,
    hh_income,
    urban_rural
  ),
  statistic = list(
    all_continuous() ~ '{mean} ({sd}, {min} - {max})',
    all_categorical() ~ '{n} ({p}%)'
  ),
  missing = 'no',
  type = list(
    lonely ~ 'continuous',
    depression ~ 'continuous',
    female ~ 'continuous',
    married ~ 'continuous'
  ),
  digits = list(
    all_continuous() ~ c(3, 3, 0, 0),
    all_categorical() ~ c(0, 0)
  ),
  label = list(
    lonely ~ 'Lonely dummy, mean (SD, range)',
    depression ~ 'Depression dummy, mean (SD, range)',
    age ~ 'Age, mean (SD, range)',
    education ~ 'Education, mean (SD, range)',
    female ~ 'Female, mean (SD, range)',
    married ~ 'Married, mean (SD, range)',
    hh_size ~ 'Household size mean (SD, range)',
    hh_income ~ 'Household income level, n (%)',
    urban_rural ~ 'Urban - rural location, n (%)'
  )
) %>%
  modify_footnote(
    all_stat_cols() ~ NA
  ) %>%
  modify_header(
    label = '**Variable**'
  )


summary_stat_table_lonely2 <- as_flex_table(
  summary_stat_table_lonely
)

summary_stat_table_lonely3 <- read_docx()

summary_stat_table_lonely3 <- body_add_flextable(
  summary_stat_table_lonely3,
  summary_stat_table_lonely2
)

print(
  summary_stat_table_lonely3,
  target = 'summary_stat_table_lonely.docx'
)


# Reporting of the Regression Results
tbl_results_lonely1 <- tbl_regression(
  result_lonely,
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
    urban_rural
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
    depression ~ 'Depression dummy',
    age ~ 'Age',
    education ~ 'Education (Referance: None)',
    female ~ 'Female',
    married ~ 'Married',
    hh_size ~ 'Household Size',
    hh_income ~ 'Household Income (Reference: Low Household Income)',
    urban_rural ~ 'Urban-Rural Location (Reference: Urban)'
  )
) %>%
  remove_row_type(
    variables = c(
      education,
      hh_income,
      urban_rural
    ),
    type = 'reference'
  ) %>%
  modify_header(
    label = '**Variable**'
  )


tbl_results_lonely2 <- as_flex_table(
  tbl_results_lonely1
)

tbl_results_lonely3 <- read_docx()

tbl_results_lonely3 <- body_add_flextable(
  tbl_results_lonely3,
  tbl_results_lonely2
)

print(
  tbl_results_lonely3,
  'regression_results_lonely.docx'
)

save.image(file = 'lesson08.RData')
