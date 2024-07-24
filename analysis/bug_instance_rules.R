# check & fix issues with getting instance rules

library(rtoot)

get_instance_rules("pixey.org")
get_instance_rules("mastodon.social")

tmp <- get_instance_general("pixey.org")
tmp$rules
get_instances_rules

get_instance_rules("mastodon.social")
get_instance_general("mastodon.social")$rules

get_instance_rules("pixey.org")
get_instance_general("pixey.org")$rules


reprex()

packageVersion("rtoot")
reprex()

R.version
reprex()