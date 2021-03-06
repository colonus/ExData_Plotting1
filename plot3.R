# 08.11.14
# coursera: exploratory data analysis
# course project 1
# plot 3

Sys.setlocale("LC_TIME", "English") # set local time to english

require(data.table)

classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <- fread("household_power_consumption.txt", skip=66637,nrows=2880, sep=";", na.strings="?", colClasses = classes)

firstrow <- fread("household_power_consumption.txt", nrows=1, header=T, sep=";", na.strings="?", colClasses = classes)
header <- colnames(firstrow)
colnames(data) <- header

datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %X")

png("plot3.png",480,480)
with(data, plot(datetime,Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "n"))
with(data, points(datetime,Sub_metering_1,type="l"))
with(data, points(datetime,Sub_metering_2,type="l", col="red"))
with(data, points(datetime,Sub_metering_3,type="l", col="blue"))
legend("topright", lwd=1, col = c("black","blue","red"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
