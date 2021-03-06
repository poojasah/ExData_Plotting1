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
png(file="plot2.png")

## Plot 2
plot(subHouseholdData$datetime, subHouseholdData$Global_active_power, 
     type = "l", ylab= "Global Active Power (kilowatts)", xlab="")

##Closes the file device
dev.off()
