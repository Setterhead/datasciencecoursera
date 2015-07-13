## file household_power_consumption.txt must be in your working directory 
Sys.setlocale("LC_TIME", "English")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./exdata_data_household_power_consumption.zip", method = "curl")
unzip("./exdata_data_household_power_consumption.zip", exdir = ".")
hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc2 <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
hist(hpc2$Global_active_power, main="Global Active Power",ylab="Frequency", xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
