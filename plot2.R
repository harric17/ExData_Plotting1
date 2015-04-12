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



png(filename = "plot2.png")
plot(x=x1$mydatetime,y=x1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()




