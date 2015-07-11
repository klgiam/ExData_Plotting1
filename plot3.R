library(lubridate)

# read the whole data file which should have been downloaded and unzipped into same folder
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# subset data with date on 1/2/2007 & 2/2/2007
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Open png device
png("plot3.png", width = 480, height = 480)

# create date time column
data2$Date <- dmy(data2$Date)
data2$Time <- hms(data2$Time)
data2$DateTime <- data2$Date + data2$Time

# Make plot
plot(data2$DateTime, data2$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(data2$DateTime, data2$Sub_metering_2, col='red')
lines(data2$DateTime, data2$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()
