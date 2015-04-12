# Source shared function to retrieve source file and return subset of data.
source("download_subset_data.R")

plot2 <- function() {
        
        # Read in data set.
        data <- download_subset_data()
        
        # Open PNG device for plot.
        png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
        
        # Create Global Active Power plot.
        with(data, plot(Global_active_power ~ DateTime, type="l", ylab = "Global Active Power (kilowatts)"))
        
        # Close device.
        dev.off()
}