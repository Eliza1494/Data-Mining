######################################## 4.28 #########################################
DataFinalProject =read.csv("C:/Users/sxliz/Desktop/Courses/3-spring 2020/5-R-learning/final project/data/fina data/DataFinalProject.csv")

DataFinalProject$Type_Engine <- ifelse(word(DataFinalProject$attributes.engine, -1) == "Hybrid", "Hybrid",
                                       ifelse(word(DataFinalProject$attributes.engine, -1) == "Electric", "Electric",
                                              as.character(DataFinalProject$fuel.type) ))

DataFinalProject$Type_Engine=as.factor(DataFinalProject$Type_Engine)

DataFinalProject$Engine_Fuel <- ifelse(word(DataFinalProject$Type_Engine, -1) == "Hybrid", "Hybrid",
                                       ifelse(word(DataFinalProject$Type_Engine, -1) == "Electric", "Electric",
                                              ifelse(word(DataFinalProject$Type_Engine, -1) == "Unleaded", "Gas",
                                                     ifelse(word(DataFinalProject$Type_Engine, -1) == "Gasoline", "Gasoline",
                                                            as.character(DataFinalProject$Type_Engine)))))

DataFinalProject$Engine_Fuel=as.factor(DataFinalProject$Engine_Fuel)

DataFinalProject=filter(DataFinalProject, !(attributes.type=="Bus"))

DataFinalProject$attributes.type=as.character(DataFinalProject$attributes.type)


pickup=grepl("Pickup", DataFinalProject$attributes.type)

for (i in 1:nrow(DataFinalProject)){
  if (pickup[i]=="TRUE"){
    DataFinalProject[i,10]="Pickup"}
  else {
    DataFinalProject[i,10]=DataFinalProject[i,10]
  }
}

SUV=grepl("Sport Utility Vehicle", DataFinalProject$attributes.type)

for (i in 1:nrow(DataFinalProject)){
  if (SUV[i]=="TRUE"){
    DataFinalProject[i,10]="SUV"}
  else {
    DataFinalProject[i,10]=DataFinalProject[i,10]
  }
}

truck=grepl("Truck", DataFinalProject$attributes.type)
van_category=grepl("Van", DataFinalProject$attributes.category)

for (i in 1:nrow(DataFinalProject)){
  if (truck[i]=="TRUE"){ if (van_category[i]=="TRUE") {DataFinalProject[i,10]="Van"}
    else {DataFinalProject[i,10]="Pickup"}
  }
  else {
    DataFinalProject[i,10]=DataFinalProject[i,10]
  }
}

pickuptruck=grepl("Pickup Truck", DataFinalProject$attributes.category)
for (i in 1:nrow(DataFinalProject)){
  if (pickuptruck[i]=="TRUE"){
    DataFinalProject[i,10]="Pickup"}
  else {
    DataFinalProject[i,10]=DataFinalProject[i,10]
  }
}

DataFinalProject$attributes.type=as.factor(DataFinalProject$attributes.type)