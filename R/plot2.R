rm(list=ls())

file <-"household_power_consumption.txt"

rawdata <- read.table(file, sep=";", header=TRUE)
rawdata[,1]<- as.Date(as.character(rawdata[,1]), "%d/%m/%Y")
data <- rawdata[which(rawdata$Date %in% as.Date(c("2007-02-02","2007-02-01"))),]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %H:%M:%S")

## plot2.R 
png("plot2.png", width=480, height=480)
plot(data$DateTime, data[,3], type="l", xlab=NA, ylab="Global Active Power")
dev.off(
