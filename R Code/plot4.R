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


#4th plot
png(filename = "plot4.png",width = 480, height = 480, units="px")
par(mfrow = c(2, 2),ps = 16, cex = 0.5)

plot(pow_cons_sub$Time,pow_cons_sub$Global_active_power,type = "l",xlab=" ",ylab = "Global Active Power")

plot(pow_cons_sub$Time,pow_cons_sub$Voltage,type = "l",xlab="datetime",ylab = "Voltage")

plot(pow_cons_sub$Time,pow_cons_sub$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(pow_cons_sub$Time,pow_cons_sub$Sub_metering_2,type="l",col="red")
lines(pow_cons_sub$Time,pow_cons_sub$Sub_metering_3,type="l",col="blue")
legend("topright",bty = "n", pch = "_", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(pow_cons_sub$Time,pow_cons_sub$Global_reactive_power,type = "l",xlab=" ",ylab = "Global Rective Power")

dev.off()