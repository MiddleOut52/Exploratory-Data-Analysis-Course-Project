setwd("/Users/NickRamsey/Documents/DataScience/Exploratory Data Analysis Course Project")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

data <- data %>%
        mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

data <- data %>% 
        subset(Date >= "2007-02-01" & Date <= "2007-02-02")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S") 

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
