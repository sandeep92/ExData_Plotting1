source("name.R") #prepares data to load

doPlot1 <- function() { #function to open and plot on png device
    tbl <- nameareData()
	fit <- rnorm(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") #variable used for histogram with curve
    png(filename = "plot1.png", width = 480, height = 480, units = "px")  #opens Portable network graphic(png) device
    hist(fit)  #plots on png device
    dev.off()   #closes device
}   #end of function

doPlot1()  #function call