# get ToS

out_list_ToS <- list()

# loop over instances
for (i in instance_name) {
  Sys.sleep(0.01)
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
}
