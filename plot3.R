##Plot3

#load and read data
data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Create new column with date+time
data$Time2 <- paste(data$Date,data$Time)
data$Time2 <- strptime(data$Time2,"%d/%m/%Y %H:%M:%S")

#Set format Date column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset date between 01/02/2007 and 02/02/2007
y <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <=as.Date("02/02/2007","%d/%m/%Y"),]

#Plot
plot(y$Time2,y$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(y$Time2,y$Sub_metering_1)
lines(y$Time2,y$Sub_metering_2,col="red")
lines(y$Time2,y$Sub_metering_3,col="blue")
legend("topright",y.intersp = 0.5,x.intersp=0.3,xjust=1,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Export
dev.copy(png,file="D:/Data Science Coursera/Course4/plot3.png",width=480, height=480)
dev.off()
