# Source shared function to retrieve source file and return subset of data.
source("download_subset_data.R")

plot3 <- function() {
        
        # Read in data set.
        data <- download_subset_data()
        
        # Open PNG device for plot.
        png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
        
        with(data, plot(Sub_metering_1 ~ DateTime, type="n", ylab="Energy sub metering", xlab=""))
        with(data, points(Sub_metering_1 ~ DateTime, type="l", col="black"))
        with(data, points(Sub_metering_2 ~ DateTime, type="l", col="red"))
        with(data, points(Sub_metering_3 ~ DateTime, type="l", col="blue"))
        
        legend("topright",lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
        
        # Close device.
        dev.off()        
}