# get instances
# get all instances with n = 0

instance <- get_fedi_instances(token = sec_tok, n = 10)

# only english
# instance_en <- get_fedi_instances(token = sec_tok, n = 0, language = "en")

# only german
# instance_de <- get_fedi_instances(token = sec_tok, n = 0, language = "de")

instance_name <- instance$name
instance_name


# top 1000 users
instance_1000 <- instance[1:1000, ]

# get names top 1000 users
instance_name <- instance_1000$name
instance_name


