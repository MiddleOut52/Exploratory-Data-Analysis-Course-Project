setwd("/Users/NickRamsey/Documents/DataScience/Exploratory Data Analysis Course Project")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data <- data %>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

data <- data %>% 
        subset(Date >= "2007-02-01" & Date <= "2007-02-02")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

par(mfrow = c(2,2))

plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$Voltage ~ data$datetime, type = "l")

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.5)

plot(data$Global_reactive_power ~ data$datetime, type = "l")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
