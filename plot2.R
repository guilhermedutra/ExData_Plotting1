## Read the data
data <- read.table ("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", rep("numeric",7)), na.strings = "?")

## Convert date to date class
data$Date <- as.Date (data$Date, format = "%d/%m/%Y")

## Get only the wantes dates
data <- data [ format(data$Date, "%Y") == "2007" & format(data$Date, "%m") == "02" & (format(data$Date, "%d") == "01" | format(data$Date, "%d") == "02") ,]

## Convert date and time class
data$Date <- as.POSIXlt (paste(as.Date(data$Date, format = "%d/%m/%Y"), data$Time, sep = " "))

## Plot Global Active Power versus time
png ("plot2.png", width = 480, height = 480)
par (mar = c(4.7,4.7,0.7,0.7))
plot (data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")