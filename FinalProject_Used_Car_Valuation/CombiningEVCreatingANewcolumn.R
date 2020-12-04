
car_craiglist_Price <- car_craiglist_reduced[, colnames(car_craiglist_reduced) %in% c("vin", "price", "model", "odometer")]

names(carsxe_api2)[names(carsxe_api2) == "input.vin"] <- "vin"

carsxe_api2 <- carsxe_api2[, !colnames(carsxe_api2) %in% c("input.format", "input.include", "success", "timestamp", "error")]

MergedTable = inner_join(carsxe_api2, car_craiglist_Price, by = "vin")

MergedTable = unique(MergedTable)
MergedTable <- MergedTable[!duplicated(MergedTable$vin),]


#MergedTable = na.omit(MergedTable)


MergedTable = MergedTable[!(MergedTable$price < 500),]
MergedTable = MergedTable[!(MergedTable$price<2000 & MergedTable$attributes.year>2010), ]
MergedTable = MergedTable[!(MergedTable$odometer < 510), ]
MergedTable = MergedTable[!(MergedTable$odometer > 400000 ), ]
MergedTable = MergedTable[!(MergedTable$odometer > 200000 &  MergedTable$price>4000), ]
MergedTable = MergedTable[!(MergedTable$attributes.year < 1991), ]

MergedTable=mutate(MergedTable, attributes.invoice_price=as.character(attributes.invoice_price))
MergedTable=mutate(MergedTable, invoice_price=sapply(strsplit(MergedTable$attributes.invoice_price, split = "$", fixed = TRUE), function(x) (x[2])) )
MergedTable=mutate(MergedTable, invoice_price=as.numeric( gsub(",", "", MergedTable$invoice_price)) )
MergedTable=filter(MergedTable, MergedTable$invoice_price>=MergedTable$price)

#write.csv(MergedTable, "MergedTable.csv")

#Data Cleaning on Final Data Obs 
#MergedTable <- MergedTable[,!colnames(MergedTable) %in% c("X.1","X")]

MergedTable$MakeAndModel = paste(MergedTable$attributes.make, MergedTable$attributes.model)

lapply(MergedTable, class)

#Categorical Variables: Make, Model, Trim, Style, type, size, Category,
#Country Made in, Doors, Fuel Type, Engine, Transmission, Transmission Speed, Seating, 

levels(MergedTable$attributes.make)
levels(MergedTable$attributes.model)

lm(price ~ MakeAndModel, data=MergedTable)

#Numerical: Fuel Capacity, Engine Size, engine cylinders,
#gross vehicle weight, height, lenght

MergedTable$attributes.fuel_capacity = gsub("\\s*\\w*$", "", MergedTable$attributes.fuel_capacity) #remove "gallons"
MergedTable$attributes.fuel_capacity = as.numeric(as.character(MergedTable$attributes.fuel_capacity)) #make the variable numeric 
class(MergedTable$attributes.fuel_capacity)

MergedTable$attributes.curb_weight = gsub("\\s*\\w*$", "", MergedTable$attributes.curb_weight)
MergedTable$attributes.curb_weight = as.numeric(as.character(MergedTable$attributes.curb_weight))
class(MergedTable$attributes.curb_weight)

MergedTable$attributes.gross_vehicle_weight_rating = gsub("\\s*\\w*$", "", MergedTable$attributes.gross_vehicle_weight_rating)
MergedTable$attributes.gross_vehicle_weight_rating = as.numeric(as.character(MergedTable$attributes.gross_vehicle_weight_rating))
class(MergedTable$attributes.gross_vehicle_weight_rating)

MergedTable$attributes.overall_height = gsub("\\s*\\w*$", "", MergedTable$attributes.overall_height)
MergedTable$attributes.overall_height = as.numeric(as.character(MergedTable$attributes.overall_height))
class(MergedTable$attributes.overall_height)

MergedTable$attributes.overall_length = gsub("\\s*\\w*$", "", MergedTable$attributes.overall_length)
MergedTable$attributes.overall_length = as.numeric(as.character(MergedTable$attributes.overall_length))
class(MergedTable$attributes.overall_length)

MergedTable$attributes.overall_width = gsub("\\s*\\w*$", "", MergedTable$attributes.overall_width)
MergedTable$attributes.overall_width = as.numeric(as.character(MergedTable$attributes.overall_width))
class(MergedTable$attributes.overall_width)

MergedTable$attributes.wheelbase_length = gsub("\\s*\\w*$", "", MergedTable$attributes.wheelbase_length)
MergedTable$attributes.wheelbase_length = as.numeric(as.character(MergedTable$attributes.wheelbase_length))
class(MergedTable$attributes.wheelbase_length)

MergedTable=MergedTable %>% mutate(attributes.city_mileage=as.character(attributes.city_mileage),
                                             attributes.highway_mileage=as.character( attributes.highway_mileage))

MergedTable=MergedTable %>% 
  mutate(attributes.city_mileage=gsub("miles/gallon|mpg|miles per gallon", "", attributes.city_mileage),
         attributes.highway_mileage=gsub("miles/gallon", "", attributes.highway_mileage))


a1=grepl("-", MergedTable$attributes.city_mileage)

for (i in 1:nrow(MergedTable)){
  if (a1[i]=="TRUE"){
    MergedTable[i,16]=sapply(strsplit(MergedTable[i,16], split = "-"), function(x) (x[2])) }
  else {
    MergedTable[i,16]=MergedTable[i,16]
  }
}

a2=grepl("-", MergedTable$attributes.highway_mileage)

for (i in 1:nrow(MergedTable)){
  if (a2[i]=="TRUE"){
    MergedTable[i,17]=sapply(strsplit(MergedTable[i,17], split = "-"), function(x) (x[2])) }
  else {
    MergedTable[i,17]=MergedTable[i,17]
  }
}

MergedTable= MergedTable %>% mutate(attributes.city_mileage=as.numeric(attributes.city_mileage),
                                              attributes.highway_mileage=as.numeric(attributes.highway_mileage))

MergedTable= MergedTable %>% mutate(avg.mileage=(attributes.city_mileage+attributes.highway_mileage)/2)


MergedTable=mutate(MergedTable, transmission.speed=as.character(MergedTable$attributes.transmission_speeds))

for (i in 1:nrow(MergedTable)){
  if (MergedTable[i,54] %in% c("1-Speed", "4-Speed")){
    MergedTable[i, 54]="low transmission speed" }
  else { if (MergedTable[i, 54] %in% c("5-Speed", "6-Speed", "7-Speed", "6-Speed Automatic")) {
    MergedTable[i, 54]="medium transmission speed" }
    else {if (MergedTable[i, 54] %in% c("8-Speed", "9-Speed", "10-Speed")) {
      MergedTable[i, 54]="high transmission speed"}
      else {
        MergedTable[i, 54]="Continuously Variable"
      }
    }
  }
}

MergedTable=mutate(MergedTable, attributes.fuel_type=as.character(attributes.fuel_type))
MergedTable=MergedTable %>% 
  mutate(fuel.type =gsub("(Premium Unleaded Required/E85)|(Premium Unleaded Recommended/E85)|(Unleaded/E85)|(Premium Unleaded/E85)|Unleaded/Natural Gasoline|(Recommended)|(Required)", "", attributes.fuel_type))

a3=grepl("Flex-Fuel", MergedTable$fuel.type)
a4=grepl("Premium Unleaded", MergedTable$fuel.type)
a5=grepl("Diesel", MergedTable$fuel.type)

for (i in 1:nrow(MergedTable)){
  if (a3[i]=="TRUE"){
    MergedTable[i, 55]="Flex-Fuel" }
  else { if (a4[i]=="TRUE") {
    MergedTable[i, 55]="Premium Unleaded" }
    else {if (a5[i]=="TRUE") {
      MergedTable[i, 55]="Diesel"}
      else {
        MergedTable[i, 55]=MergedTable[i, 55]
      }
    }
  }
}

MergedTable=MergedTable %>%
  mutate(warranty_miles=as.character(warranties.miles), warranty_miles1=as.character(warranties.miles.1))

MergedTable=MergedTable %>% 
  mutate(warranty_miles=gsub("miles|,|\\s+", "", warranty_miles), warranty_miles1=gsub("miles|,|\\s+", "", warranty_miles1))

a6=grepl("unlimited", MergedTable$warranty_miles)
a7=grepl("unlimited", MergedTable$warranty_miles1)

for (i in 1:nrow(MergedTable)){
  if (a6[i]=="TRUE"){
    MergedTable[i,56]="1000000"}
  else {
    MergedTable[i,56]=MergedTable[i,56]
  }
}

for (i in 1:nrow(MergedTable)){
  if (a7[i]=="TRUE"){
    MergedTable[i,57]="1000000"}
  else {
    MergedTable[i,57]=MergedTable[i,57]
  }
}

MergedTable$warranty_miles=as.numeric(MergedTable$warranty_miles)
MergedTable$warranty_miles1=as.numeric(MergedTable$warranty_miles1)


#MergedTable <- MergedTable[,!colnames(MergedTable) %in% c("TypeEngine", "TypeEngine2", "TypeEngineCharact", "Type")]

MergedTable$fuel_type = as.character(MergedTable$attributes.fuel_type)


MergedTable <- MergedTable[, !colnames(MergedTable) %in% c("colors.category.1", "colors.name.1")]

DataFinalProject <- DataFinalProject[, !colnames(DataFinalProject) %in% c("TypeEngine2", "TypeEngine")]

DataFinalProject_Final = rbind(MergedTable, DataFinalProject)

DataFinalProject_Final <- DataFinalProject_Final[!duplicated(DataFinalProject_Final$vin),]








DataFinalProject_Final$TypeMotor <- ifelse(word(DataFinalProject_Final$attributes.engine, -1) == "Hybrid", "Hybrid",
                                           ifelse(word(DataFinalProject_Final$attributes.engine, -1) == "Electric", "Electric",
                                                  "Traditional"))

names(DataFinalProject_Final)[names(DataFinalProject_Final) == "TypeMotor"] <- "TypeEngine2"

DataFinalProject_Final$TypeEngine <- ifelse(word(DataFinalProject_Final$attributes.engine, -1) == "Hybrid", "Hybrid",
                                            ifelse(word(DataFinalProject_Final$attributes.engine, -1) == "Electric", "Electric",
                                                   DataFinalProject_Final$fuel_type))

DataFinalProject_Final$TypeEngineCharact = as.character(DataFinalProject_Final$TypeEngine)

DataFinalProject_Final$Type <- ifelse(word(DataFinalProject_Final$TypeEngineCharact, 1) == "Hybrid", "Hybrid",
                                      ifelse(word(DataFinalProject_Final$TypeEngineCharact, 1) == "Electric", "Electric",
                                             ifelse(word(DataFinalProject_Final$TypeEngineCharact, 1) == "Diesel", "Diesel", 
                                                    ifelse(word(DataFinalProject_Final$TypeEngineCharact, 1) == "Flex-Fuel", "Flex-Fuel", 
                                                           ifelse(word(DataFinalProject_Final$TypeEngineCharact, 2) == "Unleaded", "Unleaded Gas",
                                                                  "Gasoline/Natural Gasoline")))))






DataFinalProject_Final$Type = as.factor(DataFinalProject_Final$Type)


#Should be before typeEngine
DataFinalProject_Final$Type2 <- factor(DataFinalProject_Final$Type, labels = c("Diesel", "Electric","Flex-Fuel",
                                                                               "Gasoline",  "Hybrid", "Unleaded Gas"))


6725 + 19614


write.csv(DataFinalProject_Final, "DataFinalProject_Final.csv")