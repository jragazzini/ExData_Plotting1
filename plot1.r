fileName <- "household_power_consumption.txt"
data <- read.table(fileName, sep=";", nrows=2880, skip=66637, col.names=
                     c("Date", "Time", "GAP", "GRP", "V", "GI", "Sub1", 
                       "Sub2", "Sub3"))

png(filename="plot1.png", width=480, height=480)
hist(data$GAP, col = "red", main="Global Active Power", 
                xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
     
