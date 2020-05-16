#Creating the table
table <- read.table(file= "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

#changing the class of date
table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

#taking the data of only 2 days of february
data <- subset(table, Date == "2007-02-01" | Date == "2007-02-02" )

#creating a column called Temp and adding the date and time in it
#Also formatting Temp
data$Temp <- as.POSIXct(paste(data$Date, data$Time))
data$Temp <- strptime(data$Temp, format = "%Y-%m-%d %H:%M:%S")

#Creating the PNG file called plot3 and plotting the data in it
png(filename= "plot3.png", width = 480, height = 480)
with(data, plot(Temp, Sub_metering_1, type = "l", xlab = "", ylab="Energy Sub metering", col = "black"))
with(data, lines(Temp, Sub_metering_2, col = "red"))
with(data, lines(Temp, Sub_metering_3, col = "blue"))
legend("topright", lwd = 2, col= c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()