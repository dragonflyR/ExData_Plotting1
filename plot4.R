download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpcdata.zip")
unzip("hpcdata.zip")
hpchead <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", nrows=1)
hpc <- read.table("household_power_consumption.txt", header=FALSE, sep=";", stringsAsFactors=FALSE, na.strings="?", skip = 66637, nrows=2880)
names(hpc) <- hpchead

DateTime <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S", tz = "EST5EDT")
hpc <- cbind(DateTime, hpc[,3:9])
names(hpc)[1] <- "datetime"

png("plot4.png")
par(mfrow=c(2,2))
with(hpc, {
      plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
      plot(datetime, Voltage, type="l")
      plot(datetime, Sub_metering_1, type="l", col = "black", xlab="", ylab="Energy sub metering")
      lines(datetime, Sub_metering_2, type="l", col = "red")
      lines(datetime, Sub_metering_3, type="l", col = "blue")
      legend("topright", bty = "n", lty = c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(datetime, Global_reactive_power, type="l")}
)
dev.off()