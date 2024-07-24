# get instances
# get all instances with more than 0 users using the rtoot package
# full data set all instances 05/2023 n = 17.390

instance <- get_fedi_instances(token = sec_tok, n = 0)

# only English
# instance_en <- get_fedi_instances(token = sec_tok, n = 0, language = "en")

# only German
# instance_de <- get_fedi_instances(token = sec_tok, n = 0, language = "de")

instance_name <- instance$name
instance_name

# test
# top 1000 users
instance_1000 <- instance[1:1000, ]

# explore
# get names of top 1000 users
instance_name <- instance_1000$name
instance_name


