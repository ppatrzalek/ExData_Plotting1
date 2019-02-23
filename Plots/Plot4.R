# Load data
library(data.table)
system.time(
  data <- fread("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
)

library(lubridate)
data$Date <- dmy(data$Date)

data <- data[Date >= '2007-02-01' & Date <= '2007-02-02']

attach(data)
png("Plot4.png")
par(mfrow = c(2,2), mar = c(3.8, 3.8, 3.8, 3.8))
plot(DateTime, Global_active_power,
                ylab = "Global Active Power", xlab = "", 
                type = "l")
plot(DateTime, Voltage, type = "l", xlab = "datatime")
plot(DateTime, Sub_metering_1, type = "l", 
     col = "black", lwd = 1, xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, lwd = 1, col = "red" )
lines(DateTime, Sub_metering_3, lwd = 1, col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"), box.lty = 0, inset = .02, cex = 0.8)
plot(DateTime, Global_reactive_power, type = "l", lwd = 0.5, xlab = "datetime")

dev.off()

