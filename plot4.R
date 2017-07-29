#data reading and subsetting
data<-read.table("./data/household_power_consumption.txt", header = T,sep = ";",stringsAsFactors = F)
subdata<-data[data$Date %in% c("1/2/2007",  "2/2/2007"),]
GAP<-as.numeric(subdata$Global_active_power)
submetering1<-as.numeric(subdata$Sub_metering_1)
submetering2<-as.numeric(subdata$Sub_metering_2)
submetering3<-subdata$Sub_metering_3
voltage<-as.numeric(subdata$Voltage)
GRP<-as.numeric(subdata$Global_reactive_power)
#date and time treatment
datetime <- strptime(paste0(subdata$Date, subdata$Time), "%d/%m/%Y%H:%M:%S") 
#plotting
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(datetime, GAP, xlab="", ylab="Global Active Power",type="l")
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5,col=c("black", "red", "blue"))
plot(datetime,voltage,xlab="datetime", ylab="Voltage",type="l")
plot(datetime,GRP,xlab="datetime", ylab="Global_reactive_power",type="l")
dev.off()