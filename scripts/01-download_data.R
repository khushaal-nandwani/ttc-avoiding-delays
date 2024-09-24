#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto's TTC Streetcar Delay Data
# Author: Khushaal NAndwani
# Date: 22 September 2024
# Contact: khushaal.nandwani@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
package <- show_package("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
resources <- list_package_resources(package)

# Selecting the 2024 data
resource2024_id <- resources %>%
    filter(name == "ttc-streetcar-delay-data-2024") %>%
    pull(id)

resource2023_id <- resources %>%
    filter(name == "ttc-streetcar-delay-data-2023") %>%
    pull(id)

resource2024 <- get_resource(resource2024_id)
resource2023 <- get_resource(resource2023_id)

# combine the two datasets
net_resource <- rbind(resource2023, resource2024)

#### Save data ####
write_csv(net_resource, "data/raw_data/ttc-resource-2024.csv")
