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

png(filename = "plot1.png", 
    width = 480, 
    height = 480,
    bg = "transparent")

with(my.plot.data, 
     hist(Global_active_power, 
          col = "red",
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)"))

dev.off()
