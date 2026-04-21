''
'
ESS - European Social Survey

The European Social Survey (ESS) is a pan-European research infrastructure providing freely accessible data for academics, policymakers, civil society and the wider public.
https://ess.sikt.no/en/


SDDF is a variable that contains observation identifier, From ESS10 onwards, SDDF (Seconday Data File) was added to the integrated file. Therefore, in order to work with data prior to ESS10, we need to download and integrate the SDDF file with the integrated file.


The following code is used to download
ESS7 - SDDF and integrated file (ESS7_SDDF and ESS7)
ESS11 - Integrated file (ESS11)

'
''

# Install and load the necessary packages
install.packages("survey")
install.packages('broom')
install.packages('writexl')

library(survey)
library(broom)
library(writexl)

# Download ESS7_SDDF, ESS7 and ESS11 files from csv files
sddf_7 <- read.csv(
  "ESS7_SDDF.csv"
)

# Since we will using the last 6 columns, we are adjusting our dataset to haveonly this 6 columns.
sddf_7 <- sddf_7[,
  5:10
]

ess_7 <- read.csv(
  'ESS7.csv'
)

ess_11 <- read.csv(
  'ESS11.csv'
)

# we will merge data from the ESS_7 and SDDF_7 datasets where the cntry and idno variables are the same
ess_7 <- merge(
  x = ess_7,
  y = sddf_7,
  by = c('cntry', 'idno'),
  all.x = TRUE
)

# Since we don't need SDDF_7 data again, we will remove it.
rm(sddf_7)

# We will create an object containing the name of the ESS variables we will be using in our analysis. we will check if all variables are present in both ESS_7 and ESS_11 datasets. Then, we will combine only the varibles used in ESS_7 and ESS_11 into a single dataset.
common_vars <- c(
  'psu',
  'name',
  'essround',
  'edition',
  'proddate',
  'cntry',
  'idno',
  'anweight',
  'isco08',
  'hinctnta',
  'fltlnl',
  'fltdpr',
  'gndr',
  'agea',
  'eduyrs',
  'maritalb',
  'estsz',
  'hhmmb'
)

# we will check which variables are not present in ESS_7 and ESS_11 dataset.
common_vars[!(common_vars %in% colnames(ess_7))] # character(0) -> means all variables are present in ESS_7
common_vars[!(common_vars %in% colnames(ess_11))] # character(0) -> means all variables are present in ESS_11

# we will combine both datasets one below the other using the common_vars data
x <- rbind(
  subset(
    ess_7,
    select = common_vars
  ),
  subset(
    ess_11,
    select = common_vars
  )
)
View(x)

# All data sets except x should be removed from the workspace to free up memory.
rm(
  list = ls()[ls() != 'x']
)

# All categrorical variables are converted into factor variables in R

# Occupation
x$occupation <- ifelse(
  x$isco08 %in%
    c(
      66666,
      77777,
      88888,
      99999
    ),
  NA,
  x$isco08
)
x$occupation <- factor(
  x$occupation
)

# Household income
x$hh_income <- ifelse(
  x$hinctnta %in%
    c(
      77,
      88,
      99
    ),
  NA,
  x$hinctnta
)
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      1,
      2,
      3,
      4
    ),
  'Low Household Income',
  x$hh_income
)
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      5,
      6,
      7
    ),
  'Middle Household Income',
  x$hh_income
)
x$hh_income <- ifelse(
  x$hh_income %in%
    c(
      8,
      9,
      10
    ),
  'High Household Income',
  x$hh_income
)

# Checking the distribution of hh_income categories
table(x$hh_income)
# High Household Income    Low Household Income Middle Household Income
#                 19050                   29495                   23032

x$hh_income <- factor(
  x$hh_income,
  levels = c(
    'Low Household Income',
    'Middle Household Income',
    'High Household Income'
  )
)
table(x$hh_income)
#  Low Household Income Middle Household Income   High Household Income
#                 29495                   23032                   19050

# Setting the reference variable
x$hh_income <- relevel(
  x$hh_income,
  ref = 'Low Household Income'
)

# Firm Size
x$firm_size <- ifelse(
  x$estsz %in%
    c(
      6,
      7,
      8,
      9
    ),
  NA,
  x$estsz
)

x$firm_size <- ifelse(
  x$firm_size %in%
    c(
      1,
      2
    ),
  'Under 25',
  x$firm_size
)

x$firm_size <- ifelse(
  x$firm_size == 3,
  '25 to 99',
  x$firm_size
)

x$firm_size <- ifelse(
  x$firm_size %in%
    c(
      4,
      5
    ),
  '100 or more',
  x$firm_size
)

table(x$firm_size)
# 100 or more    25 to 99    Under 25
#       19957       17839       42005

x$firm_size <- factor(
  x$firm_size,
  levels = c(
    'Under 25',
    '25 to 99',
    '100 or more'
  )
)
table(x$firm_size)
#  Under 25    25 to 99 100 or more
#     42005       17839       19957

x$firm_size <- relevel(
  x$firm_size,
  ref = 'Under 25'
)

# House Hold Size
x$hh_size <- ifelse(
  x$hhmmb %in%
    c(
      77,
      88,
      99
    ),
  NA,
  x$hhmmb
)

# Sometimes the household size data can be zero and should not be included in the analysis.
# Check for zeros in hh_size
sum(
  x$hh_size == 0,
  na.rm = TRUE
) # 7

# Removing rows with household size equal to zero
x <- x[
  x$hh_size != 0,
]

# Lonely
x$lonely <- ifelse(
  x$fltlnl %in%
    c(
      7,
      8,
      9
    ),
  NA,
  x$fltlnl
)

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
  1,
  x$lonely
)

# Depression
x$depression <- ifelse(
  x$fltdpr %in%
    c(
      7,
      8,
      9
    ),
  NA,
  x$fltdpr
)

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

# GENDER -> Female
x$female <- ifelse(
  x$gndr == 9,
  NA,
  x$gndr
)

x$female <- ifelse(
  x$female == 2,
  1,
  0
)

# Age
x$age <- ifelse(
  x$agea == 999,
  NA,
  x$agea
)

# Education
x$education <- ifelse(
  x$eduyrs %in%
    c(
      77,
      88,
      99
    ),
  NA,
  x$eduyrs
)

# Married
x$married <- ifelse(
  x$maritalb %in%
    c(
      77,
      88,
      99
    ),
  NA,
  x$maritalb
)

x$married <- ifelse(
  x$married == 1,
  1,
  0
)

# Country Factor
x$country_factor <- factor(
  x$cntry
)

# ESS round factor
x$essround_factor <- factor(
  x$essround
)

# PSU factor
x <- x[!is.na(x$psu), ]

# Adjusting the data accourding to the sruvey design
x_survey <- svydesign(
  ids = ~psu,
  weights = ~anweight,
  data = x
)

save.image(file = "lesson04.RData")
