dataFile <- "./household_power_consumption.txt"      ###reading the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]    ##Extracting the data as required


globalActivePower <- as.numeric(data$Global_active_power)   ##Converting to numeric
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  ##merging date and time
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")   ##Creating Plot
dev.off()

