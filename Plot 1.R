 # Getting full dataset
 # set working directory where the data file was saved
 fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
 fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")
 
 ## Subsetting the data
 subsetdata <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
 # remove the file 
 rm(fulldata)
 
 ## Convert dates
 datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
 subsetdata$Datetime <- as.POSIXct(datetime)
 
 ## Plot 1
 hist(subsetdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
 
 ## Saving to file
 dev.copy(png, file="plot1.png", height=480, width=480)
 dev.off()