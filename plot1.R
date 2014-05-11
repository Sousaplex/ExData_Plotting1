data <- read.table('household_power_consumption.txt', header=T, sep=";")
datasub <- subset(data, Date == '2/2/2007' | Date == '1/2/2007')

#processing data table
datasub$Global_active_power <- as.numeric(as.character(datasub$Global_active_power))
datasub$Global_reactive_power <- as.numeric(as.character(datasub$Global_reactive_power))
datasub$Sub_metering_1 <- as.numeric(as.character(datasub$Sub_metering_1))
datasub$Sub_metering_2 <- as.numeric(as.character(datasub$Sub_metering_2))
datasub$Sub_metering_3 <- as.numeric(as.character(datasub$Sub_metering_3))

#processing date / time variables
datasub$DateTime <- paste(datasub$Date,datasub$Time)
datasub$DateTime <- strptime(datasub$DateTime, "%d/%m/%Y %H:%M:%S")

# PLOTTING PLOT 1

par(bg='transparent')
hist(datasub$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = 'Frequency')
dev.copy(png, 'plot1.png')
dev.off()