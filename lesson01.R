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

save.image(file = "lesson01.RData")
