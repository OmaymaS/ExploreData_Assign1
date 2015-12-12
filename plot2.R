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

#2nd plot
png(filename = "plot2.png",width = 480, height = 480, units="px")
plot(pow_cons_sub$Time,as.numeric(pow_cons_sub$Global_active_power),type = "l",xlab=" ",ylab = "Global Active Power (kilowatts)")

dev.off()