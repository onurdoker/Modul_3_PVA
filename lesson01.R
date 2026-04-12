# Installing and loading Tidyverse package for data manipulation and visualization
install.packages('tidyverse')
library(tidyverse)

# Installing and loading nycflight13 package for database operatons
install.packages('nycflights13')
library(nycflights13)

# Loading the flights dataset from nycflights13 package
View(flights)

''
'
DATA TRANSFORMATION

For data transformation, we use five main functions available in the dplyr package:
  - filter () : Selecting observations based on values
  - arrange () : Reordering rows
  - select () : Selecting variables by name
  - mutte () : Deriving new variables from existing variables
  - summarize () : Converting multiple values into a summary value
'
''
# Filtering data

# Filtering flights that occurred on January 1st
filter(
  flights,
  month == 1,
  day == 1
) # 842 flights

# Filtering flights that occurred on December 25th
filter(
  flights,
  month == 12,
  day == 25
) # 719 flights

# Filtering all flights that occurred in November and December
filter(
  flights,
  month == 11 | month == 12
) # 55403 flights

filter(
  flights,
  month %in% c(11, 12)
) # 55403 flights

# Filtering all flights with a delay of under two hours
filter(
  flights,
  !(dep_delay > 120) | !(arr_delay) > 120
) # 320060 flights

filter(
  flights,
  dep_delay <= 120 | arr_delay <= 120
) # 320060 flights

# Filtering all flights with an arrival delay exceeding two hours
filter(
  flights,
  arr_delay >= 120
) # 10200 flights

# Filtering all flights to Houston (AIH or HOU)
filter(
  flights,
  dest == 'IAH' | dest == 'HOU'
) # 9313 flights

filter(
  flights,
  dest %in% c('IAH', 'HOU')
) # 9313 flights

# Filtering all flights operated by United, Delta and American Airlines
airlines[grepl('United|American|Delta', airlines$name), ]

filter(
  airlines,
  grepl('United|American|Delta', name)
)

filter(
  flights,
  carrier %in% c('AA', 'DL', 'AU')
) # 80839 flights

# Filtering all flights deparing in July, August and September
filter(
  flights,
  month >= 7,
  month <= 9
) # 86326 flights

filter(
  flights,
  month %in% c(7:9)
) # 86326 flights

filter(
  flights,
  month %in% c(7, 8, 9)
) # 86326 flights

# Filtering all flights de departure delay and an arrival delay greater than two hours
filter(
  flights,
  dep_delay == 0 & arr_delay > 120
) # 3 flights

# How many flights have an NA value for departure delay
filter(
  flights,
  is.na(dep_delay)
) # 8245 flights

# Sort the flight information
arrange(
  flights,
  year,
  month,
  day
)

# Sorting the flights by departure delay
arrange(
  flights,
  desc(dep_delay)
)

# Sorting the flights from fastest to the slowest
arrange(
  flights,
  desc(
    distance / air_time
  )
)

# Create a new dataset that contains only the data we want, from the original dataset
select(
  flights,
  year,
  month,
  day
)

select(
  flights,
  year:day
)

# Appending new data to the end of the dataset
#
flights_sml <- select(
  flights,
  year:day,
  dep_delay,
  arr_delay,
  distance,
  air_time
)
mutate(
  flights_sml,
  gain = dep_delay - arr_delay,
  speed = distance / air_time * 60
)

# Summarising the flights by arrival delay
summarise(
  flights,
  delay = mean(
    dep_delay,
    na.rm = TRUE
  )
) # 12.6

# Summarizing the flights for each day, based on arrival delay
by_day <- group_by(
  flights,
  year,
  month,
  day
)
summarise(
  by_day,
  delay = mean(
    dep_delay,
    na.rm = TRUE
  )
) # summarise with 365 lines

# Summarizing the flights for each month, based on arrival delay
by_month <- group_by(
  flights,
  year,
  month
)
summarise(
  by_month,
  delay = mean(
    dep_delay,
    na.rm = TRUE
  )
)

# Concatenating multiple opations using the pipe operator %>%
# The relationship between distance and average arrival delay on a destination
by_dest <- group_by(
  flights,
  dest
)
delay_dest <- summarise(
  by_dest,
  count = n(),
  dist = mean(
    distance,
    na.rm = TRUE
  ),
  delay = mean(
    arr_delay,
    na.rm = TRUE
  )
)
View(delay_dest)

# %>% operator is used to chain multiple operations together in%
delay_dest_2 <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(
      distance,
      na.rm = TRUE
    ),
    delay = mean(
      arr_delay,
      na.rm = TRUE
    )
  )
View(delay_dest_2)

# Determine the which routes belong to the airline company with the highest number of flights
not_cancelled <- flights %>%
  filter(
    !is.na(dep_delay),
    !is.na(arr_delay)
  )
number_carrier <- not_cancelled %>%
  group_by(dest) %>%
  summarise(
    carriers = n_distinct(carrier)
  ) %>%
  arrange(desc(carriers))
View(number_carrier)

# Which route has the most variability in its variables.
not_cancelled %>%
  group_by(dest) %>%
  summarise(
    distance_sd = sd(distance)
  ) %>%
  arrange(desc(distance_sd))

# When does each flight's first and last leg take place?
not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )

# How many flights depart early in the morning before 5 AM every day?
not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    n_early = sum(
      dep_time < 500
    )
  )

# What proportion of flights have more than one hour arrival delay?
not_cancelled %>%
  group_by(year, month, day) %>%
  summarise(
    hour_prop = mean(
      arr_delay > 60
    )
  )

# Which airline company has most arrival delay?
flights %>%
  group_by(carrier) %>%
  summarize(
    arr_delay = mean(
      arr_delay,
      na.rm = TRUE
    )
  ) %>%
  arrange(desc(arr_delay))
filter(airlines, carrier == 'F9')
airlines[airlines$carrier == 'F9', ]

# Popular flight destinations in the US?
popular_dest <- flights %>%
  group_by(dest) %>%
  summarise(
    travels = n()
  ) %>%
  arrange(desc(travels))
View(popular_dest)
View(filter(airports, faa == 'ORD' | faa == 'ATL'))

''
'
** DATA TYPES IN DATA ANALYSIS  **

In data analysis, three different types of datasets are commonly used:
  - Cross-sectional
  - Time series
  - Panel data
Cross-sectional data: At specific times, data that consists of horizontal sections from different units (which can be individuals, houses, firms, cities, states, or countries) is used.

Time series data: It consists of observations made a different time points on a single unit (which can be an induvidual, house, firm, city, state, or country) related to one or more variables. Time series data is used for forecasting.

Panel data: It consists of observations made on different units over time (which can be individuals, houses, firms, cities, states, or countries) related to one or more variables.


** REGRESSION ANALYSIS **

Regression analysis is a statistical method used to examine the relationship between two or more variables. It helps in understanding how changes in one variable are associated with changes in another variable.

In regression analysis, there are three main types of models:
   - Linear Regression: A model that assumes a linear relationship between the dependent and independent variables.
  - Logistic Regression: A model that is used to predict binary outcomes (e.g., yes/no, 0/1) based on one or more independent variables
  - Multiple Linear Regression: A model that assumes a linear relationship between the dependent variable and multiple independent variables


Less Square Method:
  A method used to find the best-fitting line to a set of data points by minimizing the sum of squared differences between the observed values and the predicted values.

lin-lin model:
  It is a model in which both the dependent variable and independent variables are continuous numerical variables. In this model, the relationship between the dependent and independent variables can be described by a straight line equation of the form y = mx + b. Here, m is the slope of the line and b is the y-intercept. The goal of linear regression is to find the values of m and b that minimize the sum of squared differences between the observed values and the predicted values. This can be achieved using techniques such as least squares method.

lin-log model:
  It is a model in which the dependent variable is continuous numerical variable while the independent variables are categorical or binary variables. In this model, the relationship between the dependent and independent variables can be described by a logistic function of the form P(y=1 | x) = exp(b0 + b1 x1 + ... + bn xn) / (1 + exp(b0 + b1 x1 + ... + bn xn)). Here, P(y= 1 | x) is the probability of y being 1 given the values of x. The goal of logistic regression is to find the values of b that maximize the likelihood of observing the data. This can be achieved using techniques such as maximum likelihood method.

log-log model:
  It is a model in which both the dependent variable and independent variables are continuous numerical variables, and the relationship between them can be described by a logarithmic function of the form P(y=1 | x) = exp(b0 + b 1 log(x1) + ... + bn log xn)) / (1 + exp(b0 + b 1 log(x1) + ... + bn log xn)). Here, P(y=1 | x = 1 | x) is the probability of y being 1 given the values of x. The goal of log-log regression is to find the values of b that maximize the likelihood of observing the data under the assumption that it follows a logistic distribution with the specified form.

In summary, log-log regression is a statistical method used to model the relationship between two continuous variables by taking their logarithms and fitting a linear model to the transformed data. It is particularly useful when the relationship between the variables is not linear but can be described by a power law or exponential function.
'
''

# Example of lin-lin model:
# Load necessary packages and libraries
install.packages('wooldridge')
library(wooldridge)

# Load the data set
ceosal1 <- ceosal1
View(ceosal1)

# Fit a linear regression model to the data
lm(
  salary ~ roe,
  data = ceosal1
) #Intercept: 963.2 roe: 18.5

res_ceosal1 <- lm(
  salary ~ roe,
  data = ceosal1
)
summary(res_ceosal1) # View the summary of the model

# Plotting the data points
plot(
  ceosal1$roe,
  ceosal1$salary,
  xlab = 'Return on equity',
  ylab = 'CEO salary',
  ylim = c(0, 4000)
)

# Plot the regression line
abline(
  res_ceosal1,
  col = 'red'
)

# Another example of lin-lin model:

# Load the data set
wage1 <- wage1
View(wage1)

# # Fit a linear regression model to the data
lm(
  wage ~ educ,
  data = wage1
) #Intercept: -0.9049 educ: 0.5414

res_wage1 <- lm(
  wage ~ educ,
  data = wage1
)
summary(res_wage1)

# Plotting the data points
plot(
  wage1$educ,
  wage1$wage1,
  xlab = 'Education',
  ylab = 'Wage'
)

# Plot the regression line
abline(
  res_wage1,
  col = 'red'
)


save.image(file = "lesson01.RData")
