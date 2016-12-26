##SET YOUR OWN WORKING DIRECTORY WITH THE DATAFILE IN THERE 
rawdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dates<-strptime(rawdata$Date, "%d/%m/%Y")

subsetted_data<-rawdata[dates %in%strptime(c("01/02/2007","02/02/2007"),"%d/%m/%Y") ,]

SetTime <-strptime(paste(subsetted_data$Date, subsetted_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

subsetted_data <- cbind(SetTime, subsetted_data)

#plot2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(subsetted_data$SetTime, subsetted_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
