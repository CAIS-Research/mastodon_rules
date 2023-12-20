TermFreq <- textstat_frequency(dfm_topic, 20)


bigrams <- tokens_ngrams(toks, n = 2)
bigrams_dfm <- dfm(bigrams)
bigrams_freq <- textstat_frequency(bigrams_dfm)

TermFreq %>% 
  head(n = 15) %>% 
  ggplot(aes(x = reorder(feature, frequency), y = frequency)) +
  geom_bar(stat="identity") +
  labs(x = "",
       y = "Frequency") +
  scale_y_continuous(expand = c(0,0))+
  coord_flip()+
  theme_minimal()

bigrams_freq %>% 
  head(n = 15) %>% 
  ggplot(aes(x = reorder(feature, frequency), y = frequency)) +
  geom_bar(stat="identity") +
  labs(x = "",
       y = "Frequency") +
  scale_y_continuous(expand = c(0,0))+  
  coord_flip()+
  theme_minimal()
          