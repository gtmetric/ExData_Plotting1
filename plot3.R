# Load the dataset
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
df <- data[which(as.Date(data$Date, '%d/%m/%Y')>as.Date('2007-01-31', '%Y-%m-%d') & as.Date(data$Date, '%d/%m/%Y')<as.Date('2007-02-03', '%Y-%m-%d')), ]
df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, format = '%Y-%m-%d %H:%M:%S')

png('plot3.png', units = 'px', width = 480, height = 480)
with(df, {
    plot(datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '')
    lines(datetime, Sub_metering_2, col = 'red')
    lines(datetime, Sub_metering_3, col = 'blue')
    legend('topright',
        legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
        col = c('black', 'red', 'blue'),
        lty = 1
    )
})
dev.off()