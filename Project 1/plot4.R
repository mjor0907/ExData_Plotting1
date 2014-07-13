## Exploratory Data Analysis - Project 1
# Plot 4
# Author: Jorge R. Martinez
# Date: 7/12/14 


rows <- read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors = FALSE ,nrows = 5)
classes <- sapply(tab5rows, class)
power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=';', colClasses= classes, na.strings=c('?'))


#2007-02-01
day_1 = power_data[power_data$Date== "1/2/2007",]
#2007-02-02
day_2 = power_data[power_data$Date== "2/2/2007",]

power = rbind(day_1,day_2)

date_time <- strptime( paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")

data = cbind(date_time,power)

# Plot Specific

png("plot4.png", width=480, height=480)

par( mfcol = c(2,2), mar=c(4,4,2,2), oma = c(0,0,2,0) )
with (data, { plot (date_time, Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (killowatts)")
              plot (date_time, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
              points( date_time, power$Sub_metering_2, type = "l", col="red")
              points( date_time, power$Sub_metering_3, type = "l", col="blue")
              
              legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, lwd=c(.25,.25,.25), col=c("black","red", "blue"), cex= 1,bty = "n")
              plot (date_time, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
              plot (date_time, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
              })


dev.off()
