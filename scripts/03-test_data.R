#### Preamble ####
# Purpose: Testing that the data is clean and ready for analysis
# Author: Khushaal Nandwani
# Date: 22 September 2024
# Contact: khushaal.nandwani@mail.utoronto.ca
# License: MIT

# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)


#### Test data ####
test_data <- read_csv("data/analysis_data/ttc-resource-2024-cleaned.csv")

# Test if all the delays and gaps are non-negative
min_delay = min(test_data$`Min Delay`)
min_gap = min(test_data$`Min Gap`)

testthat::expect_true(min_delay >= 0)
testthat::expect_true(min_gap >= 0)

# Test if bound is one of W, E, N, S
bound = unique(test_data$Bound)
testthat::expect_true(all(bound %in% c("W", "E", "N", "S")))
