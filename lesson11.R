''
'
PANEL STUDY OF INCOME DYNAMICS (PSID)

A dataset from the University of Michigan, which began with 5000 families in 1968 and expanded to include up 20000 families by over the years through participation of their choldren and grandchildren, will be used to examine intergeneration relationships.

PSID Website: https://psidonline.isr.umich.edu/

Dataset website: https://simba.isr.umich.edu/DC/s.aspx

Years     : 2021 - 2023

Data type : Transition into Adulthood Supplement
Variable  : Scale Loneliness                SCALE: LONELINESS
            Scale Score Depression.         SCALE SCORE: PHQ-9 DEPRESS SCREEN

Data type : PSID Individual-level
Variable  : Total Income                    OFUM TOTAL TAXABLE INCOME - IMPUTED 23
Variable  : Age of Individual               AGE OF INDIVIDUAL
Variable  : Years completed educ            YEARS COMPLETED EDUCATION
Variable  : Core IMM Individual WT          CORE/IMM INDIVIDUAL LONGITUDINAL WT

Data type : PSID Family-level
Variable  : Total Family Income             TOTAL FAMILY INCOME
Variable  : Reference Person Marital Status REFERENCE PERSON MARITAL STATUS
Variable  : # of Individual Records         # OF INDIVIDUAL RECORDS



Following files added in the folder:
J361365.zip

Codebooks:
J361365_codebook.html



'
''


# Install and load the packages

# Check if the modelsummary package is installed and install it if not installed. Then load it.
if (!requireNamespace('modelsummary', quietly = TRUE)) {
  install.packages('modelsummary')
}
library(modelsummary)

# Check if the tidyverse package is installed and install it if not installed. Then load it.
if (!requireNamespace('tidyverse', quietly = TRUE)) {
  install.packages('tidyverse')
}
library(tidyverse)

# Check if the fixest package is installed and install it if not installed. Then load it.
if (!requireNamespace('fixest', quietly = TRUE)) {
  install.packages('fixest')
}
library(fixest)

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

# Check if the psidread package is installed and install it if not installed. Then load it.
if (!requireNamespace('psidread', quietly = TRUE)) {
  install.packages('psidread')
}
library(psidread)

# Unlike previous studies, we have downloaded the data as a zip file from webpage and will open and use it within a this R script file.
psid_unzip(
  indir = '/Users/odoker/Documents/Projects/Veri Analiz Okulu/Modul_3_PVA',
  exdir = '/Users/odoker/Documents/Projects/Veri Analiz Okulu/Modul_3_PVA',
  zipped = TRUE,
  type = 'single',
  filename = 'J361365.zip'
)

# Creating a string file for the variables we want to use in our analysis
str_file <- psid_str(
  varlist = c(
    'marital_status || [21]ER78025 [23]ER82026',
    'hh_size || [21]ER81575 [23]ER85429',
    'family_income || [21]ER81775 [23]ER85629',
    'age || [21]ER34904 [23]ER35104',
    'education || [21]ER34952 [23]ER35152',
    'personal_income || [21]ER35049 [23]ER35249',
    'depression || [21]TA212332 [23]TA232339',
    'lonely || [21]TA212346 [23]TA232353',
    'weight || [21]ER35064 [23]ER35264'
  ),
  type = 'separated'
)

# Creating the data frame from the PSID data
x <- psid_read(
  indir = '/Users/odoker/Documents/Projects/Veri Analiz Okulu/Modul_3_PVA',
  str_df = str_file,
  idvars = c(
    'ER30002',
    'ER32000'
  ),
  type = 'single',
  filename = 'J361365'
)
View(x)

# Reshaping the data frame from wide to long
x <- psid_reshape(
  psid_df = x,
  str_df = str_file,
  shape = 'long',
  level = 'individual'
)

# Converting the column name to 'Gender'
colnames(x)[4] <- 'gender'

# Female variable
x$female <- ifelse(
  x$gender == 1,
  0,
  1
)
table(x$female)
# 0    1
# 3028 3302

# Married variable
x$married <- ifelse(
  x$marital_status == 9,
  NA,
  x$marital_status
)
x$married <- ifelse(
  x$married == 1,
  1,
  0
)
summary(x$married)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
#  0.0000  0.0000  0.0000  0.4104  1.0000  1.0000     243

# Education variable
x$education <- ifelse(
  x$education == 99,
  NA,
  x$education
)

# Personal Income variable
x$personal_income <- ifelse(
  x$personal_income < 0,
  0,
  x$personal_income
)
x$l_personal_income <- log(
  x$personal_income + 1,
  base = 10
)

# Family income variable
x$family_income <- ifelse(
  x$family_income < 0,
  0,
  x$family_income
)
x$l_family_income <- log(
  x$family_income + 1,
  base = 10
)

# Depression variable
x$depression <- ifelse(
  x$depression == 1,
  0,
  1
)
x <- x %>%
  group_by(pid) %>%
  arrange(
    pid,
    year
  ) %>%
  mutate(
    depression_panel = ifelse(
      depression == 1 & lag(depression) == 1,
      1,
      0
    )
  ) %>%
  ungroup()

# Lonely variable
x$lonely <- ifelse(
  x$lonely == 99,
  NA,
  x$lonely
)
x$lonely <- ifelse(
  x$lonely >= 5,
  1,
  0
)
x <- x %>%
  group_by(pid) %>%
  arrange(
    pid,
    year
  ) %>%
  mutate(
    lonely_panel = ifelse(
      lonely == 1 & lag(lonely) == 1,
      1,
      0
    )
  ) %>%
  ungroup()


# RESULTS
results_lonely <- feglm(
  fml = lonely_panel ~
    depression_panel +
    age +
    l_personal_income +
    l_family_income +
    female +
    education +
    hh_size |
    year,
  data = x,
  family = 'logit',
  panel.id = c(
    'pid',
    'year'
  ),
  fixef.rm = 'none',
  cluster = ~pid,
  weights = x$weight
)

tbl_results_lonely1 <- modelsummary(
  results_lonely,
  exponentiate = TRUE,
  stars = TRUE
)


save.image(file = 'lesson11.RData')
