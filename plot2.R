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
df <- mutate(df, weekday = weekdays(dmy(df$Date)))
df <-mutate(df, datetime = dmy_hms(paste(Date, Time)))
png(file ="plot2.png", width=480, height = 480)
plot(df$datetime,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()