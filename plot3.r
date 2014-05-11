fileName <- "household_power_consumption.txt"
data <- read.table(fileName, sep=";", nrows=2880, skip=66637, col.names=
                     c("Date", "Time", "GAP", "GRP", "V", "GI", "Sub_Metering_1", 
                       "Sub_Metering_2", "Sub_Metering_3"))

data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

newTime <- paste(data$Date, data$Time, sep=" ")
newCol <- strptime(newTime, format="%d/%m/%Y %H:%M:%S")
newPos <- as.POSIXlt(newCol)
  
xrange <- c(head(newPos,1), tail(newPos,1))
xrange <- as.numeric(xrange)
yrange <- c(0, max(data$Sub_Metering_1))

png(filename="plot3.png", width=480, height=480)
plot(newPos, data$Sub_Metering_1, main="", xlim=xrange, ylim=yrange,
                xlab="", ylab="Energy sub metering", type="l")
par(new=T)
plot(newPos, data$Sub_Metering_2, main="", xlim=xrange, ylim=yrange,
                xlab="", ylab="Energy sub metering", type="l", col="red")
par(new=T)
plot(newPos, data$Sub_Metering_3, main="", xlim=xrange, ylim=yrange,
                xlab="", ylab="Energy sub metering", type="l", col="blue")
par(new=T)
legend("topright", col=c("black", "blue", "red"), cex=1, lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(new=F)
dev.off()


