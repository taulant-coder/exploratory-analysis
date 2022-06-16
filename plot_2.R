## Developing Plot 2

#Loading libraries

library(dplyr)

library(ggplot2)

library(lubridate)

#Configuring the path of the txt file, it is modified according to convenience
setwd("C:/Users/usuario/Data_Science/r_prog/Curso4_Analisis_Exploratorio")

data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = rep("character",9))

# Format variable date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# We filter by date range 2 day
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# We generate a variable day and time
data$day_hour <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "),
                                     format = "%Y-%m-%d %H:%M:%S"))

# Convert column that we will use to correct class
data$Global_active_power <- as.numeric(data$Global_active_power)

# We generate the graph and save it in png format
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(data,plot(day_hour,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.off()  # Close the png file