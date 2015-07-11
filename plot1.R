# read the whole data file which should have been downloaded and unzipped into same folder
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

# subset data with date on 1/2/2007 & 2/2/2007
data2 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Open png device
png("plot1.png", width = 480, height = 480)

# Make plot
hist(data2$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()


