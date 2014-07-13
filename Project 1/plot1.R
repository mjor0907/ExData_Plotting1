## Exploratory Data Analysis - Project 1
# Plot 1
# Author: Jorge R. Martinez
# Date: 7/12/14 


rows <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors = FALSE ,nrows = 5)
classes <- sapply(rows, class)
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses= classes, na.strings=c('?'))


#2007-02-01
day_1 = power_data[power_data$Date== "1/2/2007",]
#2007-02-02
day_2 = power_data[power_data$Date== "2/2/2007",]

remove(power_data)

power = rbind(day_1,day_2)

# Plot Specific
hist(power$Global_active_power, col='red', main= "Global Active Power", xlab= "Global Active Power (killowatts)" )


dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()