hpc<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
data<-hpc[hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02",]
data$DateTime<-strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


png("plot3.png")
ylimit<-range(c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
plot(data$DateTime, as.numeric(as.character(data$Sub_metering_1)), type="l",xlab="",ylab="Energy sub metering", ylim=ylimit,yaxt="n")
par(new=TRUE)
plot(data$DateTime, as.numeric(as.character(data$Sub_metering_2)), type="l",xlab="",ylab="", ylim=ylimit,axes=FALSE,col="red")
par(new=TRUE)
plot(data$DateTime, as.numeric(as.character(data$Sub_metering_3)), type="l",xlab="",ylab="", ylim=ylimit,axes=FALSE,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=NA,col=c("black","red","blue"),lwd=1)
axis(side=2, at=c(10,20,30))
dev.off()