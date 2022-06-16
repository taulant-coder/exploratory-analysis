# Developing Plot 1

#Loading librarier

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

# We convert the variable Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# We generate the graph and save it in png format
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power,
     col = "red",
     main = "Active power per household in Kilowatt",
     xlab = "Average active power per minute",
     ylab = "Number of households")

dev.off()  # Close the png file device

