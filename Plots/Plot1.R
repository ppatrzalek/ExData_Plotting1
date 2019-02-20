# Load data
library(data.table)
system.time(
  data <- fread("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
)

library(lubridate)
data$Date <- dmy(data$Date)

data <- data[Date >= '2007-02-01' & Date <= '2007-02-02']

# Plot 1
data$Global_active_power <- as.numeric(data$Global_active_power)

windows()
with(data, hist(Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
)

dev.copy(png, file = "Plot1.png")
dev.off()
