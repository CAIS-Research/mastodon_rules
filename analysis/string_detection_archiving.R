# string detection archiving

## Archiving
df$archiving <- ifelse(str_detect(df$tos, pattern = c("archiv*")), 1, 0)

table(df$archiving)

tmp_archiving <- df %>% filter(archiving == 1)