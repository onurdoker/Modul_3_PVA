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

# to be continued...
