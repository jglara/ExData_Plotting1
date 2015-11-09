url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile= "./house_hold_power.zip", method = "curl")
unzip("./house_hold_power.zip")
power_data <- read.csv(file="./household_power_consumption.txt", sep=";", na.strings ="?")

filtered_power_data <- power_data [power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]

#plot4
par(mfrow = c(2,2))
with(filtered_power_data, {
  plot(filtered_power_data$Global_active_power, type="l", main="", ylab = "Global Active Power (kilowats)", xlab="", axes= FALSE)
  axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
  axis(2, at=c(0,2,4,6))
  box()
  plot(Voltage, type="l", ylab="Voltage", xlab="datetime", axes= FALSE)
  axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
  axis(2, at=c(234,238,242,246))
  box()
})

with(filtered_power_data, {
  plot(filtered_power_data$Sub_metering_1, col="black", type="l", main="", ylab = "Energy sub metering", xlab="", axes= FALSE)
  lines(filtered_power_data$Sub_metering_2, col="red", type="l")
  lines(filtered_power_data$Sub_metering_3, col="blue", type="l")
  legend("topright", pch = "_", col = c("blue","red","black"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
  axis(2, at=c(0,10,20,30))
  box()
  
  plot(Global_reactive_power, type="l", ylab="Global reactive Power", xlab="datetime", axes= FALSE)
  axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
  axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))
  box()
  
  
})

dev.copy(png, file="plot4.png")
dev.off()