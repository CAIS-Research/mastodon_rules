# instances with no ToS set to NA
elements <- lapply(out_list_ToS, function(x) {
  if (length(x) >= 2) {
    x[[2]]
  } else {
    NA
  }
})

elements
sum(!is.na(elements))

lapply(elements, tail, 1)

tail(elements) # last elements
tail(instance_name)
