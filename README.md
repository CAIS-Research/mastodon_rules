# Replication package for the Mastodon instance rules paper

Data & code for the paper: Wähner, M., Deubel, A., Breuer, J., & Weller, K. (2024). “Don’t Research Us” – How Mastodon Instance Rules Connect to Research Ethics. *Publizistik*. Advance online publication. https://doi.org/10.1007/s11616-024-00855-6


## Data & setup
* The full data set can be found in the on `data` folder.
* You can run/source the (code in) the file `setup.R` contained in the `analysis` folder to install all required packages.

## Get instances and rules
You can run the following scripts to call the *Mastodon* API, get instances and rules, and save them as `.csv` files.

*Note*: Collecting these data requires access tokens for the *Mastodon* API. You can check the [documentation of the `rtoot` package](https://gesistsa.github.io/rtoot/articles/auth.html) for further information on this.

* get_instances.R
* get_rules.R
* instance_preprocess.R

## Preprocessing

* pipeline_preprocess.R (see language_detection.R for more details)
* analysis_preprocess.R
* language_detection.R for language detection

## Analysis

* meta_information.R for instance information
* keyword_detection.R and keyword_in_context.R for string detection
* topicmodeling.R and topic_model_finalR for LDA topic modeling
* plot_terms.R for visualization
* bi_trigram.R for bi- and trigrams