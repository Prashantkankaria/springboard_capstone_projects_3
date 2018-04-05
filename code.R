library(dplyr)
library(tidyverse)

#load file "estimated_crimes_by_state_year.csv

crime <- read.table("estimated_crimes_by_state_year.csv", header = TRUE, sep = "," , 
                    stringsAsFactors = FALSE, na.strings = "")

#Rename Columns

crime <- crime %>% rename(state = state_abbr, violent = violent_crime, motor = motor_vehicle_theft,
                          property = property_crime, assault = aggravated_assault)

#Remove the rows with State = NA and remove column "Caveats"

crime <- crime %>% filter(!is.na(state))

crime <- crime %>% subset(select = - c(caveats))


#Create a new column Rape using Rape_Legacy and Rape_revised and then remove the two. 

crime <- crime %>% mutate(rape = ifelse(is.na(rape_revised), rape_legacy, rape_revised))

crime <- crime %>% subset(select = - c(rape_legacy, rape_revised))

#load file "export-c48f03ed....."

x <- read.table("export-c48f03ed-138e-44f5-b3b4-a58e2d1d289b.csv", header = TRUE, sep = "," , 
                    stringsAsFactors = FALSE, na.strings = "")
y <- read.table("us_mass_shootings.csv", 
                header = TRUE, sep = ",", stringsAsFactors = FALSE, na.strings = "", fill = TRUE)
                
gunsales <- read.table("nics-firearm-background-checks.csv", header = TRUE, sep = ",",
                       stringsAsFactors = FALSE, na.strings = "")















