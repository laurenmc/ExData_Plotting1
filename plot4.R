# Source shared function to retrieve source file and return subset of data.
source("download_subset_data.R")

plot4 <- function() {
        
        # Read in data set.
        data <- download_subset_data()
        
        # Open PNG device for plot.
        png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
        
        # Two columns and two rows.
        par(mfrow=c(2,2))
        
        # Graph 1.
        with(data, plot(Global_active_power ~ DateTime, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))
        
        # Graph 2.
        with(data, plot(Voltage ~ DateTime, type="l", ylab="Voltage", xlab="datetime"))
        
        # Graph 3.
        with(data, plot(Sub_metering_1 ~ DateTime, type="n", ylab="Energy sub metering", xlab=""))
        with(data, points(Sub_metering_1 ~ DateTime, type="l", col="black"))
        with(data, points(Sub_metering_2 ~ DateTime, type="l", col="red"))
        with(data, points(Sub_metering_3 ~ DateTime, type="l", col="blue"))
        
        legend("topright",lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
        
        # Graph 4.
        with(data, plot(Global_reactive_power ~ DateTime, type="l"))
        
        # Close device.
        dev.off()
        
}