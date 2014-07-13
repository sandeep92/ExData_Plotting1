source("name.R")  #prepares data to load

doPlot2 <- function() { #function to open and plot on Portable network graphic(png) device
    tbl <- nameareData()
	fit <- lm(tbl$DateTime, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") #variable used to plot
    png(filename = "plot2.png", width = 480, height = 480, units = "px")  #opens png device
    plot(fit)  #plot on png device
    dev.off() #closes device
}   #end of function

doPlot2()  #function call