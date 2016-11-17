#plot2 script


#Set Working Directory
setwd("F:/Learning/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/Proj")

#Read in Data
energy <- read.table('household_power_consumption.txt', sep = ";", dec = '.',
                     header = TRUE)

energy_sub <-energy[energy$Date %in% c('1/2/2007', '2/2/2007'),]

energy_sub$Global_active_power <-as.numeric(as.character(energy_sub$Global_active_power))

energy_sub$datetime <- strptime(paste(energy_sub$Date, energy_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create Plot2

png("plot2.png", width=480, height=480)

plot(energy_sub$datetime, energy_sub$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()