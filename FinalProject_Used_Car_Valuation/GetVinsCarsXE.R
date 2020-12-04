write.csv(DataFinalProject_Final, "DataFinalProject_Final.csv")

DataFinalProject_Final <- DataFinalProject_Final[!duplicated(DataFinalProject_Final$vin),]

VinNumberDataFinal = data.frame("Vin" = DataFinalProject_Final$vin)
VinCraiglist2 <- data.frame("Vin" = VinCraiglist[, !colnames(VinCraiglist) %in% c("X")])

TotalVin = rbind(VinCraiglist2, VinNumberDataFinal)
TotalVin = unique(TotalVin)

306772+19614
306772 - 19614

VinNumbers = data.frame("Vin" = TotalVin[sample(nrow(TotalVin), 10000),])
VinNumbers = unique(VinNumbers)
write.csv(VinNumbers, "VinNumbers.csv")
