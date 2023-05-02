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


# Convert to dataframe
my_df <- do.call(rbind, lapply(out_list_ToS, function(x) data.frame(tos = x[[1]])))
# convert list to dataframe
test <- data.frame(instance = names(elements), tos = sapply(elements, paste, collapse = ";"), row.names = NULL)

# paste converts NA to class character
test[test == "NA"] <- NA

sum(is.na(test))


###
library(quanteda)
library(quanteda.textstats)
library(tidyverse)
library(tidytext)
library(ggplot2)

# clean text
# remove non english text

test_clean <- test[-c(10, 13, 29, 31, 32, 37, 40, 46, 55, 60, 63, 64, 65, 74, 82, 86, 101, 103, 110, 112, 119, 121, 125, 135, 145, 163, 167), ]

test_clean <- na.omit(test_clean)

# Convert the dataframe to a quanteda corpus and generate tokens
my_corpus <- corpus(test_clean$tos)
summary(my_corpus)

toks <- tokens(my_corpus, remove_punct = TRUE, remove_numbers = TRUE, remove_separators = TRUE) %>% 
  tokens_remove(stopwords("en"))

stopwords("en")
  
# Word couns
word_counts <- dfm(toks)

topfeatures(word_counts, 20)  


# wordcloud
set.seed(100)
library("quanteda.textplots")
textplot_wordcloud(word_counts, min_count = 6, random_order = FALSE, rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, "Dark2"))

## bigrams and trigrams
bigrams_ <- tokens_ngrams(toks, n = 2)
bigrams_dfm <- dfm(bigrams)
bigrams_freq <- textstat_frequency(bigrams_dfm)

trigrams <- tokens_ngrams(toks, n = 3)
trigrams_dfm <- dfm(trigrams)
trigrams_freq <- textstat_frequency(trigrams_dfm)

## ngrams 2-4
ngram <- tokens_ngrams(toks, n = 2:4)
ngram_dfm <- dfm(ngram)
ngram_freq <- textstat_frequency(ngram_dfm)

