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
png("plot3.png", width=480, height=480)
plot(datetime,submetering.1,type="l",ylab = "Energy Submetering",xlab = "")
lines(datetime,submetering.2,type = "l",col="Red")
lines(datetime,submetering.3,type = "l",col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()











