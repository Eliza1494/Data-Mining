#Create a new Column given conditions 
library(tidyverse)
library(stringr)


DataFinalProject$fuel_type = as.character(DataFinalProject$attributes.fuel_type)

DataFinalProject$TypeEngine <- ifelse(word(DataFinalProject$attributes.engine, -1) == "Hybrid", "Hybrid",
                                   ifelse(word(DataFinalProject$attributes.engine, -1) == "Electric", "Electric",
                                          DataFinalProject$fuel_type))
DataFinalProject$TypeMotor <- ifelse(word(DataFinalProject$attributes.engine, -1) == "Hybrid", "Hybrid",
                                      ifelse(word(DataFinalProject$attributes.engine, -1) == "Electric", "Electric",
                                             "Traditional"))

names(DataFinalProject)[names(DataFinalProject) == "TypeMotor"] <- "TypeEngine2"

write.csv(DataFinalProject, "DataFinalProject.csv")

DataFinalProject$TypeEngineCharact = as.character(DataFinalProject$TypeEngine)

DataFinalProject$Type <- ifelse(word(DataFinalProject$TypeEngineCharact, 1) == "Hybrid", "Hybrid",
                                ifelse(word(DataFinalProject$TypeEngineCharact, 1) == "Electric", "Electric",
                                       ifelse(word(DataFinalProject$TypeEngineCharact, 1) == "Diesel", "Diesel", 
                                              ifelse(word(DataFinalProject$TypeEngineCharact, 1) == "Flex-Fuel", "Flex-Fuel", 
                                                     ifelse(word(DataFinalProject$TypeEngineCharact, 2) == "Unleaded", "Unleaded Gas",
                                                            "Gasoline/Natural Gasoline")))))



DataFinalProject$Type = as.factor(DataFinalProject$Type)

levels(DataFinalProject$Type)

#ifelse(test,yes,no)
