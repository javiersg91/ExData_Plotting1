library(dplyr)
library(tidyr)

##Reading and filtering data
Data <- read.csv('./ExData_Plotting1/household_power_consumption.txt', sep = ';')
mdata <- filter(Data, Date == "1/2/2007"| Date == "2/2/2007")
rm(Data)

##Converting columns to numeric and merging Date & Time to POSIXlt type
mdata$Date <- as.Date(mdata$Date, "%d/%m/%Y")
jdata <- unite(mdata, DyT, c(Date, Time), remove = TRUE)
jdata$DyT <- strptime(jdata$DyT, "%Y-%m-%d_%H:%M:%S" )
jdata[,2:7] <- sapply(jdata[,2:7], as.numeric)

#Opening graphic device and saving constructed plot
png(file = "plot3.png")
with(jdata, (plot(DyT, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")))
with(jdata, lines(DyT, Sub_metering_2, type = "l", col = "red"))
with(jdata, lines(DyT, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lwd = 3, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
