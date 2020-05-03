getwd()
setwd("./exdata_data_household_power_consumption") # Setting the directory
dataFile <- "household_power_consumption.txt" # reading the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") #make data in tidy format
str(data)
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),] # taking condtion of the data
str(subdata)


############# Plotting the graph #####################


globalactivepower<-as.numeric(subdata$Global_active_power)
png("plot1.png",width = 480,height = 480)
hist(globalactivepower,main = "Global Active Power",xlab = "Global Active Power (Kilowatts)",col = "Red")
dev.off()
