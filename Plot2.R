setwd("/Users/NickRamsey/Documents/DataScience/Exploratory Data Analysis Course Project")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data <- data %>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

data <- data %>% 
        subset(Date >= "2007-02-01" & Date <= "2007-02-02")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()




