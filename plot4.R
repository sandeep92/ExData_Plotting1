source("name.R")  #prepares data to load

doPlot4 <- function() {  #function to open and plot on Portable network graphic(png) device
    tbl <- nameareData()
	fit1 <- lm(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
	fit2 <- lm(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
	fit3 <- lm(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
	fit4 <- lm(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")   
    png(filename = "plot4.png", width = 480, height = 480, units = "px")  #opens png device
    
    par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    with(tbl, {
        plot(fit1)  #plot on png device
        plot(fit2)  #plot on png device
        
        cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        plot(fit3)  #plot on png device
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")  #Adding simple legend to plot
        
        plot(fit4)  #plot on png device
    })    
    dev.off()  #closes device
}

doPlot4()