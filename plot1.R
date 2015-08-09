# use package sqldf for reading specific parts of the data
library(sqldf)
data <- read.csv.sql("household_power_consumption.txt",
                    sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',
                    sep = ";")

# open device for png output
png(filename="plot1.png")

# creating 'Plot 1'
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close previously opened device
dev.off()