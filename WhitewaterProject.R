# libraries used
library(tidyverse)

# Reading in the data
data <- read.csv("https://raw.githubusercontent.com/lcory15/Whitewater-River-Project/main/Whitewater_combined_data.csv")

# replacing NAs with 0 
data <- replace(data, is.na(data), 0)

# creating subsets of warm and coldblooded fish
Warm_blooded <- data %>% filter(Reach.of.Stacked_table == 'Central stoneroller' | Reach.of.Stacked_table == 'Common shiner' | Reach.of.Stacked_table == 'Sand shiner' | Reach.of.Stacked_table == 'Southern redbelly dace' | Reach.of.Stacked_table == 'Bluntnose minnow' | Reach.of.Stacked_table == 'Fathead minnow' | Reach.of.Stacked_table == 'Blacknose dace' | Reach.of.Stacked_table == 'Longnose dace' | Reach.of.Stacked_table == 'Creek chub' | Reach.of.Stacked_table == 'White sucker' | Reach.of.Stacked_table == 'Green sunfish' | Reach.of.Stacked_table == 'Bluegill' | Reach.of.Stacked_table == 'Fantail darter' | Reach.of.Stacked_table == 'Johnny darter')
Cold_blooded <- data %>% filter(Reach.of.Stacked_table == 'American brook lamprey' | Reach.of.Stacked_table == 'Rainbow trout' | Reach.of.Stacked_table == 'Brown trout' | Reach.of.Stacked_table == 'Brook trout' | Reach.of.Stacked_table == 'Brook stickleback' | Reach.of.Stacked_table == 'mottled sculpin' | Reach.of.Stacked_table == 'slimy sculpin')

# getting correlations between populations and river characteristics
full_numeric_variables <- data %>% select_if(is.numeric)
cor_all <- cor(full_numeric_variables)
cor_all

cold_numeric_variables <- Cold_blooded %>% select_if(is.numeric)
cor_cold <- cor(cold_numeric_variables)
cor_cold

warm_numeric_variables <- Warm_blooded %>% select_if(is.numeric)
cor_warm <- cor(warm_numeric_variables)
cor_warm