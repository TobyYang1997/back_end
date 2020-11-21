library(jsonlite)
library(caret)
library(dplyr)
library(plumber)
library(readr)




super_model <- read_rds("src/gbtree.rds")
#* Sort df
#* @param df
#* @serializer json
#* @post /credit_predict

function(new_data) {
  
  predict(super_model, new_data, type = "prob")

  }



#################################################################################################################




