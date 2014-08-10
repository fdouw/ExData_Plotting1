
# plot4.R
# Floris Douw
# 2014

## Read the data and select the two days we want.
data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

## Include the time in the date.
data$Date <- paste(as.character(data$Date), as.character(data$Time), sep = ' ')
data$Date <- strptime(data$Date, '%Y-%m-%d %H:%M:%S')

## Create the actual plot.
png(file = 'plot4.png')
par(mfrow = c(2,2))
with(data, plot(Date, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l'))
with(data, plot(Date, Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l'))
with(data, plot(Date, Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering'))
with(data, lines(Date, Sub_metering_2, col = 'red'))
with(data, lines(Date, Sub_metering_3, col = 'blue'))
legend('topright', bty = 'n', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
with(data, plot(Date, Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l'))
dev.off()