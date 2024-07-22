# string detection
# using our keyword-list

#"research*", "scien*", "scholar*", "academ*", "study*", "studies")


df <- data_clear_en

#key_words_research <- 

table(str_detect(df$tos, pattern = c("research*")))
table(str_detect(df$tos, pattern = c("scien*")))


# no empty space!
df$research <- ifelse(str_detect(df$tos, pattern = c("research*|scien*|scholar*|study*|studies")), 1, 0)

table(df$research)

# tmp data

tmp_data <- df %>% filter(research == 1)

## Scrapping
#"scrap*", "collect*", "copy", "crawl*","mining"

df$scrape <- ifelse(str_detect(df$tos, pattern = c("scrap*|collect*|copy|crawl*|mining")), 1, 0)

table(df$scrape)

table(df$research, df$scrape)

## Ethics
# "ethic*", "subjects", "informed", "privacy*"

df$ethics <- ifelse(str_detect(df$tos, pattern = c("ethic*|subjects|informed|privacy*")), 1, 0)

table(df$ethics)


## Overall

df$overall <- ifelse(df$research == 1 | df$scrape == 1 | df$ethics == 1, 1, 0)

prop.table(table(df$overall))

table(df$overall)

df_export_rules <- df %>% filter(research == 1 | scrape == 1 | ethics == 1)



##Archiving
df$archiving <- ifelse(str_detect(df$tos, pattern = c("archiv*")), 1, 0)

table(df$archiving)

tmp_archiving <- df %>% filter(archiving == 1)



