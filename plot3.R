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
png(filename="plot3.png")

# creating 'Plot 3'
# each of the following three steps plots one 'sub metering' line
with(data, plot(x,data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering"))
with(data,lines(x,data$Sub_metering_2,col="red"))
with(data,lines(x,data$Sub_metering_3,col="blue"))

# create legend
legend("topright", col = c("black", "blue", "red"), legend =
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1),
       lwd=c(2.5,2.5))

# close previously opened device
dev.off()