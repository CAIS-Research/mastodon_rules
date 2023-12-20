lda1  <- LDA(dfm_topic, k=7, method="Gibbs",control=list(iter=2000,burnin=1000,thin=10,seed = 2010))

lda1  <- LDA(dfm_topic, k=7)

lda1_td.beta <- tidy(lda1,matrix="beta")
lda1_td.gamma <- tidy(lda1, matrix = "gamma")



top_terms <- lda1_td.beta %>%
  group_by(topic) %>%
  top_n(15, beta) %>%
  arrange(beta) %>%
  mutate(order = row_number()) %>%
  ungroup() %>%
  arrange(topic, -beta) 

top_terms %>%
  ggplot(aes(x=beta,y=order)) + geom_point(size=4,alpha=0.5) + geom_text(aes(label=term,x=0.0),size=5) +  
  facet_wrap(~topic,scales='free')+
  theme_bw() + 
  xlab('Weight in Topic')+ylab('Term')+ xlim(-0.01,NA)+
  theme(axis.text.y=element_blank(),axis.ticks.y=element_blank()) +
  labs(title="Top Words by Topic",subtitle="15 Topic LDA Model")




library(tidytext)


tmp_topics <- topics(lda1, 15)
table(tmp_topics)
SEED <- 3823

lda_tmp <- LDA(dfm_topic, k = 7,control = list(seed = SEED))


topics_tmp <- topicmodels::terms(lda_tmp, 10)
topics_tmp
