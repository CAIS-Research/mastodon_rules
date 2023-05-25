# pipeline data
library(rio)
library(quanteda)
library(tidyverse)

data <- import("Tos_fulldata.rds")

data <- na.omit(data)

nrow(data)
names(data)

data_clear <- data
data_clear$tos <- gsub( "[.,*]", " ", trimws(data$tos))


# language detection
library(cld3)

result <- detect_language(data_clear$tos)
result
table(result)

#gleiches Resultat zwischen tmp und tmp_noNA
#419 als default

data_clear$lang <- result



data_clear_en <- data_clear %>% filter(lang == "en")


# transform to corpus object
tos_corp <- corpus(data_clear_en$tos)

tos_tok <- tokens(tos_corp, remove_punct = TRUE)

tos_dfm <- tos_tok %>% dfm()

#tos_df <- convert(tos_dfm, to ="data.frame")
