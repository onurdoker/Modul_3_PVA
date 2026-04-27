# To continue from where we left off in the previous lesson, load the data from the previous lesson into your R environment.

load('lesson09.RData')

# Similarly, you need to reload any library loaded in the previous lesson.
library(tidyverse)
library(fixest)
library(modelsummary)
library(flextable)
library(officer)

#
modelsummary(
  results_lonely,
  exponentiate = TRUE
)

modelsummary(
  results_lonely,
  exponentiate = TRUE,
  stars = TRUE
)

# Ensure that variable names are consistently formatted
modelsummary(
  results_lonely,
  exponentiate = TRUE,
  stars = TRUE,
  coef_map = c(
    depression_panel = 'Depression dummy',
    age = 'Age',
    family_income = 'Family income',
    female = 'Female',
    married = 'Married',
    family_size = 'Family size'
  )
)

# Save the results in a Word document
tbl_results_lonely1 <- modelsummary(
  results_lonely,
  exponentiate = TRUE,
  stars = TRUE,
  coef_map = c(
    depression_panel = 'Depression dummy',
    age = 'Age',
    family_income = 'Family income',
    female = 'Female',
    married = 'Married',
    family_size = 'Family size'
  ),
  output = 'flextable'
)

tbl_results_lonely2 <- read_docx()

tbl_results_lonely2 <- body_add_flextable(
  tbl_results_lonely2,
  tbl_results_lonely1
)

print(
  tbl_results_lonely2,
  target = 'regression_results_lonely2.docx'
)

save.image(file = 'lesson10.RData')
