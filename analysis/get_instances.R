# get instances
# get all instances with n = 0 using rtoot-package
# full data set all instances 05/2023 n = 17.390

instance <- get_fedi_instances(token = sec_tok, n = 0)

# only english
# instance_en <- get_fedi_instances(token = sec_tok, n = 0, language = "en")

# only german
# instance_de <- get_fedi_instances(token = sec_tok, n = 0, language = "de")

instance_name <- instance$name
instance_name

# play around
# top 1000 users
instance_1000 <- instance[1:1000, ]

# get names top 1000 users
instance_name <- instance_1000$name
instance_name


