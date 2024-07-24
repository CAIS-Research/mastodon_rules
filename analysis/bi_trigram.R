## bigrams and trigrams
bigrams <- tokens_ngrams(toks, n = 2)
bigrams_dfm <- dfm(bigrams)
bigrams_freq <- textstat_frequency(bigrams_dfm)
bigrams_freq

trigrams <- tokens_ngrams(toks, n = 3)
trigrams_dfm <- dfm(trigrams)
trigrams_freq <- textstat_frequency(trigrams_dfm)
trigrams_freq

## ngrams 2-4
ngram <- tokens_ngrams(toks, n = 2:4)
ngram_dfm <- dfm(ngram)
ngram_freq <- textstat_frequency(ngram_dfm)