## Developing Plot 4

#Loading libraries

library(dplyr)

library(ggplot2)

library(lubridate)

#Configuring the path of the txt file, it is modified according to convenience
setwd("C:/Users/usuario/Data_Science/r_prog/Curso4_Analisis_Exploratorio")

data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = rep("character",9))

# Format variable date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# We filter by date range
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
# Joining day and time to create a new posix date

data$day_hour <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "),
                                     format = "%Y-%m-%d %H:%M:%S"))

# We generate the graph and save it in png format
png(file = "plot4.png", width = 480, height = 480, units = "px")

## Setting 4 graphs
par(mfrow = c(2, 2))

## Graph 1
# Convert the column to a numeric variable
data$Global_active_power <- as.numeric(data$Global_active_power)

# We generate the graph and save it in png format
with(data,plot(day_hour,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))

## Graph 2
#Convert the column to a numeric variable
data$Voltage <- as.numeric(data$Voltage)

# We generate the graph and save it in png format
with(data,plot(day_hour,Voltage,type = "l",xlab = "datatime",ylab = "Voltage"))

## Graph 3
#We generate the graph and save it in png format
with(data,plot(day_hour,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering", col = "black"))
with(data,points(day_hour,Sub_metering_2,type = "l",xlab = "", col = 'red'))
with(data,points(day_hour,Sub_metering_3,type = "l",xlab = "", col = 'blue'))
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)

##Graph 4
#Convert the column to a numeric variable
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# Generating the graph
with(data,plot(day_hour,Global_reactive_power,type = "l",xlab = "datatime",ylab = "Global reactive power"))
dev.off()  # Close the png file

