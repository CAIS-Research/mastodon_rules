lda = dfm_topic %>% 
  convert(to = "topicmodels") %>%
  LDA(k=7,control=list(seed=123, alpha = 1/1:7))

terms(lda, 10)


dfm_topic$tmp_topics <- topics(lda)
table(dfm_topic$tmp_topics)

prop.table(table(dfm_topic$tmp_topics))

