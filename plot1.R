##Read the file
householdData <- read.csv("./household_power_consumption.txt", sep = ";", 
                          na.strings="?", stringsAsFactors = FALSE)
##Convert the Date variable from char to Date class
householdData$Date <- as.Date(householdData$Date, format="%d/%m/%Y")

#Subset the Data
subHouseholdData <- subset(householdData, 
        householdData$Date="2007-02-01" & householdData$Date="2007-02-02")

##Open the file device
png(file="plot1.png")

## Plot 1
hist(subHouseholdData$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col= "Red")

##Closes the file device
dev.off()
