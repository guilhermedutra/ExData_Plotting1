## Read the data
data <- read.table ("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", rep("numeric",7)), na.strings = "?")

## Convert date to date class
data$Date <- as.Date (data$Date, format = "%d/%m/%Y")

## Get only the wantes dates
data <- data [ format(data$Date, "%Y") == "2007" & format(data$Date, "%m") == "02" & (format(data$Date, "%d") == "01" | format(data$Date, "%d") == "02") ,]

## Plot a histogram 
png ("plot1.png", width = 480, height = 480)
par (mar = c(4.7,4.7,0.7,0.7))
hist (data$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")