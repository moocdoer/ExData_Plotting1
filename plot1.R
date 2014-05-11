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

# Save the PNG
png(file = 'plot1.png', width = 480, height = 480)
hist(
  ds$Global_active_power,
  xlab='Global Active Power (kilowatts)',
  col='red',
  main='Global Active Power'
)
dev.off()