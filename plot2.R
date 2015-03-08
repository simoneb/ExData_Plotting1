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

png(filename = "plot2.png", width = 480, height = 480)

Sys.setlocale("LC_ALL", "English")

with(my.plot.data, 
     plot(datetime, Global_active_power, 
          xlab = "",
          ylab = "Global Active Power (kilowatts)",
          type = "l"))

dev.off()