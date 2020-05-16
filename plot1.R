#Creating the table and naming it data
table <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

#Converting the data in thier respective classes
table$Date <- as.Date(table$Date, format = "%d/%m/%Y")
table$time <- strptime(table$Time, format = "%H:%M:%S")
table$Global_active_power <- as.numeric(table$Global_active_power)
table$Global_reactive_power<- as.numeric(table$Global_reactive_power)
table$Voltage<- as.numeric(table$Voltage)
table$Global_intensity<- as.numeric(table$Global_intensity)
table$Sub_metering_1<- as.numeric(table$Sub_metering_1)
table$Sub_metering_2<- as.numeric(table$Sub_metering_2)
table$Sub_metering_3<- as.numeric(table$Sub_metering_3)

#Taking subset of 2 days only
subdata <- subset(table, Date =="2007-02-01" | Date == "2007-02-02")

#creating and saving the histogram as plot1.png
png(filename = "plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

