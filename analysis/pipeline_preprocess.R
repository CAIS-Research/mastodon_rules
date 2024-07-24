# pipeline data preprocessing

## import data to reproduce analysis.
## see subfolder data
## all rules


data <- import("data/Tos_fulldata.rds")

nrow(data)

#full set data n = 17.390

#remove NA
data <- na.omit(data)

nrow(data)
# n = 6838

names(data)

#clean data
data_clear <- data

data_clear$tos <- gsub( "[.,*]", " ", trimws(data$tos))

# only English rules
## using language detection with cld3 see language_detection.R

result <- detect_language(data_clear$tos)
result
table(result)

# internal note: same result with tmp and tmp_noNA
# 419 as default

data_clear$lang <- result

data_clear_en <- data_clear %>% filter(lang == "en")

nrow(data_clear_en)

names(data_clear_en)

# only English n = 4371