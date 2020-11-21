###################################################################################################
# Author: Yili Yang, Olajoke Oladipo, Wenxi Feng
# Project: Prototyping Data Science Products
# File: init__.R
# Description: project initialisation
###################################################################################################
# Input: config.R
# Output: front end running logic
###################################################################################################

# sourcing necessary files ----
source("src/scheduler.R")
source("src/create_api.R")


# install necessary packages --- it would be better to create a function
library(plumber)

# running the back-end (APIs) ---
r <- plumb("src/create_api.R")
# Where 'plumber.R' is the location of the file shown above

# Run r on port 8000
r$run(host = "0.0.0.0",  port = 8080)