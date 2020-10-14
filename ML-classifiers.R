library(tidyverse)
library(workflows)
library(parsnip)
library(recipes)
library(yardstick)
library(glmnet)
library(tidyquant)
library(timetk) # Use 
remotes::install_github("business-science/timetk")


###################################### load, combine, and select for user 003 #################

# for the first three lines to work efficiently, make sure you have the user's folder(003) in the same directory as this R script 

df <- dir("003", full.names = TRUE) %>%
  map_df(read_csv) %>%
  select(ts = time_stamp, hr, sleep_classes)


# convert epoch timestamp to human-readable date ####

df$ts <- as.POSIXct(as.numeric(df$ts), origin = '1970-01-01', tz = 'GMT') 

view (df)


# Visualize data and training/testing regions
df <-
  ggplot(aes(x = ts, y = hr)) +
  geom_rect(xmin = as.numeric(ymd("2017-07-29")),
            xmax = as.numeric(ymd("2017-08-26")),
            ymin = 0, ymax = 10000,
            fill = palette_light()[[4]], alpha = 0.01) +
  annotate("text", x = ymd("2011-10-01"), y = 7800,
           color = palette_light()[[1]], label = "Train Region") +
  annotate("text", x = ymd("2012-10-01"), y = 1550,
           color = palette_light()[[1]], label = "Test Region") +
  geom_point(alpha = 0.5, color = palette_light()[[1]]) +
  labs(title = "Bikes Sharing Dataset: Daily Scale", x = "") +
  theme_tq()

# To check if there and any missing values in our preprocessed data
# any(is.na(User_003))

#data01$classes <- ifelse(data01$classes == "sleep", 1, 0)

# factor level
#data01$classes <- factor(data01$classes, levels = c(0, 1)) 