url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile= "./house_hold_power.zip", method = "curl")
unzip("./house_hold_power.zip")
power_data <- read.csv(file="./household_power_consumption.txt", sep=";", na.strings ="?")

filtered_power_data <- power_data [power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]

#plot3

plot(filtered_power_data$Sub_metering_1, col="black", type="l", main="", ylab = "Energy sub metering", xlab="", axes= FALSE)
lines(filtered_power_data$Sub_metering_2, col="red", type="l")
lines(filtered_power_data$Sub_metering_3, col="blue", type="l")
legend("topright", pch = "_", col = c("blue","red","black"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,10,20,30))
box()

dev.copy(png, file="plot3.png")
dev.off()