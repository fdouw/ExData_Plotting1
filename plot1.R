
## plot1.R
## Floris Douw
## 2014

## Read the data and select the two days we want.
data <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

## Create the actual plot.
png(file = 'plot1.png')
hist(data$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red')
dev.off()