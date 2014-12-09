# 08.11.14
# coursera: exploratory data analysis
# course project 1
# plot 2

Sys.setlocale("LC_TIME", "English") # set local time to english

require(data.table)

classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data <- fread("household_power_consumption.txt", skip=66637,nrows=2880, sep=";", na.strings="?", colClasses = classes)

firstrow <- fread("household_power_consumption.txt", nrows=1, header=T, sep=";", na.strings="?", colClasses = classes)
header <- colnames(firstrow)
colnames(data) <- header

datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %X")


png("plot2.png",480,480)
with(data, plot(datetime,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
dev.off()
