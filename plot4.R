##SET YOUR OWN WORKING DIRECTORY WITH THE DATAFILE IN THERE 

rawdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dates<-strptime(rawdata$Date, "%d/%m/%Y")

subsetted_data<-rawdata[dates %in%strptime(c("01/02/2007","02/02/2007"),"%d/%m/%Y") ,]

SetTime <-strptime(paste(subsetted_data$Date, subsetted_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

subsetted_data <- cbind(SetTime, subsetted_data)


png(filename = "plot4.png", width = 480, height = 480, units="px")

par(mfrow=c(2,2))

#plot1
hist(subsetted_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#plot2

plot(subsetted_data$SetTime,subsetted_data$Voltage, xlab="datetime", ylab = "Voltage", type = "l")

#plot3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(subsetted_data$SetTime, subsetted_data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(subsetted_data$SetTime, subsetted_data$Sub_metering_2, col=columnlines[2])
par(new=TRUE)
lines(subsetted_data$SetTime, subsetted_data$Sub_metering_3, col=columnlines[3])
par(new=TRUE)
legend("topright", legend=labels, col=columnlines, lty="solid", bty = "n")
#plot4
plot(subsetted_data$SetTime,subsetted_data$Global_reactive_power,xlab="datetime", ylab = "Global_reactive_power", type="l")
dev.off()
