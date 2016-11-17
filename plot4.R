#plot4 script

#Set Working Directory
setwd("F:/Learning/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/Proj")

#Read in Data
energy <- read.table('household_power_consumption.txt', sep = ";", dec = '.',
                     header = TRUE)

energy_sub <-energy[energy$Date %in% c('1/2/2007', '2/2/2007'),]

energy_sub$Global_active_power <-as.numeric(as.character(energy_sub$Global_active_power))

energy_sub$datetime <- strptime(paste(energy_sub$Date, energy_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

energy_sub$Sub_metering_1 <- as.numeric(as.character(energy_sub$Sub_metering_1))

energy_sub$Sub_metering_2 <- as.numeric(as.character(energy_sub$Sub_metering_2))

energy_sub$Sub_metering_3 <- as.numeric(as.character(energy_sub$Sub_metering_3))

energy_sub$Voltage <- as.numeric(as.character(energy_sub$Voltage))

energy_sub$Global_reactive_power <- as.numeric(as.character(energy_sub$Global_reactive_power))

#Create Plot4

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#1st Plot
plot(energy_sub$datetime, energy_sub$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")


#2nd Plot
plot(energy_sub$datetime, energy_sub$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")


#3rd Plot

plot(energy_sub$datetime, energy_sub$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub Metering")
lines(energy_sub$datetime, energy_sub$Sub_metering_2,
      type = 'l', col = 'red')
lines(energy_sub$datetime, energy_sub$Sub_metering_3,
      type = 'l', col = 'blue')
legend('topright',  lty = 'solid', col = c('black','red','blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


#4th Plot

plot(energy_sub$datetime, energy_sub$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()