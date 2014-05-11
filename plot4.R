data <- read.table('household_power_consumption.txt', header=T, sep=";")
datasub <- subset(data, Date == '2/2/2007' | Date == '1/2/2007')

#processing data table
datasub$Global_active_power <- as.numeric(as.character(datasub$Global_active_power))
datasub$Global_reactive_power <- as.numeric(as.character(datasub$Global_reactive_power))
datasub$Sub_metering_1 <- as.numeric(as.character(datasub$Sub_metering_1))
datasub$Sub_metering_2 <- as.numeric(as.character(datasub$Sub_metering_2))
datasub$Sub_metering_3 <- as.numeric(as.character(datasub$Sub_metering_3))
datasub$Voltage <- as.numeric(as.character(datasub$Voltage))

#processing date / time variables
datasub$DateTime <- paste(datasub$Date,datasub$Time)
datasub$DateTime <- strptime(datasub$DateTime, "%d/%m/%Y %H:%M:%S")

# plotting
png(file="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), bg="transparent")

# plot upper left
plot(datasub$DateTime, datasub$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# plot upper right
plot(datasub$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot lower left
plot(datasub$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(datasub$DateTime, datasub$Sub_metering_2, col = "red"))
lines(datasub$DateTime, datasub$Sub_metering_3, col = "blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot "lowerright"
plot(datasub$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# Export to PNG
dev.off()
