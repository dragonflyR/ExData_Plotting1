download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpcdata.zip")
unzip("hpcdata.zip")
hpchead <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", nrows=1)
hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", skip = 66637, nrows=2880)
names(hpc) <- hpchead

DateTime <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S", tz = "EST5EDT")
hpc <- cbind(DateTime, hpc[,3:9])
names(hpc)[1] <- "datetime"

png("plot2.png")
plot(hpc$datetime,hpc$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()