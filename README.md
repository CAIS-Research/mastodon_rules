# Mastodon research paper on ToS

## How to go further
* full data set is on data subfolder
* playaround data set with 1000 instances on data subfolder
* First: Run set_up.R to install all required packages

## Get instances and rules
Run the following scripts to call API, get instances and rules and save them as csv files in data subfolder.

* 
* get_instances.R
* get_ToS.R
* instance_preprocess.R

You can go through the code and change the parameters to get instances and rules. 

## Workflow for data analysis/reproduce analysis
Run set_up.R to install all required packages. 

* pipeline_preprocess.R (see language_detection.R for more details)
* analysis_preprocess.R

See all other files for data analysis

* meta_information.R for instance information
* language_detection.R for language detection
* keyword_detection.R and keyword_in_context.R for string detection
* topicmodeling.R and topic_model_finalR for topic modeling
* plot_terms.R for vizualisation
* bi_trigram.R for Bi- and Trigrams. 
