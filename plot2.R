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
png(filename="plot2.png")

# creating 'Plot 2'
plot(x, data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

# close previously opened device
dev.off()