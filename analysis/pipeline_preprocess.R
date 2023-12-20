# pipeline data preprocess

## import data
data <- import("data/Tos_fulldata.rds")

nrow(data)
#full set data n = 17.390

#remove NA see preprocessing
data <- na.omit(data)

nrow(data)
# n = 6838

names(data)

#clear data
data_clear <- data

data_clear$tos <- gsub( "[.,*]", " ", trimws(data$tos))

# only english rules
## using language detection

result <- detect_language(data_clear$tos)
result
table(result)

#gleiches Resultat zwischen tmp und tmp_noNA
#419 als default

data_clear$lang <- result

data_clear_en <- data_clear %>% filter(lang == "en")

nrow(data_clear_en)

names(data_clear_en)

#only english n = 4371


------###### End pipeline preprocess


