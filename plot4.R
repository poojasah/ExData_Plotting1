##Read the file
householdData <- read.csv("./household_power_consumption.txt", sep = ";", 
                          na.strings="?", stringsAsFactors = FALSE)
##Convert the Date variable from char to Date class
householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

#Subset the Data
subHouseholdData <- subset(householdData, 
                           householdData$Date="2007-02-01" & householdData$Date="2007-02-02")

#convert into time class
datetime <- paste(subHouseholdData$Date, subHouseholdData$Time)
subHouseholdData$datetime <- strptime(datetime, format = "%Y-%m-%d %H:%M:%S")

##Open the file device
png(file="plot3.png")

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subHouseholdData, {
        plot(subHouseholdData$datetime, subHouseholdData$Global_active_power, type = "l", ylab= "Global Active Power", xlab="")
        plot(subHouseholdData$datetime, subHouseholdData$Voltage , type="l", ylab="Voltage", xlab = "datetime")
        plot(subHouseholdData$datetime, subHouseholdData$Sub_metering_1, type="l",
             ylab="Energy Sub Metering", xlab="")
        lines(subHouseholdData$datetime, subHouseholdData$Sub_metering_2, col='Red')
        lines(subHouseholdData$datetime, subHouseholdData$Sub_metering_3, col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(subHouseholdData$datetime, subHouseholdData$Global_reactive_power, type = "l", ylab= "Global Reactive Power", xlab="")
})

##Closes the file device
dev.off()
