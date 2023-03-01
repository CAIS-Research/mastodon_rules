# Export

write.table(my_list, "my_list.txt", sep="\t", quote = FALSE, row.names = FALSE)

# Export each element of the list to a separate file
for (i in names(my_list)) {
  write.table(my_list[[i]], paste0(i, ".txt"), sep="\t", quote = FALSE, row.names = FALSE)
}