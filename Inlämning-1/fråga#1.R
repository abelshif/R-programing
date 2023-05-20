######## 1. Tidy data ###########

library(tidyverse)
#Importera "music.csv"
path <- "~/Downloads"
df_music <- as_tibble(read.csv(paste(path, "/music.csv", sep = "")))
#view(df_music)
print(df_music)

#. Flytta så att ranks blir den första kolonnen följt av allt annat.
df_music_selected <- df_music %>% select(ranks, everything())
print(df_music_selected)

# kolla på NA-värden 
nr_of_na <- sum(is.na(df_music_selected))
nr_of_na

#. För att få en kolumn utan NA-värden slå samman post_metal_rank, black_metal_rank 
#  och death_metal_rank till en ny kolumn, genre_rankings.

df_music_united <- df_music_selected %>% unite("genre_rankings", 
                                               c("post_metal_rank", "black_metal_rank", "death_metal_rank"))
print(df_music_united)

# kolla på NA-värden
nr_of_na <- sum(is.na(df_music_united))
nr_of_na

#. Dela upp kolonnen length till minutes och seconds.
df_music_separated <- df_music_united %>% separate(length, into = c("minutes", "seconds"))
print(df_music_separated)

#. Gruppera sedan på artist och svara på vilken artist som har högst genomsnitskkran-
#  -k från kolonnen ranks för sina låtar.
artist_by_avg_ranks <- df_music_separated %>% 
  group_by(artist) %>% 
  summarize(ranks_mean = mean(ranks))%>% arrange(desc(ranks_mean))

print(artist_by_avg_ranks)

#. Döp om genre_rankings till genres. Byt sen namn på varje kolumn från x_y_rank 
#  till x y (t.ex. så att black_metal_rank blir till black metal.
colnames(df_music_separated)[4] <- c("genres")
print(df_music_separated)

df_music_separated$genres <- str_replace_all(df_music_separated$genres, "22_NA_NA", "22 NA NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "23_NA_NA", "23 NA NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_3_NA", "NA 3 NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_2_NA", "NA 2 NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_7_NA", "NA 7 NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_176", "NA NA 176")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_120", "NA NA 120")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_32", "NA NA 32")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_3", "NA NA 3")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_2", "NA NA 2")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_NA_1", "NA NA 1")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_1_NA", "NA 1 NA")
df_music_separated$genres <- str_replace_all(df_music_separated$genres, "NA_8_NA", "NA 8 NA")

print(df_music_separated)

#. Introducera en egen funktion, diff, till group_by som tar in ranks för en artist och
#  ger tillbaks skillnaden mellan högsta och minsta rank ifrån ranks. Använd denna för 
#  att få artist, mean och diff i er artistgruppering.
diff <- function(artist_ranks){
  Min = min(artist_ranks)
  Max = max(artist_ranks)
  return(Max - Min)
}
df_music_separated %>% group_by(artist) %>% 
  summarise(ranks_differ = diff(ranks), ranks_avg = mean(ranks))
