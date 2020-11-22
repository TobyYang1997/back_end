library(cronR)
cron_clear()
cmd <- cron_rscript("src/process_new_data.R")
cron_add(command = cmd, frequency = "minutely", id="update_db", description = "update_db")
#cron_add(command = cmd, frequency = "daily", id="test_1", description = "Just a testing Script")

#cron_ls()
#cron_clear()
