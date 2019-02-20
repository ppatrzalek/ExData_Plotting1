# Load data
library(data.table)
system.time(
  data <- fread("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
)

library(lubridate)
data$Date <- dmy(data$Date)

data <- data[Date >= '2007-02-01' & Date <= '2007-02-02']

# Plot 2
data$Global_active_power <- as.numeric(data$Global_active_power)
DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data <- cbind(data, DateTime)

windows()
with(data, plot(DateTime, Global_active_power,
                ylab = "Global Active Power (kilowatts)", xlab = "", 
                type = "l")
)

dev.copy(png, "Plot2.png")
dev.off()
