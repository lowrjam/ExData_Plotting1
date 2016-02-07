#Working with data file stored in "~/Exploratory Data Analysis/data"
#The file is called household_power_consumption.txt
#We will only be using data from the dates 2007-02-01 and 2007-02-02.

#from UNIX command line grep out the data required with these commands
#grep "Date" household_power_consumption.txt > inscope_data.txt
#grep "^1/2/2007" household_power_consumption.txt >> inscope_data.txt
#grep "^2/2/2007" household_power_consumption.txt >> inscope_data.txt

#Now read the inscope_data.txt file into a dataframe.  Note, each column is separated with a ";"
df <- read.table("./data/inscope_data.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE)
library(lubridate)
library(dplyr)
df <-mutate(df, datetime = dmy_hms(paste(Date, Time)))
leg <- c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
png(file ="plot3.png", width=480, height = 480)
with(df, {
    plot(df$datetime,df$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l" )
    lines(df$datetime,df$Sub_metering_2, col="red")
    lines(df$datetime,df$Sub_metering_3, col="blue")
    legend("topright", col = c("black", "red", "blue"), legend = leg,  lty=c(1,1))
})
dev.off()