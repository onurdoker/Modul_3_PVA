# Set working directory
# setwd()

new_data <- read.table('identification_education.dat', sep=' ')
names(new_data) <- c('R0000100',
  'R0173600',
  'R0214700',
  'R0214800',
  'T9900000')

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

  data$T9900000 <- factor(data$T9900000,
    levels=c(0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,93.0,94.0,95.0),
    labels=c("NONE",
      "1ST GRADE",
      "2ND GRADE",
      "3RD GRADE",
      "4TH GRADE",
      "5TH GRADE",
      "6TH GRADE",
      "7TH GRADE",
      "8TH GRADE",
      "9TH GRADE",
      "10TH GRADE",
      "11TH GRADE",
      "12TH GRADE",
      "1ST YEAR COLLEGE",
      "2ND YEAR COLLEGE",
      "3RD YEAR COLLEGE",
      "4TH YEAR COLLEGE",
      "5TH YEAR COLLEGE",
      "6TH YEAR COLLEGE",
      "7TH YEAR COLLEGE",
      "8TH YEAR COLLEGE OR MORE",
      "PRE-KINDERGARTEN",
      "KINDERGARTEN",
      "UNGRADED")
  )


return(data)
}

# If there are values not categorized they will be represented as NA

vallabels_continuous = function(data) {

return(data)
}


varlabels <- c("ID# (1-12686) 79",
  "SAMPLE ID  79 INT",
  "RACL/ETHNIC COHORT /SCRNR 79",
  "SEX OF R 79",
  "HIGHEST GRADE EVER COMPLETED XRND"
)

# Use qnames rather than rnums
qnames = function(data) {
  names(data) <- c("CASEID_1979",
  "SAMPLE_ID_1979",
  "SAMPLE_RACE_78SCRN",
  "SAMPLE_SEX_1979",
  "HGC_EVER_XRND")

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
