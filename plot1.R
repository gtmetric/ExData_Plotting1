# Load the dataset
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';')
df <- data[which(as.Date(data$Date, '%d/%m/%Y')>as.Date('2007-01-31', '%Y-%m-%d') & as.Date(data$Date, '%d/%m/%Y')<as.Date('2007-02-03', '%Y-%m-%d')), ]

png('plot1.png', units = 'px', width = 480, height = 480)
with(df, hist(
    as.numeric(Global_active_power),
    main = 'Global Active Power',
    xlab = 'Global Active Power (kilowatts)',
    col = 'red'))
dev.off()