##Exploratory data analysis: w1 : asg: plot2
fname <- "./household_power_consumption.txt"
fdata <- read.table(fname, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## str(fdata)
## subset data
sfdata <- subset(fdata, Date %in% c("1/2/2007","2/2/2007"))
##sfdata1 <- fdata[fdata$Date %in% c("1/2/2007","2/2/2007") ,]
## plot2

xtime <- strptime(paste(sfdata$Date, sfdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gactpower<- as.numeric(sfdata$Global_active_power)
png("plot2.png",width = 480, height = 480)
plot(xtime,gactpower,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
