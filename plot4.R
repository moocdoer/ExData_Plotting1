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
png(file = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
# Top left
plot(
  x = fd,
  y = ds$Global_active_power,
  type = 'n',
  xlab = '',
  ylab = 'Global Active Power'
)
lines(fd,ds$Global_active_power)
# Top right
plot(
  x = fd,
  y = ds$Voltage,
  type = 'n',
  xlab = 'datetime',
  ylab = 'Voltage'
)
lines(fd,ds$Voltage)
# Bottom left
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
  bty = 'n',
  col = c('black', 'red', 'blue'),
  legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
)
# Bottom right
plot(
  x = fd,
  y = ds$Global_reactive_power,
  type = 'n',
  xlab = 'datetime',
  ylab = 'Global_Reactive_power'
)
lines(fd,ds$Global_reactive_power)
dev.off()