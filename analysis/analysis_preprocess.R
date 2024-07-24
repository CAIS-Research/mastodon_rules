# analysis preprocess

#create dfm
corpus_rules <- corpus(data_clear_en$tos)

toks <- tokens(corpus_rules, remove_punct = TRUE, remove_numbers = TRUE, 
               remove_separators = TRUE) %>%
  tokens_remove(c(stopwords("en"), stop_list_aktuell)) %>%
  tokens_wordstem() %>%
  tokens_ngrams(n = 1:2)


#toks <- tokens(my_corpus, remove_punct = TRUE, remove_numbers = TRUE, remove_separators = TRUE) %>%
#tokens_ngrams(n = 1:2) %>%
#tokens_remove(c(stopwords("en"), stop_list)) 


#stop_list <- c("in_the", "do_not", "other_users", "must", "others", "will", "please", "of_the", "of_other", "must_be", "will_be", "to_the", "if_you", "be_a", "don't_be", "is_not")
stop_list_aktuell <- c("account", "post", "may", "in_the", "do_not", "other_users", "must", "others", "will", "please", "of_the", "of_other", "must_be", "will_be", "to_the", "if_you", "be_a", "don't_be", "is_not")

dfm_topic <- dfm(toks) %>% 
  dfm_trim(min_termfreq = 5,
           docfreq_type = "prop",
           max_docfreq = 0.45,
           min_docfreq = 0.1) %>% 
  dfm_subset(ntoken(.) > 0)


# get the top features
# note: data access not addressed

topfeatures(dfm_topic, 50)
