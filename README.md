# Panel Data Analysis: Loneliness and Depression Relationship

## Project Overview

This project investigates the relationship between loneliness and depression using advanced panel data analysis techniques. The study leverages multiple national survey datasets from Turkey and the United States to provide comprehensive longitudinal insights into mental health dynamics.

---

## 📚 Project Structure

```
Veri Analiz Okulu/Modul_3_PVA/
├── lesson01.R          # Basic R and dplyr fundamentals
├── lesson02.R          # Regression models and dummy variables
├── lesson03.R          # Quadratic models and categorical variables
├── lesson04.R          # ESS data preparation and survey design
├── lesson05.R          # gtsummary tables
├── lesson06.R          # TGSS analysis (Turkish data)
├── lesson07.R          # Reverse causality analysis
├── lesson08.R          # NLSY panel data analysis
├── lesson09.R          # HRS panel data with inflation adjustment
├── lesson10.R          # NLSY depression/loneliness analysis
├── lesson11.R          # PSID panel study
├── *.RData             # Saved environments
├── *.docx              # Word output reports
├── *.xlsx              # Excel output files
└── *.sas7bdat          # SAS datasets
```

---

## 🌐 Data Sources

### 1. Turkish General Social Survey (TGSS) 2024
- **Website**: https://www.tgss.org.tr/
- **Format**: `.sav` (SAS)
- **Scope**: Turkey's social, cultural, economic, and political structures
- **Analysis**: Depression and loneliness relationship in Turkish context
- **Lesson**: `lesson06.R`, `lesson08.R`

### 2. European Social Survey (ESS)
- **Website**: https://ess.sikt.no/en/
- **Format**: `.csv`
- **Periods**: ESS7, ESS11 (2000s-2010s)
- **Scope**: Pan-European social survey data
- **Analysis**: Reverse causality and period effects
- **Lesson**: `lesson04.R`, `lesson05.R`, `lesson07.R`

### 3. Health and Retirement Study (HRS) 1992-2020
- **Website**: https://hrsdata.isr.umich.edu/
- **Format**: SAS, R source code
- **Scope**: 5,000 → 20,000 families over 30 years
- **Variables**: Loneliness, depression, income, age
- **Inflation Data**: https://fred.stlouisfed.org/series/CPALWE01USA661N
- **Lesson**: `lesson09.R`, `lesson10.R`

### 4. National Longitudinal Survey of Youth (NLSY) 2020-2024
- **Website**: https://nlsinfo.org/
- **Format**: R source code
- **Scope**: Young adult life dynamics (ages 18-34)
- **Variables**: CESD depression scale, loneliness, education, income
- **Lesson**: `lesson08.R`, `lesson10.R`

### 5. Panel Study of Income Dynamics (PSID) 2021-2023
- **Website**: https://psidonline.isr.umich.edu/
- **Format**: PSID R code (`.dat`)
- **Scope**: Transition into Adulthood Supplement
- **Variables**: PHQ-9 depression, loneliness scale, income
- **Lesson**: `lesson11.R`

---

## 📦 Required Packages

### Core Packages
```r
tidyverse      # dplyr, ggplot2, tidyr, tibble, purrr, stringr
haven          # .sav, .sas, .dta file reading
labelled       # Labelled data handling
```

### Regression & Modeling
```r
broom          # Tibble-friendly regression results
survey         # Survey design and weighted analysis
fixest         # Fast panel data regression
glmmTMB        # Generalized linear mixed models
```

### Results Reporting
```r
gtsummary      # Regression summary tables
modelsummary   # Model comparison tables
flextable      # Word/Excel table integration
officer        # Word document creation
writexl        # Excel file export
```

### Specialized Packages
```r
psidread       # PSID data reading and reshaping
```

### Installation
```r
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

## 📖 Lesson Descriptions

### Lesson 1: Basic R and dplyr (`lesson01.R`)
**Topic**: Data manipulation fundamentals
- Pipe operator (`%>%`) usage
- `filter()`, `arrange()`, `select()`, `mutate()`, `summarise()` functions
- Grouping and summarization with `group_by()`
- Linear models: lin-lin, lin-log, log-lin, log-log
- Regression interpretation (P-value, R², coefficients)
- Scatter plots and regression lines

### Lesson 2: Regression Models (`lesson02.R`)
**Topic**: Advanced regression analysis
- Multiple regression models
- Wooldridge package datasets (ceosal1, wage1, gpa1, hprice1)
- Model comparison techniques
- R² interpretation

### Lesson 3: Dummy Variables (`lesson03.R`)
**Topic**: Categorical variables and quadratic terms
- Quadratic models using `I()` function
- Dummy variable creation and interpretation
- Interaction terms
- Complex regression models with multiple categorical variables
- Model comparison with and without categorical variables

### Lesson 4: ESS Data Preparation (`lesson04.R`)
**Topic**: Survey data processing and cleaning
- Multi-file data merging (`merge()`)
- Variable recoding and transformation
- Household income categorization
- Depression and loneliness variable creation
- Factor levels and reference categories (`relevel()`)
- Survey design with `svydesign()`
- Weighted analysis preparation

### Lesson 5: gtsummary Tables (`lesson05.R`)
**Topic**: Statistical summary tables
- `tbl_svysummary()` for variable summaries
- Statistics customization (mean/SD vs median/IQR)
- Table formatting with `digits` parameter
- Variable labeling with `label` parameter
- Adding overall columns (`add_overall()`)
- Header modification (`modify_header()`)
- Word document export with `flextable`

### Lesson 6: TGSS Regression Analysis (`lesson06.R`)
**Topic**: Primary analysis with Turkish survey data
- `svyglm()` with quasibinomial family
- `tbl_regression()` for regression tables
- Odds ratio calculation (`exponentiate = TRUE`)
- P-value and estimate formatting (3 decimal places)
- Reference row removal (`remove_row_type()`)
- Variable name customization
- Word report generation

### Lesson 7: Reverse Causality (`lesson07.R`)
**Topic**: Dependent variable reversal
- Loneliness as independent variable
- Depression as dependent variable
- ESS round stratification (`by = essround_factor`)
- Missing value handling (`missing = 'no'`)
- Panel effect analysis
- Word document output

### Lesson 8: NLSY Panel Data (`lesson08.R`)
**Topic**: Longitudinal analysis
- Panel data explanation and preparation
- Data download and preprocessing
- Dependent variable definitions
- GLM logit model implementation
- Summary statistics tables
- Word report creation

### Lesson 9: HRS Panel Analysis (`lesson09.R`)
**Topic**: Long-term panel with inflation adjustment
- Multi-file data merging (SAS files)
- CPI-based inflation adjustment
- Panel data organization
- Income and household variable creation
- Loneliness and depression panel coding
- Weighted regression with `feglm()`
- Panel ID specification
- Results with `modelsummary()`
- Word export

### Lesson 10: NLSY Depression/Loneliness (`lesson10.R`)
**Topic**: Comprehensive NLSY analysis
- Panel data introduction
- Wave-based analysis (2020-2024)
- CESD scale implementation
- Education and income variables
- Family income and inflation normalization
- Region and marital status controls
- Panel regression with `feglm()`
- Model comparison tables
- Word output

### Lesson 11: PSID Panel Study (`lesson11.R`)
**Topic**: Inter-generational income dynamics
- PSID data reading with `psidread`
- String file creation (`psid_str()`)
- Data reshaping (`psid_reshape()`)
- Gender, marital status, education, income variables
- Depression and loneliness panel coding
- Income log transformation
- Year fixed effects
- Panel regression with `feglm()`
- Results with `modelsummary()`
- Word report


---

## 🔬 Analysis Methods

### Regression Models

#### GLM Logit Model (Standard)
```r
glm(
  lonely ~ depression + age + education + female +
         married + hh_size + hh_income + urban_rural,
  data = x,
  family = binomial(link = 'logit')
)
```

#### Survey Weighted Regression
```r
svyglm(
  lonely ~ depression + age + education + female +
         married + hh_size + hh_income,
  design = x_survey,
  family = quasibinomial
)
```

#### Fixest Panel Model (Fixed Effects)
```r
feglm(
  lonely_panel ~ depression_panel + age + income +
                 female + married | wave + region,
  data = x,
  family = 'logit',
  panel.id = c('CASEID_1979', 'wave'),
  weights = x$weight,
  cluster = ~CASEID_1979
)
```

### Panel Data Coding
```r
# Create panel variable for loneliness
x$lonely <- ifelse(
  x$CESD_lonely %in% c(1, 2, 3),
  1,
  0
)

x <- x %>%
  group_by(CASEID_1979) %>%
  arrange(CASEID_1979, wave) %>%
  mutate(
    lonely_panel = ifelse(
      lonely == 1 & lag(lonely) == 1,
      1,  # Continuous loneliness
      0   # Interrupted or no loneliness
    )
  ) %>%
  ungroup()

# Similar process for depression_panel
```

### Inflation Adjustment
```r
# Personal income adjustment
x$l_r_personal_income <- log(
  (1 + x$R_IEARN) / x$cpi,
  base = 10
)

# Household income adjustment
x$l_r_household_income <- log(
  (1 + x$H_ITOT) / x$cpi,
  base = 10
)
```

### Categorical Variable Definition
```r
# Household income categories
x$hh_income <- ifelse(
  x$incomehh %in% c(1:8),
  'Low household income',
  x$incomehh
)
x$hh_income <- ifelse(
  x$hh_income %in% c(9:15),
  'Middle household income',
  x$hh_income
)
x$hh_income <- ifelse(
  x$hh_income %in% c(16:24),
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
x$hh_income <- relevel(x$hh_income, ref = 'Low household income')
```

### Missing Value Management
```r
# Handling specific missing value codes
data[condition == -1] <- NA    # Refused
data[condition == -2] <- NA    # Don't know
data[condition == -3] <- NA    # Invalid missing
data[condition == -4] <- NA    # Valid missing
data[condition == -5] <- NA    # Non-interview

# Alternative: exclude missing values
data_clean <- data %>%
  drop_na()
```

---

## 📊 Results Reporting

### Excel Output
```r
write_xlsx(
  result_tidy,
  'results.xlsx'
)
```

### Word Output with Flextable
```r
# Convert gtsummary table to flextable
tbl_results <- as_flex_table(tbl_regression(results))

# Create Word document
doc <- read_docx()
doc <- body_add_flextable(doc, tbl_results)
print(doc, target = "regression_results.docx")
```

### Advanced Word Formatting
```r
# Header modification
modify_header(
  tbl_results,
  label = '**Variable**'
)

# Remove footnotes
modify_footnote(
  tbl_results,
  all_stat_cols() ~ NA
)

# Add overall column
add_overall(
  tbl_results
)
```

---

## 📁 Files Created in the Project

### R Script Files
- `lesson01.R` - Basic R and dplyr fundamentals
- `lesson02.R` - Regression models and dummy variables
- `lesson03.R` - Quadratic models and categorical variables
- `lesson04.R` - ESS data preparation
- `lesson05.R` - gtsummary tables
- `lesson06.R` - TGSS analysis (Turkish data)
- `lesson07.R` - Reverse causality analysis
- `lesson08.R` - NLSY panel data analysis
- `lesson09.R` - HRS panel data with inflation adjustment
- `lesson10.R` - NLSY depression/loneliness analysis
- `lesson11.R` - PSID panel study


### Data Files
- `hlong_table.sas7bdat` - HRS long format household data
- `rlong_table.sas7bdat` - HRS long format processed data
- `rwide_table.sas7bdat` - HRS wide format
- `cpi.xlsx` - Consumer Price Index data
- `J361365.zip` - PSID data archive
- `loneliness_depression.csv` - NLSY depression/loneliness
- `loneliness_depression.dat` - NLSY data file
- `loneliness_depression.R` - NLSY processing code
- `identification_education.csv` - NLSY education data
- `identification_education.dat` - Education data file
- `identification_education.R` - Education processing code
- `TGSS2024.sav` - Turkish General Social Survey
- `randhrs1992_2022.pdf` - HRS codebook
- `RAND_HRS long format 2020v2.pdf` - HRS documentation

### RData Files (Saved Environments)
- `lesson01.RData` - Basic analysis environment
- `lesson02.RData` - Regression models environment
- `lesson03.RData` - Dummy variable models environment
- `lesson04.RData` - ESS survey design environment
- `lesson05.RData` - gtsummary tables environment
- `lesson06.RData` - TGSS analysis environment
- `lesson07.RData` - Reverse causality environment
- `lesson08.RData` - NLSY panel environment
- `lesson09.RData` - HRS panel environment
- `lesson10.RData` - NLSY complete analysis environment
- `lesson11.RData` - PSID analysis environment

### Word Output Documents
- `summary_stat_table.docx` - ESS summary statistics
- `regression_results.docx` - TGSS regression results
- `regression_results2.docx` - HRS regression results
- `summary_stat_table_lonely.docx` - Loneliness analysis
- `regression_results_lonely.docx` - Loneliness regression
- `regression_results_lonely_HRS.docx` - HRS results
- `regression_results_lonely2.docx` - NLSY results

### Excel Output Files
- `results1.xlsx` - TGSS regression results
- `results_lonely.xlsx` - Loneliness analysis results

---

## 🎯 Key Research Findings

### TGSS Analysis (Turkey)
- **Sample**: 19,000+ respondents from TGSS 2024
- **Main Finding**: Depression has significant effect on loneliness
- **Odds Ratio**: Depression increases loneliness risk by X% (calculated from coefficients)
- **Key Controls**: Age, education, gender, marital status, income

### HRS Analysis (USA 1992-2020)
- **Sample**: 5,000 → 20,000 families over 30 years
- **Main Finding**: Panel data shows persistent loneliness-depression relationship
- **Inflation Adjustment**: Real income effects controlled
- **Age Effects**: Age-categorized analysis

### NLSY Analysis (USA 2020-2024)
- **Sample**: 18-34 year olds
- **Main Finding**: Cross-temporal loneliness persistence
- **Wave Effects**: 2020-2024 comparison

### PSID Analysis (USA 2021-2023)
- **Sample**: 20,000+ families
- **Main Finding**: Inter-generational income dynamics
- **Method**: Panel fixed effects

---

## 🔧 Technical Implementation

### Data Preparation Workflow
1. **Raw data loading** (SAS, CSV, R source code)
2. **Variable definition** (categorical, continuous, panel)
3. **Data cleaning** (missing values, outliers)
4. **Variable transformation** (log, inflation adjustment, panel coding)
5. **Survey design** (weights, strata, clusters)
6. **Model specification** (fixed effects, random effects)
7. **Results extraction** (tidy, coefficients, p-values)
8. **Results formatting** (tables, word, excel)

### Panel Data Coding Strategy
```r
# Step 1: Create binary variables
x$lonely <- ifelse(x$loneliness_score >= 5, 1, 0)
x$depression <- ifelse(x$depression_score >= 10, 1, 0)

# Step 2: Order by panel ID and wave
x <- x %>%
  group_by(panel_id) %>%
  arrange(panel_id, wave) %>%
  mutate(
    lonely_panel = ifelse(lonely == 1 & lag(lonely) == 1, 1, 0),
    depression_panel = ifelse(depression == 1 & lag(depression) == 1, 1, 0)
  ) %>%
  ungroup()

# Step 3: Run fixed effects model
results <- feglm(
  lonely_panel ~ depression_panel + controls,
  data = x,
  panel.id = c('panel_id', 'wave'),
  weights = x$weight
)
```

---

## 📝 Notes

- All analyses conducted in Positron
- Fixest package used for panel data analysis
- Weighted regressions using survey design
- Inflation adjustment applied to all income variables
- Panel data coding creates continuous variables
- Results reported in both Excel and Word formats
- Missing values handled according to survey documentation
- All word outputs compatible with Microsoft Word

---

## 📚 References

- **WGSS** (Turkish General Social Survey): https://www.tgss.org.tr/
- **HRS** (Health and Retirement Study): https://hrsdata.isr.umich.edu/
- **NLSY** (National Longitudinal Survey of Youth): https://nlsinfo.org/
- **PSID** (Panel Study of Income Dynamics): https://psidonline.isr.umich.edu/
- **ESS** (European Social Survey): https://ess.sikt.no/en/
- **Wooldridge** (Introductory Econometrics): Jeff Wooldridge
- **Fixed Effects**: Angrist & Pischke, "Mostly Harmless Econometrics"

---

## 📝 License

This project is for educational purposes as part of the "Veri Analiz Okulu" (Data Analysis School).

---

**Veri Analiz Okulu - Modul 3**
*Last updated: 2025*
