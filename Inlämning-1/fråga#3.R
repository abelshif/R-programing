########## 3. Hitta mördaren #############

library(tidyverse)
#Importera "telemastdata.csv"
path <- "~/Downloads"
df_telemastdata <- as_tibble(read.csv(paste(path, "/telemastdata.csv", sep = "")))
#View(df_telemastdata)
print(df_telemastdata)

#Ge polisen max 6 huvudmisstänkta som de behöver utreda givet informationen.
df_telemastdata_updated <- df_telemastdata %>% filter(time0 >= 407 & time0 <= 425)%>% 
  select(name, phone_type, time0)%>%filter(phone_type == "iPhone")
#view(df_telemastdata_updated)  
print(df_telemastdata_updated)
