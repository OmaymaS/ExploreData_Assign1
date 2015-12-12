library(lubridate)

#read data
pow_cons_raw<-as.data.frame (read.table("household_power_consumption.txt",sep = ";",header = T,na.strings = "?"))

#subset the data based on the given date
start_date="1/2/2007"
end_date="2/2/2007"
pow_cons_sub<-subset(pow_cons_raw,(Date==start_date | Date==end_date))
#convert date and time 
pow_cons_sub$Date=as.Date(pow_cons_sub$Date,"%d/%m/%Y")
pow_cons_sub$Time=ymd_hms(paste(pow_cons_sub$Date,pow_cons_sub$Time))

#1st plot
png(filename = "plot1.png",width = 480, height = 480, units="px")
hist((pow_cons_sub$Global_active_power),main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col="red")

dev.off()
