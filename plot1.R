setwd("C:/Users/harric17/Desktop/R Stuff/coursera/expl/proj1")

x1 = read.table("household_power_consumption.txt", header=F,nrow=500000,sep=";")
x1$V1=as.Date(x1$V1, format = "%d/%m/%Y")
x1=x1[x1$V1==" 2007-02-01"|x1$V1==" 2007-02-02",]


mynames = read.table("household_power_consumption.txt", header=T,nrow=1,sep=";")
mynames=names(mynames)
names(x1)=mynames
x1$Global_active_power=as.numeric(x1$Global_active_power)

png(filename = "plot1.png")
hist(x1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
# axis(side=1, at=c(0:6, by=2))
# axis(side=2)
dev.off()



