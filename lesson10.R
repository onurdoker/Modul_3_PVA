''
'
Michigan University has conducted surveys every two years since 1992 to approximately 20,000 individuals (the same people). We will examine the relationship between loneliness and depression using data from these surveys, as we have done in previous studies.

HRS Website: https://hrsdata.isr.umich.edu/


*** TO DO ***
1. Download the first dataset from the HRS website
Dataset Website: https://hrsdata.isr.umich.edu/data-products/long-format-data-rand-hrs-longitudinal-file-2020

2.Due to the large size of the datasets, they cannot all be uploaded to GitHub. Therefore, you need to download the dataset from the following link for use in this study.

Following files added in the folder:
hlong_table.sas7bdat
rlong_table.sas7bdat
rwide_table.sas7bdat

Codebooks:
RAND_HRS long format 2020v2.pdf
randhrs1992_2022.pdf


3. In previous studies, inflation was not considered as the data was collected over relatively short periods. However, in this study, with data ranging from 1992 to 2020, we must include inflation figures.

FRED Website: https://fred.stlouisfed.org/

For this purpose, you need to download the CPI data from the following website and use it in your study.
Dataset Website: https://fred.stlouisfed.org/series/CPALWE01USA661N

After making necessary adjustments, save the file as "cpi.xlsx".
CPALWE01USA661N.xlsx
cpi.xlsx
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

# Check if the readxl package is installed and install it if not installed. Then load it.
if (!requireNamespace('readxl', quietly = TRUE)) {
  install.packages('readxl')
}
library(readxl)

# Load the data from within the dataset.
x <- read_sas(
  'rlong_table.sas7bdat'
)
View(x)

# For age variables
y <- read_sas(
  'rwide_table.sas7bdat'
)
View(y)

# For household variables
z <- read_sas(
  'hlong_table.sas7bdat'
)
View(z)

# For cpi variable
cpi <- read_xlsx(
  'cpi.xlsx'
)

# Remove any unnecessary columns.
y <- y[,
  -c(
    1:3,
    5
  )
]

# Merging x and y datasets
x <- merge(
  x = x,
  y = y,
  by = 'RAHHIDPN',
  all.x = TRUE
)

# Removing unnecessary dataset
rm(y)

# Remove any unnecessary columns.
z <- z[,
  -c(
    1:3,
    5:7,
    9:12
  )
]

# Merging x and z datasets
x <- merge(
  x = x,
  y = z,
  by = c(
    'RAHHIDPN',
    'WAVE_NAME'
  ),
  all.x = TRUE
)

# Removing unnecessary dataset
rm(z)

# Merge x and cpi datasets
x <- merge(
  x = x,
  y = cpi,
  by = 'STUDYYR',
  all.x = TRUE
)

# Removing unnecessary dataset
rm(cpi)

#  Organize the data.

# Personal Income variable
x$l_r_personal_income <- log(
  (1 + x$R_IEARN) / x$cpi,
  base = 10
)

# Household Income variable
x$l_r_household_income <- log(
  (1 + x$H_ITOT) / x$cpi,
  base = 10
)

# Age variable
summary(x$R_AGEY_B)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
# 18.00   57.00   65.00   66.39   75.00  109.00       2
x$age <- x$R_AGEY_B
hist(x$age)

# Female variable
x$female <- x$RAGENDER
x$female <- ifelse(
  x$female == 1,
  0,
  1
)

# Married variable
table(x$R_MPART)
#      0      1
# 269160  11183
x$married <- x$R_MPART

# Education variable
table(x$RAEDYRS)
#     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17
#  2523   762  1190  2852  2163  2576  5934  4147 11943  9344 13728 13613 90291 20390 28684 10670 29900 29014
x$education <- x$RAEDYRS

# Region variable
table(x$R_CENREG)
#      1      2      3      4      5
#  44410  65323 116835  53179    424
x$region <- x$R_CENREG
typeof(x$region) # double

x$region <- as.character(
  x$region
)

typeof(x$region) # character

x$region <- factor(
  x$region
)

attributes(x$region) # factor

# hh_size variable
x$hh_size <- x$H_HHRES

# Weight variable
x$weight <- x$R_WTRESP

# Lonely variable
table(x$R_FLONE)
#      0      1
# 205225  42694
x$lonely <- x$R_FLONE
x <- x %>%
  group_by(
    RAHHIDPN
  ) %>%
  arrange(
    RAHHIDPN,
    WAVE_NAME
  ) %>%
  mutate(
    lonely_panel = ifelse(
      lonely == 1 & lag(lonely) == 1,
      1,
      0
    )
  ) %>%
  ungroup()

# Depression variable
table(x$R_DEPRES)
#      0      1
# 210010  37915
x$depression <- x$R_DEPRES
x <- x %>%
  group_by(
    RAHHIDPN,
  ) %>%
  arrange(
    RAHHIDPN,
    WAVE_NAME
  ) %>%
  mutate(
    depression_panel = ifelse(
      depression == 1 & lag(depression) == 1,
      1,
      0
    )
  ) %>%
  ungroup()

# REGRESSION
results_lonely <- feglm(
  fml = lonely_panel ~
    depression_panel +
    age +
    l_r_personal_income +
    l_r_household_income +
    female +
    married +
    education +
    hh_size |
    WAVE_NAME +
      region,
  data = x,
  family = 'logit',
  panel.id = c(
    'RAHHIDPN',
    'WAVE_NAME'
  ),
  weights = x$weight,
  fixef.rm = 'none',
  cluster = ~RAHHIDPN
)

# RESULTS
modelsummary(
  results_lonely,
  exponentiate = TRUE
)

modelsummary(
  results_lonely,
  exponentiate = TRUE,
  stars = TRUE
)

save.image(file = 'lesson10.RData')
