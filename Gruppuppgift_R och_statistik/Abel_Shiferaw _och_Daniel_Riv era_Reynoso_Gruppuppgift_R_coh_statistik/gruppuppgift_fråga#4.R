############ 4. Regression i R #############

library(tidyverse)
#library(psych)
#library(ggplot2)

#Importera "LungCap.csv"
path <- "~/Downloads"
df_LungCap <- as_tibble(read.csv(paste(path, "/LungCap.csv", sep = "")))
#View(df_LungCap)
print(df_LungCap)
describe(df_LungCap)

# Skappa "df_train" och "df_test" från "df_LungCap"
df_test <- df_LungCap[1:362, ]
df_train <- df_LungCap[363:725, ]

####### Motivering om de valda oberoend variabler (Hur och varför  vi valda dem ? ) ####

#De tre oberoende variablerna(xi) som bäst förklarar den beroende variabeln (LungaCap/y/) 
#baserat på högre R-squared värde är "Age, Height och new_var3".
# "Age coh Height" är redan nämnde variabler  som påverkar "LungCap" då skall vi inkludera dem
# alltid när vi gör vår linear model.
# Då skall vi välja en mer variabel från de andra okända variabler (new_var1,..., new_var6) som kan 
# ger oss högre R^2 värd tillsammans med "Age coh Height" när vi skapar multiple lnjar regrassionen.
# "df_train " är bättre del sample än "df_test" för att skapa modelen i förhållandet till högre R^2.
linMod <- lm(LungCap ~ Age + Height + new_var3, data = df_train)
summary(linMod)

#prediction using of "linMod" using "df_train"
pred_LungCap <- predict(linMod, df_train)
df.pred_LungCap <- as_tibble(data.frame(pred_LungCap))
print(df.pred_LungCap)

# Calculation of "R-squared" value using formula 
SSE <- sum((df.pred_LungCap - df_train$LungCap) ^ 2)  # error sum of squares
SST <- sum((df_train$LungCap - mean(df_train$LungCap)) ^ 2)  # total sum of squares
R_squared <- 1 - SSE/SST
print(R_squared)

# Scatter and line plot for "LungCap ~ Age" using "df_train"
plot_1 <- ggplot(df_train, aes(Age, LungCap)) +
  geom_point() +
  theme_light() +
  labs(x = "Age", y = "LungCap") +
  stat_smooth(method = "lm",  se = TRUE)
plot_1

# Scatter and line plot for "LungCap ~ Height" using "df_train"
plot_2 <- ggplot(df_train, aes(x=Height, y=LungCap)) +
  geom_point() +
  theme_light() +
  stat_smooth(method = "lm", se = TRUE)
plot_2

# Scatter and line plot for "LungCap ~ new_var3" using "df_train"
plot_3 <- ggplot(df_train, aes(x=new_var3, y=LungCap)) +
  geom_point() +
  theme_classic() +
  geom_smooth(method = "lm", se = TRUE)
plot_3

#prediction using of "linMod" using "df_test"
predictions <- predict(linMod, df_test)
df_predictions <- as_tibble(data.frame(predictions))
print(df_predictions)
