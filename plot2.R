hpc<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
data<-hpc[hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02",]
data$DateTime<-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


png("plot2.png")
plot(data$DateTime, as.numeric(as.character(data$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()