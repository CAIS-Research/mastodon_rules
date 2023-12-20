# set up

# install packages if not installed
# get latest version
# remotes::install_github("gesistsa/rtoot")


library(rtoot)
library(readtext)
library(cld3)
library(rio)
library(quanteda)
library(tidyverse)
library(stringr)
library(summarytools)
library(quanteda)
library(quanteda.textstats)
library(tidyverse)
library(tidytext)
library(ggplot2)
library(lda)
library(ldatuning)
library(topicmodels)

# from rtoot package 

vignette("auth")
auth_setup()

# not run 
# token_m <- readRDS(file.path(tools::R_user_dir("rtoot", "config"), "rtoot_token.rds"))

# get directory
# tools::R_user_dir("rtoot", "config")



# get access using api call with secret token
# secret token is needed to get access to social.instances
# save the token in a new object and use it in the get_fedi_instances() function

# https://instances.social/api/token 



