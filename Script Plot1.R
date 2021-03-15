library(dplyr)

##Reading and filtering data
Data <- read.csv('./ExData_Plotting1/household_power_consumption.txt', sep = ';')
mdata <- filter(Data, Date == "1/2/2007"| Date == "2/2/2007")
rm(Data)

##Converting columns to date and numeric type
mdata$Date <- as.Date(mdata$Date, "%d/%m/%Y")
mdata[,3:9] <- sapply(mdata[,3:9], as.numeric)

#Opening graphic device and saving plot 
png(file = "plot1.png")
hist(mdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()