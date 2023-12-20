# set up

# install packages if not installed
# get latest version
# remotes::install_github("gesistsa/rtoot")


#requiered packages: look if already installed
requiredPackages <- c("rtoot", "readtext", "cld3", "rio", "quanteda", 
                      "tidyverse", "stringr", "summarytools", "quanteda.textstats",
                      "tidytext", "ggplot2", "lda", "ldatuning", "topicmodels") # packages

for(p in requiredPackages){
  if(!require(p,character.only = TRUE)) install.packages(p)
  library(p,character.only = TRUE)
}

#lapply(requiredPackages, library, character.only = TRUE) #laden


# from rtoot package 

vignette("auth")
auth_setup()

# not run 
# token_m <- readRDS(file.path(tools::R_user_dir("rtoot", "config"), "rtoot_token.rds"))

# get directory
# tools::R_user_dir("rtoot", "config")



# get access using api call with secret token. Your own token is needed.
# secret token is needed to get access to social.instances. 
# save the token in a new object and use it in the get_fedi_instances() function

# https://instances.social/api/token 



