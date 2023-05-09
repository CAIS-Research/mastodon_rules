# get ToS

out_list_ToS <- list()

# loop over instances
system.time(for (i in instance_name) {
  Sys.sleep(0.001)
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})

?get_fedi_instances

head(out_list_ToS)

# only en
system.time(for (i in instance_name) {
  Sys.sleep(0.001)
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})







