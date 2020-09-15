dataFile <- "./household_power_consumption.txt"      ###reading the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]    ##Extracting the data as required


globalActivePower <- as.numeric(data$Global_active_power)   ##Converting to numeric
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power",   ##Creating histogram
     xlab="Global Active Power (kilowatts)")
dev.off()

