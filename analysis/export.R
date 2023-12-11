# Export

write.table(my_list, "my_list.txt", sep="\t", quote = FALSE, row.names = FALSE)

## Export each element of the list to a separate file
#for (i in names(my_list)) {
#  write.table(my_list[[i]], paste0(i, ".txt"), sep="\t", quote = FALSE, row.names = FALSE)
#}


# Export the file as a CSV file using the write_csv() function from the readr package. Data is df_export_rules
write_csv(df_export_rules, "data/mastodon_rules_keywords.csv")

# Export to xlsx
library(openxlsx)

# data with three key words
openxlsx::write.xlsx(df_export_rules, "data/mastodon_rules_keywords.xlsx", colNames = TRUE, rowNames = FALSE, append = FALSE)


# data archive

openxlsx::write.xlsx(tmp_archiving, "data/mastodon_rules_keywords_archive.xlsx", colNames = TRUE, rowNames = FALSE, append = FALSE)
