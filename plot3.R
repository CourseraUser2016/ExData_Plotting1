setwd("~/Desktop/ExploratoryDataAnalysis/ExData_Plotting1")
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"
##
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile, method = "curl")
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}

rawdata<-read.table(householdFile, header = TRUE, sep = ";", na.strings = "?")
dates<-strptime(rawdata$Date, "%d/%m/%Y")

subsetted_data<-rawdata[dates %in%strptime(c("01/02/2007","02/02/2007"),"%d/%m/%Y") ,]

SetTime <-strptime(paste(subsetted_data$Date, subsetted_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

subsetted_data <- cbind(SetTime, subsetted_data)

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(subsetted_data$SetTime, subsetted_data$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(subsetted_data$SetTime, subsetted_data$Sub_metering_2, col=columnlines[2])
lines(subsetted_data$SetTime, subsetted_data$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")