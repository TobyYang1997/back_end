library(jsonlite)
library(caret)
library(dplyr)
library(plumber)





super_model <- readRDS('gbtree.RDS')

#* Sort df
#* @param df
#* @serializer json
#* @post /credit_predict

function(new_data) {
  
  predict(super_model, new_data, type = "prob")

  }



#################################################################################################################




