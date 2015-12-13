data=read.delim("C:\\Users\\lfrederick\\Desktop\\Coursera\\Exploratory Data Analysis\\Week 1\\Course Project 1\\Data\\household_power_consumption.txt",header=TRUE,sep=";")
data=filter(data,Date%in%c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1=as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2=as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3=as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power=as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power=as.numeric(as.character(data$Global_reactive_power))
data$Voltage=as.numeric(as.character(data$Voltage))

par(mrow=c(2,2),mar=c(4,4,4,4))
plot(data$DateTime,data$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab="",cex.lab=0.6,cex.axis=0.6)
plot(data$DateTime,data$Voltage,type='l',ylab="Voltage",xlab="datetime",cex.lab=0.6,cex.axis=0.6)
plot(data$DateTime,data$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering",cex.lab=0.6,cex.axis=0.6)
  lines(data$DateTime,data$Sub_metering_2,col="red",type='l')
  lines(data$DateTime,data$Sub_metering_3,col="blue",type='l')
  legend('topright',c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black","red","blue"),lty=c(1,1,1),bty='n',cex=0.5)
plot(data$DateTime,data$Global_reactive_power,type='l',ylab="Global reactive Power",xlab="datetime",cex.lab=0.6,cex.axis=0.6)

dev.copy(png,file="C:\\Users\\lfrederick\\Documents\\GitHub\\ExData_Plotting1\\plot4.png")
dev.off()
