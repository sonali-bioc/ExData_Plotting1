rm(list=ls())

file <-  "household_power_consumption.txt"

rawdata <- read.table(file, sep=";", header=TRUE)
rawdata[,1]<- as.Date(as.character(rawdata[,1]), "%d/%m/%Y")
data <- rawdata[which(rawdata$Date %in% as.Date(c("2007-02-02","2007-02-01"))),]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %H:%M:%S")
                            
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]

                            
png("plot3.png", width=480, height=480)
with(data, plot(DateTime, Sub_metering_1, type = "l", 
                ylab="Energy Sub metering",xlab=NA))
with(data, lines(DateTime, Sub_metering_2, type = "l", col="red"))
with(data, lines(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", col = c("black","blue", "red"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
