# get instances
# get all instances with n = 0

instance <- get_fedi_instances(token = sec_tok, n = 1000)

# only english
instance_en <- get_fedi_instances(token = sec_tok, n = 0, language = "en")

# only german
instance_de <- get_fedi_instances(token = sec_tok, n = 0, language = "de")


# get names
instance_name <- instance$name
instance_name

nrow(instance)

# only en
nrow(instance_en)

instance_name <- instance_en$name
names(instance_en)
