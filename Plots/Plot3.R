# Load data
library(data.table)
system.time(
  data <- fread("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
)

library(lubridate)
data$Date <- dmy(data$Date)

data <- data[Date >= '2007-02-01' & Date <= '2007-02-02']

# Plot 1
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data <- cbind(data, DateTime)

windows()
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     col = "black", lwd = 1, xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, lwd = 1, col = "red" )
lines(data$DateTime, data$Sub_metering_3, lwd = 1, col = "blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lwd = 1, col = c("black", "red", "blue"))

dev.copy(png, "Plot3.png")
dev.off()
