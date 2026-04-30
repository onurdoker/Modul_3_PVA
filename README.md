# Modul_3_PVA - Panel Data Analysis and Loneliness/Depression Relationship

## Project Overview

This project analyzes the relationship between loneliness and depression using panel data models with various data sources. The project conducts long-term panel analyses using national survey data from Turkey (TGSS) and the USA (NLSY, HRS, PSID).

---

## Data Sources

### 1. Turkish General Social Survey (TGSS) 2024
- **Website**: https://www.tgss.org.tr/
- **Data Format**: SAV (SAS)
- **Scope**: Turkey's social, cultural, economic, and political structures
- **Lesson**: `lesson06.R`

### 2. National Longitudinal Survey of Youth (NLSY) 2020-2024
- **Website**: https://nlsinfo.org/
- **Data Format**: R Source Code
- **Scope**: Young adult life dynamics from 2020-2024
- **Variables**: Depression (CESD), Loneliness, age, income, education, employment status
- **Lesson**: `lesson09.R`, `loneliness_depression.R`

### 3. Health and Retirement Study (HRS) 1992-2020
- **Website**: https://hrsdata.isr.umich.edu/
- **Data Format**: SAS
- **Scope**: Panel expanding from 5,000 to 20,000 families between 1992-2020
- **Inflation Data**: https://fred.stlouisfed.org/series/CPALWE01USA661N
- **Lesson**: `lesson08.R`, `lesson10.R`

### 4. Panel Study of Income Dynamics (PSID) 2021-2023
- **Website**: https://psidonline.isr.umich.edu/
- **Data Format**: R Source Code (psidread package)
- **Scope**: Transition into Adulthood Supplement
- **Lesson**: `lesson11.R`, `J361365.R`

---

## Required Packages

```r
# Core packages
tidyverse
haven
labelled

# Regression and modeling
broom
fixest
survey

# Results reporting
gtsummary
flextable
officer
writexl
modelsummary

# Specialized packages
psidread  # For PSID data
```

---

## Analysis Lessons

### Lesson 1: Basic R and dplyr
- `lesson01.R`
- Data manipulation fundamentals
- filter(), arrange(), select(), mutate(), summarise() functions
- Lin-Lin, Lin-Log, Log-Log models

### Lesson 2: Dummy Variables
- `lesson03.R`
- Regression analysis fundamentals
- Wooldridge package data (ceosal1, wage1, gpa1)
- Quadratic terms and interaction terms

### Lesson 3: TGSS Data Analysis
- `lesson06.R`
- Defining depression and loneliness variables
- Effect analysis and odds ratio calculation
- Results reporting with gtsummary

### Lesson 4: NLSY Panel Data
- `lesson09.R`
- Preparing and organizing panel data
- CPI inflation adjustment
- Panel regression with feglm

### Lesson 5: HRS Panel Data
- `lesson10.R`
- Processing long format data
- Combining household and personal variables
- Panel models with fixest package

### Lesson 6: PSID Panel Data
- `lesson11.R`
- Reading and reshaping PSID data
- Panel coding for loneliness and depression
- Inter-generational relationship analysis

### Lesson 7: Reverse Causality
- `lesson07.R`
- Loneliness as independent variable, depression as dependent
- Weighted regression with survey design
- Analysis by ESS round

### Lesson 8: Identification and Education
- `identification_education.R`
- Merging NLSY education data
- Missing value management
- Categorical variable labeling

### Lesson 9: Loneliness/Depression Relationship
- `loneliness_depression.R`
- CESD scale for depression/loneliness variables
- Region, marital status, and income variables
- Model results reporting

---

## Analysis Methods

### Regression Models

#### GLM Logit Model
```r
glm(
  lonely ~ depression + age + education + female + 
         married + hh_size + hh_income + urban_rural,
  data = x,
  family = 'binomial'(link = 'logit')
)
```

#### Fixest Panel Model
```r
feglm(
  lonely_panel ~ depression_panel + age + income + 
                 female + married | wave + region,
  data = x,
  family = 'logit',
  panel.id = c('CASEID_1979', 'wave'),
  cluster = ~CASEID_1979
)
```

### Panel Data Coding
```r
# Panel coding for loneliness
mutate(
  lonely_panel = ifelse(
    lonely == 1 & lag(lonely) == 1,
    1,
    0
  )
)
```

### Inflation Adjustment
```r
l_personal_income <- log((1 + personal_income) / cpi, base = 10)
```

---

## Data Preparation

### Missing Value Management
```r
# -1: Refused
# -2: Dont know
# -3: Invalid missing
# -4: Valid missing
# -5: Non-interview

data[condition == -1] <- NA
data[condition == -2] <- NA
# etc.
```

### Categorical Variable Definition
```r
data$variable <- factor(data$variable,
  levels = c(1,2,3),
  labels = c("Category1", "Category2", "Category3")
)
data$variable <- relevel(data$variable, ref = "Category1")
```

---

## Results Reporting

### Excel Output
```r
write_xlsx(
  result_tidy,
  'results.xlsx'
)
```

### Word Output
```r
print(
  tbl_result3,
  target = "regression_results.docx"
)
```

### Advanced Tables with Flextable
```r
tbl_results <- as_flex_table(tbl_regression(results))
print(tbl_results, target = "table.docx")
```

---

## Files Created in the Project

### R Script Files
- `lesson01.R` - Basic R
- `lesson03.R` - Dummy variables
- `lesson06.R` - TGSS analysis
- `lesson07.R` - Reverse causality
- `lesson08.R` - Panel data processing
- `lesson09.R` - PSID panel
- `lesson10.R` - HRS panel
- `lesson11.R` - PSID final analysis

### Data Files
- `hlong_table.sas7bdat` - HRS long format
- `rlong_table.sas7bdat` - HRS long format (processed)
- `rwide_table.sas7bdat` - HRS wide format
- `cpi.xlsx` - Inflation data
- `J361365.zip` - PSID data
- `loneliness_depression.*` - NLSY data and code
- `identification_education.*` - Education data

### RData Files
- `lesson01.RData`
- `lesson03.RData`
- `lesson06.RData`
- `lesson07.RData`
- `lesson08.RData`
- `lesson09.RData`
- `lesson10.RData`
- `lesson11.RData`

---

## Installation

```r
# Install required packages
install.packages(c(
  "tidyverse",
  "haven",
  "labelled",
  "broom",
  "gtsummary",
  "flextable",
  "officer",
  "writexl",
  "modelsummary",
  "fixest",
  "survey",
  "psidread",
  "readxl"
))

# Load packages
library(tidyverse)
library(haven)
library(labelled)
library(broom)
library(gtsummary)
library(flextable)
library(officer)
library(writexl)
library(modelsummary)
library(fixest)
library(survey)
library(psidread)
library(readxl)
```

---

## Results Summary

### TGSS Analysis (Lesson 06)
- Relationship between depression and loneliness examined
- Odds ratios calculated
- Effect analysis conducted

### NLSY Analysis (Lesson 09)
- Loneliness/depression relationship with panel data
- Income variables with inflation adjustment
- Regional effects controlled

### HRS Analysis (Lesson 10)
- 1992-2020 panel
- Inter-generational relationship
- Panel data processing

### PSID Analysis (Lesson 11)
- 2021-2023 data
- Loneliness score analysis
- Inter-generational dynamics

---

## Notes

- All analyses conducted in RStudio
- Fixest package used for panel data analysis
- Weighted regressions using survey design
- Inflation adjustment applied to all income variables
- Panel data coding (lonely_panel, depression_panel) used
- Results reported in Excel and Word formats

---

## Contact

For questions, please contact via email.

**Veri Analiz Okulu - Modul 3**

*Last updated: 2025*
