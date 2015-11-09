url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile= "./house_hold_power.zip", method = "curl")
unzip("./house_hold_power.zip")
power_data <- read.csv(file="./household_power_consumption.txt", sep=";", na.strings ="?")

filtered_power_data <- power_data [power_data$Date == "1/2/2007" | power_data$Date == "2/2/2007",]

#plot 2
plot(filtered_power_data$Global_active_power, type="l", main="", ylab = "Global Active Power (kilowats)", xlab="", axes= FALSE)
axis(1, at=c(1,1440,2880), lab=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,2,4,6))
box()


dev.copy(png, file="plot2.png")
dev.off()