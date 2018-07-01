##Plot4

#load and read data
data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")

#Create new column with date+time
data$Time2 <- paste(data$Date,data$Time)
data$Time2 <- strptime(data$Time2,"%d/%m/%Y %H:%M:%S")

#Set format Date column
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset date between 01/02/2007 and 02/02/2007
y <- data[data$Date >= as.Date("01/02/2007","%d/%m/%Y") & data$Date <=as.Date("02/02/2007","%d/%m/%Y"),]

#Plot and export
png(file="D:/Data Science Coursera/Course4/plot4.png",width=480, height=480)

par(mfrow=c(2,2))
par(mar=c(4,4,2,1))

plot(y$Time2,y$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(y$Time2,y$Global_active_power)
plot(y$Time2,y$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(y$Time2,y$Voltage)
plot(y$Time2,y$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(y$Time2,y$Sub_metering_1)
lines(y$Time2,y$Sub_metering_2,col="red")
lines(y$Time2,y$Sub_metering_3,col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y$Time2,y$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(y$Time2,y$Global_reactive_power,lwd=0.1)

dev.off()
