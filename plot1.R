#plot1 script

#Set Working Directory
setwd("F:/Learning/Coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/Proj")

#Read in Data
energy <- read.table('household_power_consumption.txt', sep = ";", dec = '.',
                     header = TRUE)

energy_sub <-energy[energy$Date %in% c('1/2/2007', '2/2/2007'),]

energy_sub$Global_active_power <-as.numeric(as.character(energy_sub$Global_active_power))


#Create Plot1

png("plot1.png", width=480, height=480)

hist(energy_sub$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')


dev.off()