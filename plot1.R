# Source shared function to retrieve source file and return subset of data.
source("download_subset_data.R")

plot1 <- function() {
        
        # Read in data set.
        data <- download_subset_data()
        
        # Open PNG device for plot.
        png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
        
        # Create Global Active Power plot.
        with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
        
        # Close device.
        dev.off()       
}