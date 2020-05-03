getwd()
setwd("./exdata_data_household_power_consumption") # Setting the directory
dataFile <- "household_power_consumption.txt" # reading the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #make data in tidy format
str(data)
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),] # taking condtion of the data
str(subdata)


############# Plotting the graph #####################

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower<-as.numeric(subdata$Global_active_power)
submetering.1<-as.numeric(subdata$Sub_metering_1)
submetering.2<-as.numeric(subdata$Sub_metering_2)
submetering.3<-as.numeric(subdata$Sub_metering_3)
voltage<-as.numeric(subdata$Voltage)
globalreactivepower<-as.numeric(subdata$Global_reactive_power)
#par(mfrow=c(2,2))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power")
plot(datetime,voltage,type = "l",ylab = "Voltage")
plot(datetime,submetering.1,type="l",ylab = "Energy Submetering",xlab = "")
lines(datetime,submetering.2,type = "l",col="Red")
lines(datetime,submetering.3,type = "l",col="Blue")
plot(datetime,globalreactivepower,type = "l",ylab = "Global Reactive Power")
dev.off()





