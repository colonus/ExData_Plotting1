# 08.11.14
# coursera: exploratory data analysis
# course project 1
# plot 2

require(data.table)

classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <- fread("household_power_consumption.txt", skip=66637,nrows=2880, sep=";", na.strings="?", colClasses = classes)

firstrow <- fread("household_power_consumption.txt", nrows=1, header=T, sep=";", na.strings="?", colClasses = classes)
header <- colnames(firstrow)
colnames(data) <- header

datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %X")

png("plot4.png",480,480)
par(mfrow = c(2, 2))
with(data, plot(datetime,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
with(data, plot(datetime,Voltage,type="l",ylab = "Voltage"))
with(data, plot(datetime,Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "n"))
with(data, points(datetime,Sub_metering_1,type="l"))
with(data, points(datetime,Sub_metering_2,type="l", col="red"))
with(data, points(datetime,Sub_metering_3,type="l", col="blue"))
legend("topright", bty="n", lwd=1, col = c("black","blue","red"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
with(data, plot(datetime,Global_reactive_power,type="l"))
dev.off()
