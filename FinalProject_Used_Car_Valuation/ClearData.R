library(tidyverse)
library(mosaic)
library(dplyr)
library(ggplot2)
library(foreach)
library(gridExtra)
library(grid)
library(stringr)

########################## 1. graph ###############################
DataFinalProject_Final <- read.csv('https://raw.githubusercontent.com/Eliza1494/Data-Mining/master/FinalProjectData/DataFinalProject_Final.csv')
car=DataFinalProject_Final


# size: long-box = long bed, short-box = short bed, SUV is Chevrolet Traverse - midsize 
car$adsize <- ifelse(word(car$size, 1, -1) == "Long Box", "Long Bed",
                                       ifelse(word(car$size, 1, -1) == "Short Box", "Short Bed",
                                              ifelse(word(car$size, 1, -1) == "Sport Utility Vehicle (Suv)/Multi Purpose Vehicle", "Midsize",
                                                     ifelse(word(car$size, 1, -1) == "Car", word(car$category, 1),
                                                        as.character(car$size) ))))

# two sports car are smart for two that is classified as midsize in data
car$adsize <- ifelse(word(car$adsize, 1, -1) == "Sports", "Compact", 
                   ifelse(word(car$adsize, 1, -1) == "Mid-Size", "Midsize",car$adsize)) 

# use U.S. Fuel Economy Guide
FEGcar=filter(car, !(adsize == 'Long Bed' | adsize == 'Short Bed'))

# the volin plot

size1=ggplot(FEGcar, aes(x=adsize, y=price))+
  geom_violin(trim = FALSE) +
  ylim(100, 55000)+
  scale_x_discrete(limits=c("Compact", "Midsize", "Large"))+
  geom_boxplot(width=0.1, aes(x=adsize, y=price, fill=adsize), show.legend = FALSE)+
  labs(y="Price ($)", x="Size", title="Price of Cars by Size")+
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))

Bedcar=filter(car, adsize == 'Long Bed' | adsize == 'Short Bed')

size2=ggplot(Bedcar, aes(x=adsize, y=price))+
  geom_violin(trim = FALSE) +
  ylim(100, 55000)+
  scale_x_discrete(limits=c("Short Bed", "Long Bed"))+
  geom_boxplot(width=0.1, aes(x=adsize, y=price, fill=adsize), show.legend = FALSE)+
  labs(y="", x="Bed", title="Price of Trucks by Bed")+
  theme(plot.title = element_text(hjust = 0.5),
        axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"))

grid.arrange(size1, size2, nrow=1, top = textGrob("Figure 1.7: Price Distributions by Size or Bed", 
                 hjust = 0.5, gp=gpar(fontsize=17), vjust = 0.1))

#write.csv(car,'C:/Users/sxliz/Desktop/Courses/3-spring 2020/5-R-learning/final project/data/fina data/car5_3.csv')


########################### 2. lasso ################################
########################### 2.1 data preprocessing before lasso ################
#car$make_model= paste(car$make, car$model_, sep=" ")
car$MakeAndModel=as.factor(car$MakeAndModel)
car$type=as.character(car$type)
car$type=ifelse(word(car$type, 1, -1)=="Pickup Truck Pickup Truck Sport Utility Vehicle", "Pickup Truck",car$type)
#car$type=as.factor(car$type)


# put Van and minivan into van since we have used size to capture the info
car$type_adjust=ifelse(word(car$type,1,-1)=="Minivan", "Van", car$type)
car$type_adjust=ifelse(word(car$type_adjust,1,-1)=="Commercial Vehicle", 
                       ifelse(word(car$category,-1)=="Van", "Van", car$type_adjust), car$type_adjust)

car$type_adjust=ifelse(word(car$type_adjust,1,-1)=="Truck", 
                       ifelse(word(car$category,2)=="Pickup", "Pickup Truck", 
                              ifelse(word(car$category,2)=="Van", "Van", "Sport Utility Vehicle")), car$type_adjust)
car$type_adjust=as.factor(car$type_adjust)

# create avaerage mileage as the mean of city milegae and highway mileage 
car=mutate(car, avg.mileage=(city_mileage+highway_mileage)/2)

# create varibale for transmission speed
car=mutate(car, transmission.speed=as.character(car$transmission_speeds))

# there are 15 NA in transmission speed. They are Ford c-max hybrid and Lexus rx400h, both continuous variables 
car$transmission.speed=ifelse(word(car$transmission.speed)=="", "Continuously Variable", car$transmission.speed)
# 10-speed can only be extracted the first number 1, change it to 8 to be classified as high speed
car$transmission.speed=ifelse(word(car$transmission.speed)=="10-Speed", "8-Speed", car$transmission.speed)

car$transmission.speed=ifelse(str_extract(car$transmission.speed, "[^-]+")=="Continuously Variable", "Continuously Variable", 
                              ifelse(str_extract(car$transmission.speed, "[^-]+")<5, "Low Transmission Speed", 
                                     ifelse(str_extract(car$transmission.speed, "[^-]+")>7, "High Transmission Speed",
                                           "Medium Transmission Speed")))
car$transmission.speed=as.factor(car$transmission.speed)

# put transmission type into automated manual, automatic, manual, CVT and directed drive
car$transmission.type=as.character(car$transmission_type)

car$transmission.type=ifelse(word(car$transmission.type)=="Automated", "Automated Manual", 
                             ifelse(word(car$transmission.type)=="AUTOMATED_MANUAL", "Automated Manual",
                                    ifelse(word(car$transmission.type)=="Automatic", "Automatic",
                                           ifelse(word(car$transmission.type)=="CVT", "CVT",
                                                  ifelse(word(car$transmission.type)=="Direct", "Direct Drive",
                                                         ifelse(word(car$transmission.type)=="DIRECT_DRIVE", "Direct Drive",
                                                                ifelse(word(car$transmission.type)=="Manua", "Manual", 
                                                                    ifelse(word(car$transmission.type)=="Manual", "Manual", car$transmission.type))))))))
car$transmission.type=as.factor(car$transmission.type)

# now adjust drive train. first, classify into 4 wheel, front wheel, and rear wheel, leaving other there
# DWR and SWR are for trucks, LWB is a term unknown (for some specific cars), 4x2 are two wheels but not sure front or rear
car$drivetrain_ad=as.character(car$drivetrain)

car$drivetrain_ad=ifelse(word(car$drivetrain_ad)=="All-Wheel", "Four-Wheel Drive", 
                         ifelse(word(car$drivetrain_ad)=="Quattro", "Four-Wheel Drive", 
                            ifelse(word(car$drivetrain_ad)=="SH-AWD", "Four-Wheel Drive", 
                                ifelse(word(car$drivetrain_ad)=="rear-wheel", "Rear-Wheel Drive",
                                       ifelse(word(car$drivetrain_ad)=="Front-Wheel", "Front-Wheel Drive",car$drivetrain_ad)))))

# now classify into four and two wheels 
car$drivetrain_ad2=ifelse(word(car$drivetrain_ad)=="Front-Wheel", "Two-Wheel Drive", 
                          ifelse(word(car$drivetrain_ad)=="Rear-Wheel", "Two-Wheel Drive",
                            ifelse(word(car$drivetrain_ad)=="4x2", "Two-Wheel Drive",
                                 ifelse(word(car$drivetrain_ad)=="4X2", "Two-Wheel Drive",car$drivetrain_ad))))

car$drivetrain_ad=as.factor(car$drivetrain_ad)
car$drivetrain_ad2=as.factor(car$drivetrain_ad2)

# won't include steering type most of them are Rack & Pinion as well as anti_brake_system since most of them are 4-wheel ABS

#Engine_Fuel Type
car$Fuel_Engine=as.character(car$fuel_type_)
car=car %>% 
  mutate(Fuel_Engine =gsub("(Premium Unleaded Required/E85)|(Premium Unleaded Recommended/E85)|(Unleaded/E85)|(Premium Unleaded/E85)|Unleaded/Natural Gasoline|(Recommended)|(Required)", "", Fuel_Engine))

car$Fuel_Engine=ifelse(word(car$TypeEngine2)=="Electric", 'Electric',
                  ifelse(word(car$TypeEngine2)=="Hybrid", 'Hybrid',
                    ifelse(word(car$Fuel_Engine)=="Natural", 'Gasoline',
                      ifelse(word(car$Fuel_Engine)=="Premium", 'Premium Unleaded Gas',
                        ifelse(word(car$Fuel_Engine)=="Regular", 'Regular Unleaded Gas', 
                            ifelse(word(car$Fuel_Engine)=="Flex-Fuel", 'Flex-Fuel',
                              ifelse(word(car$Fuel_Engine)=="Diesel", 'Diesel',car$Fuel_Engine)))))))
                      

car$TypeEngine2=as.factor(car$TypeEngine2)
car$Fuel_Engine=as.factor(car$Fuel_Engine)
car$adsize=as.factor(car$adsize)
write.csv(car,'C:/Users/sxliz/Desktop/Courses/3-spring 2020/5-R-learning/final project/data/fina data/car5_4.csv')

CarData1=car[,c(5,6,7,14,16,18,22,23,30,32,33,34,35,36,42,44,45,47,48,53,63,58,59,60,61,62)]
#summary(CarData1)

CarData1=na.omit(CarData1)
#summary(CarData1)

CarData1=filter(CarData1, !(drivetrain_ad2 == "DRW" |drivetrain_ad2 == "LWB"|drivetrain_ad2 == "SWB"))

# try basic OLS
lm_try=lm(price ~ . - (vin +  invoice_price + TypeEngine2 + drivetrain_ad), data = CarData1)

summary(lm_try)

plot(car5_4$year, car5_4$price)

