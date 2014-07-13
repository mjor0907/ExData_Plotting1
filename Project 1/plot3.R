## Exploratory Data Analysis - Project 1
# Plot 3
# Author: Jorge R. Martinez
# Date: 7/12/14 


rows <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors = FALSE ,nrows = 5)
classes <- sapply(tab5rows, class)
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses= classes, na.strings=c('?'))


#2007-02-01
day_1 = power_data[power_data$Date== "1/2/2007",]
#2007-02-02
day_2 = power_data[power_data$Date== "2/2/2007",]

remove(power_data)

power = rbind(day_1,day_2)

date_time <- strptime( paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")



# Plot Specific

plot (date_time, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points( date_time, power$Sub_metering_2, type = "l", col="red")
points( date_time, power$Sub_metering_3, type = "l", col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(.5,.5,.5), col=c("black","red", "blue"), cex= .75)

dev.copy(png, file = "plot_3.png", width = 480, height = 480)
dev.off()
