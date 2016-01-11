##Exploratory data analysis: w1 : asg: plot1
fname <- "./household_power_consumption.txt"
fdata <- read.table(fname, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
## str(fdata)
## subset data
sfdata <- subset(fdata, Date %in% c("1/2/2007","2/2/2007"))
##sfdata1 <- fdata[fdata$Date %in% c("1/2/2007","2/2/2007") ,]
## plot1 global active power histogram

png("plot1.png",width = 480, height = 480)
hist(as.numeric(sfdata$Global_active_power),col = "red", main = "Global Active Power", xlab = "Global Active power (kilowatts)")
dev.off()
