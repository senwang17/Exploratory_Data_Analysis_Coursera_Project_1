#data reading and subsetting
data<-read.table("./data/household_power_consumption.txt", header = T,sep = ";",stringsAsFactors = F)
subdata<-data[data$Date %in% c("1/2/2007",  "2/2/2007"),]
GAP<-as.numeric(subdata$Global_active_power)
#plotting
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()