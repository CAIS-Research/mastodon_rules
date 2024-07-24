# instances with no rules set to NA
elements <- lapply(out_list_ToS, function(x) {
  if (length(x) >= 2) {
    x[[2]]
  } else {
    NA
  }
})

elements
sum(!is.na(elements))

#lapply(elements, tail, 1)

#tail(elements) # last elements
#tail(instance_name)


# convert list to dataframe
tmp <- data.frame(instance = names(elements), tos = sapply(elements, paste, collapse = ","), row.names = NULL) 

#test <- data.frame(instance = names(elements), tos = sapply(elements, paste, collapse = ";"), row.names = NULL)

# change converted NA to class character
tmp[tmp == "NA"] <- NA

sum(is.na(tmp))

head(tmp)

# save an object to a file
#saveRDS(tmp, file = "ToS_fulldata_aktuell.RData")
#saveRDS(tmp, file = "ToS_fulldata_aktuell.rds")

# approx. 1/3 NA
tmp_noNA <- na.omit(tmp)

