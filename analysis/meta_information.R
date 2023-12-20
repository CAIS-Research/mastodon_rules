#meta information

table(data_clear_en$instance)
table(instance$name)

# daten duplizieren
tmp <- data_clear_en

tmp$name <- data_clear_en$instance

names(instance)

tmp_full <- merge(tmp, instance, by = "name", all.x = TRUE)


tmp_full$name <- instance$name
names(tmp_full)

min(tmp_full$users, na.rm = TRUE)

tmp_full[which.max(tmp_full$users),]

library(summarytools)

install.packages("summarytools")


descr(tmp_full$users)

# plotting distribution

ggplot(tmp_full, aes(x = users)) +
  geom_histogram() +
  theme_bw()


hist(tmp_full$users)


#get the year 

tmp_full$timestamp <- as.POSIXct(tmp_full$added_at, format = "%Y-%m-%dT%H:%M:%OSZ")


tmp_full$year <- format(tmp_full$timestamp, "%Y")

table(tmp_full$year)

# top 10 instances

top15 <- top_n(tmp_full, 15, users)    

top15$name


# instances with less then 5 users

instances_less <- tmp_full[which(tmp_full$users < 5),]


prop.table(table(instances_less$open_registrations))



mastodon_instanzen <- c(
  "mastodon.pirateparty.be",
  "julialang.social",
  "www.librepunk.club",
  "okla.social",
  "technodon.social",
  "social.curious.bio",
  "toot.sh",
  "mastodon.bentasker.co.uk",
  "masto.nd2.uk",
  "mastodon.digital-science.com",
  "leroymcqy.tk",
  "mastodon.lubar.me",
  "mastodon.cloudcauldron.io",
  "atergens.com",
  "thisplays.social",
  "letus.inspiredlife.fun",
  "www.landileshembebook.com"
)


# filter instances
filter_df <- instance[instance$name %in% mastodon_instanzen,]






