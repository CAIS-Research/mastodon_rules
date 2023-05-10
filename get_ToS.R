# get ToS

out_list_ToS <- list()

# only en
system.time(for (i in instance_name) {
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})


# loop over instances with Sys.sleep
system.time(for (i in instance_name) {
  Sys.sleep(0.001)
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})





