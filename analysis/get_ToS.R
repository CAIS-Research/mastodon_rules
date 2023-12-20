# get ToS

out_list_ToS <- list()

# only
system.time(for (i in instance_name) {
  out <- try(get_instance_rules(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})


# loop over instances with Sys.sleep
# system.time(for (i in instance_name) {
#  Sys.sleep(0.001)
#  out <- try(get_instance_rules(i)) #use try() to skip error messages
#  out_list_ToS[[i]] <- out
# })

#tmp_social <- get_instance_general("mastodon.social")

## get full description
out_list_ToS <- list()

# run with get_instance_general
system.time(for (i in instance_name) {
  out <- try(get_instance_general(i)) #use try() to skip error messages
  out_list_ToS[[i]] <- out
})



tmp <- lapply(instance_name, function(x) get_instance_general(x))

