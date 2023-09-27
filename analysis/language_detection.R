# language detection
library(cld3)




result <- detect_language(data_clear$tos)
result
table(result)

#gleiches Resultat zwischen tmp und tmp_noNA
#419 als default

data_clear$lang <- result
