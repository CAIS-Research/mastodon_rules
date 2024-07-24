# language detection
library(cld3)

result <- detect_language(data_clear$tos)
result
table(result)

# internal note: same results for tmp and tmp_noNA
# 419 as default

data_clear$lang <- result
