setwd("C:/Users/harric17/Desktop/R Stuff/coursera/expl/proj1")

x1 = read.table("household_power_consumption.txt", header=F,nrow=500000,sep=";")
x1$V1=as.Date(x1$V1, format = "%d/%m/%Y")
x1=x1[x1$V1==" 2007-02-01"|x1$V1==" 2007-02-02",]


mynames = read.table("household_power_consumption.txt", header=T,nrow=1,sep=";")
mynames=names(mynames)
names(x1)=mynames
x1$Global_active_power=as.numeric(x1$Global_active_power)
x1$Global_active_power=x1$Global_active_power/1000

x1$mydatetime=paste(as.character(x1$Date),as.character(x1$Time))
x1$mydatetime=x1$mydatetime
x1$mydatetime=strptime(x1$mydatetime, "%Y-%m-%d %H:%M:%S")

x1$Sub_metering_1=as.numeric(x1$Sub_metering_1)
x1$Sub_metering_2=as.numeric(x1$Sub_metering_2)
x1$Sub_metering_3=as.numeric(x1$Sub_metering_3)

png(filename = "plot3.png")
plot(x=x1$mydatetime,y=x1$Sub_metering_1,type="l",xlab="",ylab="Energy by sub metering",ylim = c(0, max(x1$Sub_metering_1, x1$Sub_metering_2,x1$Sub_metering_3,na.rm=T)))
lines(x=x1$mydatetime,y=x1$Sub_metering_2, type = "l", col = "red")
lines(x=x1$mydatetime,y=x1$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))
dev.off()


