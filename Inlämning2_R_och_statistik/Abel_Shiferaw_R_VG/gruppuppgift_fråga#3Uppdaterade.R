########## 3. Hitta mördaren #############

library(tidyverse)
#Importera "telemastdata.csv"
path <- "~/Downloads"
df_telemastdata <-
  as_tibble(read.csv(paste(path, "/telemastdata.csv", sep = "")))
#View(df_telemastdata)
#print(df_telemastdata)

#Ge polisen max 6 huvudmisstänkta som de behöver utreda givet informationen.
df_telemastdata_update <-
  df_telemastdata %>% filter(time0 >= 407 & time0 <= 425) %>%
  select(name, phone_type, everything()) %>% filter(phone_type == "iPhone") %>%
  mutate(t1_t0 = timem1 - time0) %>% mutate(t2_t0 = timem2 - time0) %>% mutate (t3_t0 = timem3 - time0)

#view(df_telemastdata_updated)
print(df_telemastdata_update)

#Hastighet
velocity <- 3 * 10 ^ 8

#Genomsnit avstånd genom att använda "t1_t0 = timem1 - time0"
distance_tl_t0 <- velocity * mean(df_telemastdata_update$t1_t0)
print(distance_tl_t0)

#Genomsnit avstånd  genom att använda "t2_t0 = timem2 - time0"
distance_t2_t0 <- velocity * mean(df_telemastdata_update$t2_t0)
print(distance_t2_t0)

#Genomsnit avstånd  genom att använda "t3_t0 = timem3 - time0"
distance_t3_t0 <- velocity * mean(df_telemastdata_update$t3_t0)
print(distance_t3_t0)

master <-
  matrix(
    # c(4, 7, 4.595103, 6, 4, 3.719404, 6, 6, 4.81985),
    c(4, 7, 5, 6, 4, 4, 6, 6, 5), #approximering avtåndet
    ncol = 3,
    byrow = TRUE
  )
colnames(master) <-
  c("X-coord_mast", "Y-coord_mast", "Avstånd till källa")
rownames(master) <- c("Mast 1", "Mast 2", "Mast 3")
print(master)

source("/Users/abelshiferaw/Downloads/triangulation.r",
       encoding = "latin1")
koordinater <- circle_intersection(master)
koordinater