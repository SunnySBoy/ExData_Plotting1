# use package sqldf for reading specific parts of the data
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",
                    sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',
                    sep = ";")

# concatenate columns 'Date' and 'Time'
x <- paste(data$Date,data$Time)

# convert x to time format
x <- strptime(x, format = "%d/%m/%Y %T")

# open device for png output
png(filename="plot4.png")

# set number of columns and rows to two (four plots)
par(mfcol=c(2,2))

# create the four plots of 'Plot 4'
with(data,{
     # plot 4.1
     plot(x, data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
     
     # plot 4.2
     plot(x,data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
     with(data,lines(x,data$Sub_metering_2,col="red"))
     with(data,lines(x,data$Sub_metering_3,col="blue"))
     # create legend for plot 4.2
     legend("topright",
            col = c("black", "blue", "red"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty=c(1,1),
            lwd=c(2.5,2.5),
            box.lty = 0,
            bg="transparent")
     
     # plot 4.3
     plot(x,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
     
     # plot 4.4
     plot(x,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
})

# close previously opened device
dev.off()