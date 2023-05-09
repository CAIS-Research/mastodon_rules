# language detection
result <- detect_language(tmp$tos)
result
names(result)
table(result)

tmp$lang <- result
