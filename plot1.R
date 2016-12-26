
##SET YOUR OWN WORKING DIRECTORY WITH THE DATAFILE IN THERE 
rawdata<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

dates<-strptime(rawdata$Date, "%d/%m/%Y")

subsetted_data<-rawdata[dates %in%strptime(c("01/02/2007","02/02/2007"),"%d/%m/%Y") ,]

#plot1

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(subsetted_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
