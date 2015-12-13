data=read.delim("C:\\Users\\lfrederick\\Desktop\\Coursera\\Exploratory Data Analysis\\Week 1\\Course Project 1\\Data\\household_power_consumption.txt",header=TRUE,sep=";")
data=filter(data,Date%in%c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data$Sub_metering_1=as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2=as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3=as.numeric(as.character(data$Sub_metering_3))


plot(data$DateTime,data$Sub_metering_1,type='l',ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),col=c("black","red","blue"),lty=c(1,1,1))

dev.copy(png,file="C:\\Users\\lfrederick\\Documents\\GitHub\\ExData_Plotting1\\plot3.png")
dev.off()
