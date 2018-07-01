##Plot2

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
plot(y$Time2,y$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(y$Time2,y$Global_active_power)

#Export
dev.copy(png,file="D:/Data Science Coursera/Course4/plot2.png",width=480, height=480)
dev.off()
