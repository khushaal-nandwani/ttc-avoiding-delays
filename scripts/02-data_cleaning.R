#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Khushaal Nandwani
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: khushaal.nandwani@mail.utoronto.ca
# License: MIT

# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/ttc-resource-2024.csv")

# Remove rows with missing values
cleaned_data <- raw_data %>%
    drop_na()
  
# Remove rows where bound is not one of W, E, N, S
cleaned_data <- cleaned_data %>%
    filter(Bound %in% c("W", "E", "N", "S"))

# If Min Gap is smaller than Min Delay, drop the row
cleaned_data <- cleaned_data %>%
    filter(`Min Gap` >= `Min Delay`)

# Remove records where the delay is greater than 240 minutes
cleaned_data <- cleaned_data %>% 
  filter(`Min Delay` <= 300)


number_of_records_by_train_number <- cleaned_data %>% 
  group_by(Line) %>%
  summarize(train_record_count = n())

# Since 45, 305, 312, 500 have less than 5 records each, we will drop them
# we assume these were exceptions, might have ran due to emergency or some other reason
# and can affect our data negatively potentially.
# note this will be diffeerent for different data, be it 

# we will program it

unfrequent_trains <- cleaned_data %>% 
  group_by(Line) %>%
  summarize(train_record_count = n()) %>%
  filter(train_record_count <= 150)

unfreq_train_numbers <- unfrequent_trains[1] %>% pull(Line) %>% as.character()

cleaned_data <- cleaned_data %>% 
  filter(!Line %in% unfreq_train_numbers)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/ttc-resource-2024-cleaned.csv")

