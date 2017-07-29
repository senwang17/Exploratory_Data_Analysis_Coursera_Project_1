#data reading and subsetting
data<-read.table("./data/household_power_consumption.txt", header = T,sep = ";",stringsAsFactors = F)
subdata<-data[data$Date %in% c("1/2/2007",  "2/2/2007"),]
GAP<-as.numeric(subdata$Global_active_power)
#date and time treatment
datetime <- strptime(paste0(subdata$Date, subdata$Time), "%d/%m/%Y%H:%M:%S") 
#plotting
png("plot2.png", width=480, height=480)
plot(datetime, GAP, xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()