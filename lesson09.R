""
"
PANEL DATA ANALYSIS

Until now, we have been working with cross-section data; however, this lesson will introduce panel data analysis.
In cross-section data, the focus is observing different units at a single point in time and studying their changes.
Panel data, on the other hand, involves observing multiple units over multiple points in time. This allows us to study how these units change over time and how they interact with each other.

This study will also utilize data from the National Longitudinal Survey of Youth (NLSY) dataset, which is a comprehensive database that contains information on various aspects of young people's lives. The NLSY dataset includes variables such as age and income, education level, and employment status. We will use this dataset to analyze the relationship between these variables over time.
In summary, panel data analysis allows us to study how different units change over time and how they interact with each other. This is particularly useful for understanding complex relationships in social sciences and economics.

NLS Website: https://nlsinfo.org/
NLS Data Website: https://nlsinfo.org/investigator/pages/home


*** TO DO ***
1. Download the first dataset from the NLSY website

Survey Year: 2020 - 2024
Question Name                Variable Title
Q11-CESD-000004    - CES-D DEPRESSION - DEPRESSED (CESD)
Q11-CESD-000007    - CES-D DEPRESSION - FELT LONELY (CESD)
AGEATINE           - AGE OF R AT INTERVIEW DATE
TNFI_TRUNC         - TOTAL NET FAMILY INCOME IN PAST CALENDAR YEAR *KEY* (TRUNCATED)
SYMBOL_RESP_GENDER - SEX OF R
MARSTAT-KEY        - MARITAL STATUS
FAMSIZE            - FAMILY SIZE
REGION             - REGION OF CURRENT RESIDENCE
SAMPWEIGHT         - SAMPLING WEIGHT

Before downloading the dataset, navigate to the 'Advanced' tab on the download page and select the 'R Source Code' option. This will provide you with a script that can be used to import the data into R.

Downloaded file named as loneliness_depression

Following files added in the folder:
loneliness_depression.csv
loneliness_depression.dat
loneliness_depression.R

Open the file named 'loneliness_depression.R' and remove the # symbol on line 392 to run the code. Ensure that variable names match the question labels for accurate interpretation.
This will load our dataset into a variable named 'new_data'
=====================================================================

2. Download the second dataset from the NLSY website
In ou previos work, we utilized data related to education; however, the dataset downloaded in first step does not include education-related information. Therefore, we need to download this data seperately.

Survey Year: 2020 - 2024
Question Name                Variable Title
HGC_EVER           - HIGHEST GRADE EVER COMPLETED

Downloaded file named as identification_education

Following files added in the folder:
identification_education.csv
identification_education.dat
identification_education.R

Open the file named 'identification_education.R' and remove the # symbol on line 125 to run the code. Ensure that variable names match the question labels for accurate interpretation.
This will load our dataset into a variable named 'new_data'
"
""

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

# Since columns 2 (SAMPLE_ID_1979), 3 (SAMPLE_RACE_785CRN) and 4 (SAMPLE_SEX_1979) in new_data do not contain relevant data for our analysis, we can remove them.
x <- new_data[,
  -(2:4)
]
View(x)

# Organize the data by sample_id and display each variable according to their respective years
x <- pivot_longer(
  x,
  cols = -CASEID_1979,
  names_to = c(
    '.value',
    'wave'
  ),
  names_pattern = '^(.*)_([0-9]{4})$'
) %>%
  mutate(
    wave = as.integer(
      wave
    )
  )

# To obtain education-related data:
# Open the file named 'identification_education.R'
# Remove the comment symbol (#) in front of the line 125
# Run the code contained within it
View(new_data)

# Add the education information from the 'new_data' dataset to the 'x' dataset
x <- merge(
  x = x,
  y = new_data,
  by = 'CASEID_1979',
  all.x = TRUE,
)

# When analyzing loneliness data, identify individuals who reported lonely with a '1' both in 2020 and 2022 datasets, and then group those who consistenly answered '1' in both periods.
#After indentifying the consistent respondents, sort this variables from smallest to largest. Finally, create a new veriable categorizing individuals who reported loneliness in both periods as 'Lone' and those who did not as 'Not Lone'.
# Then, this expression is assigned to the 'lonely_panel' variable.
x$lonely <- ifelse(
  x$'Q11-CESD~000007' %in%
    c(
      1,
      2,
      3
    ),
  1,
  x$'Q11-CESD~000007'
)
x <- x %>%
  group_by(CASEID_1979) %>%
  arrange(CASEID_1979, wave) %>%
  mutate(
    lonely_panel = ifelse(
      lonely == 1 & lag(lonely) == 1,
      1,
      0
    )
  ) %>%
  ungroup()

# Follow a similar process for the depression variable: identify individuals who reported depression on both periods and assign them to a new categorical veriable 'depression_panel'.

x$depression <- ifelse(
  x$'Q11-CESD~000004' %in%
    c(
      1,
      2,
      3
    ),
  1,
  x$'Q11-CESD~000004'
)
x <- x %>%
  group_by(CASEID_1979) %>%
  arrange(CASEID_1979, wave) %>%
  mutate(
    depression_panel = ifelse(
      depression == 1 & lag(depression) == 1,
      1,
      0
    )
  ) %>%
  ungroup()

# Age variable
x$age <- x$AGEATINT

# Family Income variable:
summary(x$TNFI_TRUNC)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
#     0   27568   65000   96564  120000  803437   14587

# Upon initial examination of TNFI_TRUCK values, the values are extremely large. Therefore, to normalize them, we will take its logarithm. However, since the minimum value of the variable is 0, we add 1 to avoid taking the logarithm of zero.
x$family_income <- log(
  x$TNFI_TRUNC + 1,
  base = 10
)

# Female variable
x$female <- ifelse(
  x$SAMPLE_SEX_1979 == 1,
  0,
  x$SAMPLE_SEX_1979
)
x$female <- ifelse(
  x$female == 2,
  1,
  x$female
)

# Married variable
x$married <- ifelse(
  x$`MARSTAT-KEY` %in%
    c(
      0,
      2,
      3,
      6
    ),
  0,
  x$`MARSTAT-KEY`
)


# Education variable
x$education <- x$HGC_EVER_XRND


# Region variable
x$region <- x$REGION
x$region <- ifelse(
  x$region == 1,
  'NORTHEAST',
  x$region
)
x$region <- ifelse(
  x$region == 2,
  'NORTH CENTRAL',
  x$region
)
x$region <- ifelse(
  x$region == 3,
  'SOUTH',
  x$region
)
x$region <- ifelse(
  x$region == 4,
  'WEST',
  x$region
)

# Family Size variable
x$family_size <- x$FAMSIZE

x$weight <- x$SAMPWEIGHT


# REGRESSION
results_lonely <- feglm(
  fml = lonely_panel ~
    depression_panel +
    age +
    family_income +
    female +
    married +
    education +
    family_size |
    wave +
      region,
  data = x,
  family = 'logit',
  panel.id = c(
    'CASEID_1979',
    'wave'
  ),
  weights = x$weight,
  cluster = ~CASEID_1979
)

# Results
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


save.image(file = 'lesson09.RData')
