data=read.delim("C:\\Users\\lfrederick\\Desktop\\Coursera\\Exploratory Data Analysis\\Week 1\\Course Project 1\\Data\\household_power_consumption.txt",header=TRUE,sep=";")
data=filter(data,Date%in%c("1/2/2007","2/2/2007"))

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

data$Global_active_power=as.numeric(as.character(data$Global_active_power))

with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.copy(png,file="C:\\Users\\lfrederick\\Documents\\GitHub\\ExData_Plotting1\\plot1.png")
dev.off()
