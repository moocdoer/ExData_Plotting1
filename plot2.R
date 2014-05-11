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
png(file = 'plot2.png', width = 480, height = 480)
plot(
  x = fd,
  y = ds$Global_active_power,
  type = 'n',
  xlab = '',
  ylab = 'Global Active Power (kilowatts)'
)
lines(fd,ds$Global_active_power)
dev.off()
