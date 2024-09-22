#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

# get package
package <- show_package("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
resources <- list_package_resources(package)

resource2024_id <- resources %>% 
  filter(name == "ttc-streetcar-delay-data-2024") %>% 
  pull(id)

resource2024 <- get_resource(resource2024_id)

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(resource2024, "data/raw_data/ttc-resource-2024.csv")
         
