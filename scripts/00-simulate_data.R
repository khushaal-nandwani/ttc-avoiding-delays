#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Khushaal Nandwani
# Date: 22 September 2024
# Contact: khushaal.nandwani@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
sim_data <- tibble(
    Date = rep(as.Date("2024-01-01"), 12),
    Line = sample(c(505, 503, 600, 501, 507, 506, 510), 12, replace = TRUE),
    Time = c(
        "02:45", "03:06", "03:21", "03:53", "04:27", # nolint
        "04:33", "04:39", "04:52", "04:53", "04:54", "04:56", "04:57"
    ),
    Day = rep("Monday", 12),
    Location = sample(c(
        "DUNDAS AND MCCAUL", "COLLEGE AND GLADSTONE", "PARLIAMENT AND SHUTTER",
        "DUNDAS WEST STATION", "QUEEN AND BATHURST", "QUEEN AND PORTLAND",
        "RONCESVALLES YARD", "UNION STATION"
    ), 12, replace = TRUE),
    Incident = sample(
        c(
            "Security", "Emergency Services",
            "Diversion", "General Delay"
        ),
        12,
        replace = TRUE
    ),
    Min_Delay = sample(0:100, 12, replace = TRUE),
    Min_Gap = sample(0:100, 12, replace = TRUE),
    Bound = sample(c("W", "E", "N", "NA"), 12, replace = TRUE),
    Vehicle = sample(4400:4600, 12, replace = TRUE)
)
