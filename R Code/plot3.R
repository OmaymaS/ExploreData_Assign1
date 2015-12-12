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

#3rd plot
png(filename = "plot3.png",width = 480, height = 480, units="px")
par(ps = 24, cex = 0.5, cex.main = 1)
plot(pow_cons_sub$Time,pow_cons_sub$Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering")
lines(pow_cons_sub$Time,pow_cons_sub$Sub_metering_2,type="l",col="red")
lines(pow_cons_sub$Time,pow_cons_sub$Sub_metering_3,type="l",col="blue")
legend("topright", pch = "_", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()