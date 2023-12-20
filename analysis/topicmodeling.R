# Topicmodel

citation("topicmodels")


# get data from pipeline_preprocess.R

rules_en <- data_clear_en

# create dfm 
corpus_rules <- corpus(rules_en$tos)

stop_list_aktuell <- c("account", "post", "may", "in_the", "do_not", "other_users", "must", "others", "will", "please", "of_the", "of_other", "must_be", "will_be", "to_the", "if_you", "be_a", "don't_be", "is_not")

toks <- tokens(corpus_rules, remove_punct = TRUE, remove_numbers = TRUE, 
               remove_separators = TRUE) %>%
  tokens_remove(c(stopwords("en"), stop_list_aktuell)) %>%
  tokens_wordstem() %>%
  tokens_ngrams(n = 1:2)

## Reihenfolge geändert: stopwords nach ngrams 

#toks <- tokens(my_corpus, remove_punct = TRUE, remove_numbers = TRUE, remove_separators = TRUE) %>%
  #tokens_ngrams(n = 1:2) %>%
  #tokens_remove(c(stopwords("en"), stop_list)) 
  
#stop_list <- c("in_the", "do_not", "other_users", "must", "others", "will", "please", "of_the", "of_other", "must_be", "will_be", "to_the", "if_you", "be_a", "don't_be", "is_not")

# stopword list from analysis_preprocess.R

# now with min and max
dfm_topic <- dfm(toks) %>% 
  dfm_trim(min_termfreq = 5,
           docfreq_type = "prop",
           max_docfreq = 0.45,
           min_docfreq = 0.1) %>% 
  dfm_subset(ntoken(.) > 0)


topfeatures(dfm_topic, 50)

# performance metrices

result <- FindTopicsNumber(
  dfm_topic,
  topics = seq(from = 2, to = 15, by = 1),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 77),
  mc.cores = 2L,
  verbose = TRUE
)
FindTopicsNumber_plot(result)

# Performance LDA k = n
lda_model3_dfm <- LDA(dfm_topic, k = 3)
lda_model4_dfm <- LDA(dfm_topic, k = 4)
lda_model5_dfm <- LDA(dfm_topic, k = 5)
lda_model6_dfm <- LDA(dfm_topic, k = 6)
lda_model8_dfm <- LDA(dfm_topic, k = 8)

# Get the terms for each topic
topics_term3 <- terms(lda_model3_dfm, 10)
topics_terms4 <- terms(lda_model4_dfm, 10)
topics_terms5 <- terms(lda_model5_dfm, 15)
topics_terms6 <- terms(lda_model6_dfm, 10)
topics_terms8 <- terms(lda_model8_dfm, 10)

# final model with 7 topics based on performance metrics

lda_model7_dfm <- LDA(dfm_topic, k = 7)

topics_terms7 <- topicmodels::terms(lda_model7_dfm, 10)

#export_topic_terms <- topics_terms7

#output
topics_terms7

#topic prevalence
dfm_topic$tmp_topics <- topics(lda_model7_dfm)

table(dfm_topic$tmp_topics)




