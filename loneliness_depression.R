# Set working directory
# setwd()

new_data <- read.table('loneliness_depression.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0173600',
  'R0214700',
  'R0214800',
  'T8629603',
  'T8629606',
  'T8787400',
  'T8787800',
  'T8787900',
  'T8788300',
  'T8788500',
  'T8788600',
  'T8812500',
  'T9186203',
  'T9186206',
  'T9299300',
  'T9299600',
  'T9299700',
  'T9300100',
  'T9300300',
  'T9300400',
  'T9324800')

# Handle missing values

new_data[new_data == -1] = NA  # Refused
new_data[new_data == -2] = NA  # Dont know
new_data[new_data == -3] = NA  # Invalid missing
new_data[new_data == -4] = NA  # Valid missing
new_data[new_data == -5] = NA  # Non-interview


# If there are values not categorized they will be represented as NA

vallabels = function(data) {

  data$R0173600 <- factor(data$R0173600,
    levels=c(1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0),
    labels=c("CROSS MALE WHITE",
      "CROSS MALE WH. POOR",
      "CROSS MALE BLACK",
      "CROSS MALE HISPANIC",
      "CROSS FEMALE WHITE",
      "CROSS FEMALE WH POOR",
      "CROSS FEMALE BLACK",
      "CROSS FEMALE HISPANIC",
      "SUP MALE WH POOR",
      "SUP MALE BLACK",
      "SUP MALE HISPANIC",
      "SUP FEM WH POOR",
      "SUP FEMALE BLACK",
      "SUP FEMALE HISPANIC",
      "MIL MALE WHITE",
      "MIL MALE BLACK",
      "MIL MALE HISPANIC",
      "MIL FEMALE WHITE",
      "MIL FEMALE BLACK",
      "MIL FEMALE HISPANIC")
  )

  data$R0214700 <- factor(data$R0214700,
    levels=c(1.0,2.0,3.0),
    labels=c("HISPANIC",
      "BLACK",
      "NON-BLACK, NON-HISPANIC")
  )

  data$R0214800 <- factor(data$R0214800,
    levels=c(1.0,2.0),
    labels=c("MALE",
      "FEMALE")
  )

  data$T8629603 <- factor(data$T8629603,
    levels=c(0.0,1.0,2.0,3.0),
    labels=c("None at all or less than 1 day",
      "1-2 days",
      "3-4 Days",
      "5-7 Days")
  )

  data$T8629606 <- factor(data$T8629606,
    levels=c(0.0,1.0,2.0,3.0),
    labels=c("None at all or less than 1 day",
      "1-2 days",
      "3-4 Days",
      "5-7 Days")
  )

  data$T8788300 <- factor(data$T8788300,
    levels=c(1.0,2.0,3.0,4.0),
    labels=c("1: NORTHEAST",
      "2: NORTH CENTRAL",
      "3: SOUTH",
      "4: WEST")
  )

  data$T8788500 <- factor(data$T8788500,
    levels=c(0.0,1.0,2.0,3.0,6.0),
    labels=c("0: 0  NEVER MARRIED",
      "1: 1  MARRIED",
      "2: 2  SEPARATED",
      "3: 3  DIVORCED",
      "6: 6  WIDOWED")
  )

  data$T8788600 <- factor(data$T8788600,
    levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0,63.0,64.0),
    labels=c("40",
      "41",
      "42",
      "43",
      "44",
      "45",
      "46",
      "47",
      "48",
      "49",
      "50",
      "51",
      "52",
      "53",
      "54",
      "55",
      "56",
      "57",
      "58",
      "59",
      "60",
      "61",
      "62",
      "63",
      "64")
  )

  data$T8812500 <- factor(data$T8812500,
    levels=c(1.0,2.0),
    labels=c("1: MALE",
      "2: FEMALE")
  )

  data$T9186203 <- factor(data$T9186203,
    levels=c(0.0,1.0,2.0,3.0),
    labels=c("None at all or less than 1 day",
      "1-2 days",
      "3-4 Days",
      "5-7 Days")
  )

  data$T9186206 <- factor(data$T9186206,
    levels=c(0.0,1.0,2.0,3.0),
    labels=c("None at all or less than 1 day",
      "1-2 days",
      "3-4 Days",
      "5-7 Days")
  )

  data$T9300100 <- factor(data$T9300100,
    levels=c(1.0,2.0,3.0,4.0),
    labels=c("1: NORTHEAST",
      "2: NORTH CENTRAL",
      "3: SOUTH",
      "4: WEST")
  )

  data$T9300300 <- factor(data$T9300300,
    levels=c(0.0,1.0,2.0,3.0,6.0),
    labels=c("0: 0  NEVER MARRIED",
      "1: 1  MARRIED",
      "2: 2  SEPARATED",
      "3: 3  DIVORCED",
      "6: 6  WIDOWED")
  )

  data$T9300400 <- factor(data$T9300400,
    levels=c(40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0,51.0,52.0,53.0,54.0,55.0,56.0,57.0,58.0,59.0,60.0,61.0,62.0,63.0,64.0,65.0,66.0),
    labels=c("40",
      "41",
      "42",
      "43",
      "44",
      "45",
      "46",
      "47",
      "48",
      "49",
      "50",
      "51",
      "52",
      "53",
      "54",
      "55",
      "56",
      "57",
      "58",
      "59",
      "60",
      "61",
      "62",
      "63",
      "64",
      "65",
      "66")
  )

  data$T9324800 <- factor(data$T9324800,
    levels=c(1.0,2.0),
    labels=c("1: MALE",
      "2: FEMALE")
  )


return(data)
}

# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {
  data$T9299700[1.0 <= data$T9299700 & data$T9299700 <= 999.0] <- 1.0
  data$T9299700[1000.0 <= data$T9299700 & data$T9299700 <= 1999.0] <- 1000.0
  data$T9299700[2000.0 <= data$T9299700 & data$T9299700 <= 2999.0] <- 2000.0
  data$T9299700[3000.0 <= data$T9299700 & data$T9299700 <= 3999.0] <- 3000.0
  data$T9299700[4000.0 <= data$T9299700 & data$T9299700 <= 4999.0] <- 4000.0
  data$T9299700[5000.0 <= data$T9299700 & data$T9299700 <= 5999.0] <- 5000.0
  data$T9299700[6000.0 <= data$T9299700 & data$T9299700 <= 6999.0] <- 6000.0
  data$T9299700[7000.0 <= data$T9299700 & data$T9299700 <= 7999.0] <- 7000.0
  data$T9299700[8000.0 <= data$T9299700 & data$T9299700 <= 8999.0] <- 8000.0
  data$T9299700[9000.0 <= data$T9299700 & data$T9299700 <= 9999.0] <- 9000.0
  data$T9299700[10000.0 <= data$T9299700 & data$T9299700 <= 14999.0] <- 10000.0
  data$T9299700[15000.0 <= data$T9299700 & data$T9299700 <= 19999.0] <- 15000.0
  data$T9299700[20000.0 <= data$T9299700 & data$T9299700 <= 24999.0] <- 20000.0
  data$T9299700[25000.0 <= data$T9299700 & data$T9299700 <= 49999.0] <- 25000.0
  data$T9299700[50000.0 <= data$T9299700 & data$T9299700 <= 9.9999999E7] <- 50000.0

  data$T9299700 <- factor(data$T9299700,
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+")
  )

  data$T8787900[1.0 <= data$T8787900 & data$T8787900 <= 999.0] <- 1.0
  data$T8787900[1000.0 <= data$T8787900 & data$T8787900 <= 1999.0] <- 1000.0
  data$T8787900[2000.0 <= data$T8787900 & data$T8787900 <= 2999.0] <- 2000.0
  data$T8787900[3000.0 <= data$T8787900 & data$T8787900 <= 3999.0] <- 3000.0
  data$T8787900[4000.0 <= data$T8787900 & data$T8787900 <= 4999.0] <- 4000.0
  data$T8787900[5000.0 <= data$T8787900 & data$T8787900 <= 5999.0] <- 5000.0
  data$T8787900[6000.0 <= data$T8787900 & data$T8787900 <= 6999.0] <- 6000.0
  data$T8787900[7000.0 <= data$T8787900 & data$T8787900 <= 7999.0] <- 7000.0
  data$T8787900[8000.0 <= data$T8787900 & data$T8787900 <= 8999.0] <- 8000.0
  data$T8787900[9000.0 <= data$T8787900 & data$T8787900 <= 9999.0] <- 9000.0
  data$T8787900[10000.0 <= data$T8787900 & data$T8787900 <= 14999.0] <- 10000.0
  data$T8787900[15000.0 <= data$T8787900 & data$T8787900 <= 19999.0] <- 15000.0
  data$T8787900[20000.0 <= data$T8787900 & data$T8787900 <= 24999.0] <- 20000.0
  data$T8787900[25000.0 <= data$T8787900 & data$T8787900 <= 49999.0] <- 25000.0
  data$T8787900[50000.0 <= data$T8787900 & data$T8787900 <= 9.9999999E7] <- 50000.0

  data$T8787900 <- factor(data$T8787900,
    levels=c(0.0,1.0,1000.0,2000.0,3000.0,4000.0,5000.0,6000.0,7000.0,8000.0,9000.0,10000.0,15000.0,20000.0,25000.0,50000.0),
    labels=c("0",
      "1 TO 999",
      "1000 TO 1999",
      "2000 TO 2999",
      "3000 TO 3999",
      "4000 TO 4999",
      "5000 TO 5999",
      "6000 TO 6999",
      "7000 TO 7999",
      "8000 TO 8999",
      "9000 TO 9999",
      "10000 TO 14999",
      "15000 TO 19999",
      "20000 TO 24999",
      "25000 TO 49999",
      "50000 TO 99999999: 50000+")
  )

  data$T8787800[10.0 <= data$T8787800 & data$T8787800 <= 999.0] <- 10.0

  data$T8787800 <- factor(data$T8787800,
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
    labels=c("0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10 TO 999: 10+")
  )

  data$T9299600[10.0 <= data$T9299600 & data$T9299600 <= 999.0] <- 10.0

  data$T9299600 <- factor(data$T9299600,
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0),
    labels=c("0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10 TO 999: 10+")
  )


return(data)
}


varlabels <- c("ID# (1-12686) 79",
  "SAMPLE ID  79 INT",
  "RACL/ETHNIC COHORT /SCRNR 79",
  "SEX OF R 79",
  "CESD - DEPRESSION 2020",
  "CESD -  FEELING LONELY 2020",
  "SAMPLING WEIGHT 2020",
  "FAMILY SIZE 2020",
  "TOTAL NET FAMILY INCOME 2020",
  "REGION OF RESIDENCE 2020",
  "MARITAL STATUS 2020",
  "AGE AT INTERVIEW 2020",
  "SEX OF R 2020",
  "CESD - DEPRESSION 2022",
  "CESD -  FEELING LONELY 2022",
  "SAMPLING WEIGHT 2022",
  "FAMILY SIZE 2022",
  "TOTAL NET FAMILY INCOME 2022",
  "REGION OF RESIDENCE 2022",
  "MARITAL STATUS 2022",
  "AGE AT INTERVIEW 2022",
  "SEX OF R 2022"
)

# Use qnames rather than rnums
qnames = function(data) {
  names(data) <- c("CASEID_1979",
  "SAMPLE_ID_1979",
  "SAMPLE_RACE_78SCRN",
  "SAMPLE_SEX_1979",
  "Q11-CESD~000004_2020",
  "Q11-CESD~000007_2020",
  "SAMPWEIGHT_2020",
  "FAMSIZE_2020",
  "TNFI_TRUNC_2020",
  "REGION_2020",
  "MARSTAT-KEY_2020",
  "AGEATINT_2020",
  "SYMBOL_RESP_GENDER_2020",
  "Q11-CESD~000004_2022",
  "Q11-CESD~000007_2022",
  "SAMPWEIGHT_2022",
  "FAMSIZE_2022",
  "TNFI_TRUNC_2022",
  "REGION_2022",
  "MARSTAT-KEY_2022",
  "AGEATINT_2022",
  "SYMBOL_RESP_GENDER_2022")

return(data)
}

#********************************************************************************************************

# Remove the '#' before the following line to create a data file called "categories" with value labels.
#categories <- vallabels(new_data)

# Remove the '#' before the following lines to rename variables using Qnames instead of Reference Numbers
new_data <- qnames(new_data)
#categories <- qnames(categories)

# Produce summaries for the raw (uncategorized) data file
summary(new_data)

# Remove the '#' before the following lines to produce summaries for the "categories" data file.
#categories <- vallabels(new_data)
#categories <- vallabels_continuous(new_data)
#summary(categories)

#************************************************************************************************************
