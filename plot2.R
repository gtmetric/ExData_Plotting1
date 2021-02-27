# Load the dataset
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
df <- data[which(as.Date(data$Date, '%d/%m/%Y')>as.Date('2007-01-31', '%Y-%m-%d') & as.Date(data$Date, '%d/%m/%Y')<as.Date('2007-02-03', '%Y-%m-%d')), ]
df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, format = '%Y-%m-%d %H:%M:%S')

png('plot2.png', units = 'px', width = 480, height = 480)
with(df, plot(
    datetime,
    Global_active_power,
    type = 'l',
    ylab = 'Global Active Power (kilowatts)',
    xlab = ''
))
dev.off()