################################################################################
# Master file to perform data management, cleaning, analysis                   #
#                                                                              #
################################################################################

# Check installed dependencies -------------------------------------------------


library(here)


source(here("data_management", "1_packages.R"))
source(here("data_management", "2_load_data.R"))
source(here("data_management", "3_clean_data.R"))
source(here("data_management", "4_exploratory_analysis.R"))