#set up

install.packages("rtoot")
library(rtoot)

vignette("auth")
auth_setup()

token_m <- readRDS(file.path(tools::R_user_dir("rtoot", "config"), "rtoot_token.rds"))

#get dir
#tools::R_user_dir("rtoot", "config")

?get_fedi_instances

#get access using api call with secret token
#https://instances.social/api/token 

sec_tok <- "RHVKW7m8Fr75vM3At5QsjG5nIPLR2t1NRAfBoJGBlBzv6CTkkstlsDzY8c5aWVjkEft0C8bwmjtBqI7a6OBmO9wyc1nVlqWDE0Ke6EiPUudq0N1HOPOdlCGxew3SVKRN"

inc <- get_fedi_instances(token = sec_tok, n = 20)

#get ToS

rules <- get_instance_rules(inc[1,2])

rules

names_inc <- inc$name

rules <- get_instance_rules(inc$name)

for (i in seq_along(names_inc)) {
  out <- get_instance_rules(i)
  return(out)
  
}





lapply(inc["name"], function(x) get_instance_rules(x))
inc["name"]

for (i in inc["name"]) {
  out <- get_instance_rules(i)
}


for (i in names_inc) {
  get_instance_rules(i)
}
