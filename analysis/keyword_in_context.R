# transform to corpus object
tos_corp <- corpus(data_clear_en$tos)

tos_tok <- tokens(tos_corp, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE) %>% 
  tokens_tolower()

tmp_key <- kwic(tos_tok, pattern = "research*", window = 15)
names(tmp_key)
View(tmp_key)

tmp_sci <- kwic(tos_tok, pattern = "scien*", window = 10)
nrow(tmp_sci)
tmp_sci[5]

?kwic
tmp_scrap <- kwic(tos_tok, pattern = "scrap*", window = 10)

kwic(tos_tok, pattern = "ethic*", window = 10)

kwic(tos_tok, pattern = "collect*", window = 10)

kwic(tos_tok, pattern = "scholar*", window = 10)

kwic(tos_tok, pattern = "academ*", window = 10)

tmp_study <- kwic(tos_tok, pattern = "study", window = 10)
tmp_study[2]

key_words_research <- 
  kwic(tos_tok, pattern = list("research*", "scien*", "scholar*", "academ*", "study*", "studies"), window = 15)
n_distinct(key_words_research)
names(key_words_research)

# crawling
key_words_crawl <- 
  kwic(tos_tok, pattern = list("scrap*", "collect*", "copy", "crawl*", 
                               "mining"), window = 15)

n_distinct(key_words_crawl$docname)


key_words_ethic <- 
  kwic(tos_tok, pattern = list("ethic*", "subjects", "informed", "privacy*"), window = 15)

n_distinct(key_words_ethic$docname)

table(key_words_ethic$keyword)

#key_words_right <- 
#  kwic(tos_tok, pattern = list("copyright"), window = 15)
#
#nrow(key_words_right)


#unique instances

id_ethic <- key_words_ethic$docname
id_ethic

id_research <- key_words_research %>%  
  pull(docname)

id_crawl <- key_words_crawl %>% 
  pull(docname)

?append

id_comb <- c(id_ethic, id_research, id_crawl)

length(id_comb)
length(unique(id_comb))


id_comb

table(key_words_research$docname)
n_distinct(key_words_research$docname)

tos_dfm <- tos_tok %>% dfm() %>% 
  dfm_remove(stopwords("en"))

topfeatures(tos_dfm, 15)


# tos_df <- convert(tos_dfm, to ="data.frame")

topfeatures(tos_dfm)

tos_tok_gram <- tos_tok %>% tokens_ngrams(1:2)

tos_dfm <- tos_tok_gram %>% dfm() %>% 
  dfm_remove(stopwords("en"))

#library(quanteda.textstats)
#library(quanteda.textplots)
topfeatures(tos_dfm, 15)

#dictionary
# ethics
list_dict <- list("science", "research")
dic_science <- dictionary(list(words = c("science", "research")))

head(dfm_lookup(tos_dfm, dic_science))
class(dic_science)