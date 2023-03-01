# get ToS
#elements <- sapply(out_list_ToS, function(x) ifelse(length(x)>=2, x[[2]], NA))

# instances with no ToS set to NA
elements <- lapply(out_list_ToS, function(x) {
  if (length(x) >= 2) {
    x[[2]]
  } else {
    NA
  }
})

elements
sum(is.na(elements))

# convert list to dataframe
test <- data.frame(instance = names(elements), tos = sapply(elements, paste, collapse = ","), row.names = NULL)

# paste converts NA to class character
test[test == "NA"] <- NA

sum(is.na(test))


###
library(quanteda)

# clean text
# remove non english text

test_clean <- test[-c(18,31,32,33,36,48), ]

test_clean <- na.omit(test_clean)

# Convert the dataframe to a quanteda corpus
my_corpus <- corpus(test_clean$tos)

summary(my_corpus)

word_counts <- tokens(my_corpus, remove_punct = TRUE, remove_numbers = TRUE, remove_separators = TRUE) %>% 
  tokens_remove(stopwords("en")) %>%
  dfm()

word_counts

topfeatures(word_counts, 20)  

# wordcloud
set.seed(100)
library("quanteda.textplots")
textplot_wordcloud(word_counts, min_count = 6, random_order = FALSE, rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, "Dark2"))





