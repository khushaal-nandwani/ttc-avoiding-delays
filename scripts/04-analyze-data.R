#### Preamble ####
# Purpose:
# Author: Khushaal Nandwani
# Date: 22 September 2024
# Contact: khushaal.nandwani@mail.utoronto.ca
# License: MIT

library(tidyverse)

data <- read_csv("data/analysis_data/ttc-resource-2024-cleaned.csv")

# ------- Delay

ggplot(data, aes(x = as.POSIXct(paste(Date, Time)), y = `Min Delay`)) +
  geom_point(aes(color = Incident), size = 3) +
  labs(title = "Public Transportation Delays", x = "Date and Time", y = "Delay in Minutes") +
  theme_minimal()


# ---- Average delay by North, South, East and West Bound ---- #
directions <- c("N", "S", "E", "W")
avg_delay_by_direction <- data %>%
    group_by(Bound) %>%
    summarize(avg_delay = mean(`Min Delay`))


ggplot(
    data = avg_delay_by_direction,
    mapping = aes(x = Bound, y = avg_delay)
) +
    geom_point() +
    ylim(10, 20) +
    geom_line() +
    theme_classic() +
    labs(
        title = "Average delay by direction",
        x = "Direction",
        y = "Average delay (minutes)"
    )


# ---- Average delay by Train Number ---- #
train_numbers <- unique(data$Line)
number_of_records_by_train_number <- data %>% 
  group_by(Line) %>%
  summarize(train_record_count =  n(), average_train_delay = mean(`Min Delay`))

  
ggplot(
  data = number_of_records_by_train_number,
  mapping = aes(x = factor(train_numbers), y = average_train_delay, 
                fill = train_record_count)
) + 
  geom_bar(stat = "identity") + 
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme_classic() + 
  labs(
    title = "Average delay of trains by Line number",
    x = "Line Number",
    y = "Average delay (minutes)",
    fill = "Number of Trains"
  )

# I like to see these as reviews as restaurants. Some has more but average is 
# low. The choice in such cases 

# Average delay by time of day

# lets do the analysis by the time of the day. We need to group by 
#  0 - 2, 2 - 4 etc

data$Hour <- as.numeric(substr(data$Time, 1, 2))

avg_delay <- data %>% 
  group_by(Hour) %>%
  summarize(Average_Delay = mean(`Min Delay`))

ggplot(avg_delay, aes(x = Hour, y = Average_Delay)) +
  geom_point(color='blue', size=3) +
  geom_line(color = "blue", size = 1) +  
  scale_x_continuous(breaks = 0:24) +         # Set x-axis to show 0 to 24
  labs(title = "Average Delay by Hour", x = "Hour of Day", y = "Average Delay (Minutes)") +
  theme_minimal()


# Average delay by the monht of the year
data$Month <- as.numeric(substr(data$Date, 6, 7))

avg_delay_by_month <- data %>% 
  group_by(Month) %>%
  summarize(Average_Delay = mean(`Min Delay`))

ggplot(avg_delay_by_month, aes(x = Month, y = Average_Delay)) +
  geom_point(color='blue', size=3) +
  geom_line(color = "blue", size = 1) +  
  scale_x_continuous(breaks = 1:12) +         # Set x-axis to show 0 to 24
  labs(title = "Average Delay by Month", x = "Month of Year", y = "Average Delay (Minutes)") +
  theme_minimal()

# Scatter plot of delay by date, where the x axis is just the years
