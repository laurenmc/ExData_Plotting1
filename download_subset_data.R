download_subset_data <- function(){
        
        # Download input file.
        #download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
        
        # Unzip file.
        #unzip("household_power_consumption.zip")
        
        data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=F)
        
        # Create a new column including both date and time
        data <- mutate(data, DateTime = as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))
        
        # Convert the date string to date class
        data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))
        
        # Before performing any additional processing, only extract those observations between the specified date range.
        data <- subset(data, Date >= as.Date("1/2/2007", "%d/%m/%Y") & Date <= as.Date("2/2/2007", "%d/%m/%Y"))
        
        # Convert the time string to time class
        data <- mutate(data, Time = as.POSIXct(strptime(data$Time, format = "%H:%M:%S")))
        
        return(data)
}