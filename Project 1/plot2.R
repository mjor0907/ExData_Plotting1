## Exploratory Data Analysis - Project 1
# Plot 2
# Author: Jorge R. Martinez
# Date: 7/12/14 


tab5rows <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors = FALSE ,nrows = 5)
classes <- sapply(rows, class)
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses= classes, na.strings=c('?'))


#2007-02-01
day_1 = power_data[power_data$Date== "1/2/2007",]
#2007-02-02
day_2 = power_data[power_data$Date== "2/2/2007",]

power = rbind(day_1,day_2)

date_time <- strptime( paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")


# Plot Specific
plot (date_time, power$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (killowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()