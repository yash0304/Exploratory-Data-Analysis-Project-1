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
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

