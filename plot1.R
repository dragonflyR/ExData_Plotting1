download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpcdata.zip")
unzip("hpcdata.zip")
hpchead <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", nrows=1)
hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", skip = 66637, nrows=2880)
names(hpc) <- hpchead

png("plot1.png")
hist(hpc$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()