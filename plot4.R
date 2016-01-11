##Exploratory data analysis: w1 : asg: plot4
fname <- "./household_power_consumption.txt"
fdata <- read.table(fname, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## str(fdata)
## subset data
sfdata <- subset(fdata, Date %in% c("1/2/2007","2/2/2007"))
##sfdata1 <- fdata[fdata$Date %in% c("1/2/2007","2/2/2007") ,]

## plot4
xtime <- strptime(paste(sfdata$Date, sfdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gactpower<- as.numeric(sfdata$Global_active_power)
volt <- as.numeric(sfdata$Voltage)
grctpower<- as.numeric(sfdata$Global_reactive_power)

png("plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2)) 
plot(xtime,gactpower,type = "l", xlab = "",ylab = "Global Active Power")

plot(xtime,volt, type = "l", xlab = "datetime", ylab = "Voltage")

plot(xtime, as.numeric(sfdata$Sub_metering_1),type = "l", xlab = "",ylab = "Energy sub metering")
lines(xtime, as.numeric(sfdata$Sub_metering_2),type = "l", col ="red")
lines(xtime, as.numeric(sfdata$Sub_metering_3),type = "l", col ="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1,lwd = 1, col = c("black","red","blue"), bty="n")

plot(xtime,grctpower,type = "l", xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
