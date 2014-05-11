# Load the dataset
ds = read.table(
  file = 'household_power_consumption.txt',
  sep=';',
  header = TRUE,
  stringsAsFactors = FALSE,
  na.strings = '?'
)

# Subset the dataset
ds = ds[ds$Date %in% c('1/2/2007', '2/2/2007'), ]

# Create a full date vector to plot
fd = strptime(
  paste(ds$Date, ds$Time),
  format = '%d/%m/%Y %H:%M:%S'
)

# Save the PNG
png(file = 'plot3.png', width = 480, height = 480)
plot(
  x = fd,
  y = ds$Sub_metering_1,
  type = 'n',
  xlab = '',
  ylab = 'Energy sub metering'
)
lines(fd,ds$Sub_metering_1)
lines(fd,ds$Sub_metering_2, col = 'red')
lines(fd,ds$Sub_metering_3, col = 'blue')
legend(
  'topright',
  lty = 'solid',
  col = c('black', 'red', 'blue'),
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
)
dev.off()
