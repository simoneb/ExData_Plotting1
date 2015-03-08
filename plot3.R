my.data <- read.table("data/household_power_consumption.txt", 
                      sep = ";", 
                      header = TRUE, 
                      na.strings = "?")

my.plot.data <- transform(my.data, 
                          Date = as.Date(Date, "%d/%m/%Y"),
                          datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

my.plot.data <- subset(my.plot.data, 
                       Date >= as.Date("2007-02-01") 
                       & Date <= as.Date("2007-02-02"))

png(filename = "plot3.png", 
    width = 480, 
    height = 480,
    bg = "transparent")

Sys.setlocale("LC_ALL", "English")

with(my.plot.data, {
  plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col = "red") 
  lines(datetime, Sub_metering_3, col = "blue")
})

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1,
       col = c("black", "red","blue")) 

dev.off()