fileName <- "household_power_consumption.txt"
data <- read.table(fileName, sep=";", nrows=2880, skip=66637, col.names=
                     c("Date", "Time", "GAP", "GRP", "V", "GI", "Sub1", 
                       "Sub2", "Sub3"))

data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

newTime <- paste(data$Date, data$Time, sep=" ")
newCol <- strptime(newTime, format="%d/%m/%Y %H:%M:%S")
newPos <- as.POSIXlt(newCol)


png(filename="plot2.png", width=480, height=480)
plot(newPos, data$GAP, main="", 
                xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
