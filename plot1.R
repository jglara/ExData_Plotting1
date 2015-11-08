url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile= "./house_hold_power.zip", method = "curl")
unzip("./house_hold_power.zip")
power_data <- read.csv(file="./household_power_consumption.txt", sep=";", na.strings ="?")

filtered_power_data <- power_data [as.Date(power_data$Date, "%d/%m/%Y") >= "2007-02-01" &  as.Date(power_data$Date, "%d/%m/%Y") <= "2007-02-02",]

#plot 1
hist(filtered_power_data$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowats)", ylab = "Frequency")

dev.copy(png, file="plot1.png")
dev.off()