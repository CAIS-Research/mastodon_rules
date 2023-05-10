# language detection
library(cld3)




result <- detect_language(tmp_noNA$tos)
result
table(result)

#gleiches Resultat zwischen tmp und tmp_noNA
#419 als default

tmp_noNA$lang <- result
