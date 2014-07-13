source("name.R")   #prepares data to load

doPlot3 <- function() {  #function to open and plot on Portable network graphic(png) device
    tbl <- nameareData()
	fit <- lm(tbl$DateTime, tbl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    png(filename = "plot3.png", width = 480, height = 480, units = "px")  #opens png device
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(fit)  #plot on png device
    lines(tbl$DateTime, tbl$Sub_metering_2, type="l", col="red")
    lines(tbl$DateTime, tbl$Sub_metering_3, type="l", col="blue")
    legend("topleft", lty=1, lwd=1, col=c("red","green","blue"), legend=cols) #Adding simple legend to plot
    dev.off()  #closes device
}

doPlot3() #function call