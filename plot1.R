setwd("~/Desktop/BigDataAnalytics/ExData_Plotting1")
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

#plot1
hist(subsetted_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")