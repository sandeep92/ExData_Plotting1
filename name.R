dnldfile <- function(fileURL, fname)
 {
    if(!file.exists(fname))  #check for the existence of .rds file
	{ 
        download.file(fileURL, destfile=fname, method="curl")  #link to download the file
    }
    fname
}

prepareData <- function()  #function to prepare data 
{ 
    cacheFile <- "plot_data.csv"
    if(file.exists(cacheFile))  #check if csv file exists
	{
        agr <- read.csv(cacheFile)
        agr$DateTime <- strptime(agr$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else 
	{
        fname <- dnldfile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        con <- unz(fname, "household_power_consumption.txt")  #unzip the file
        agr <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        #close(con)
        agr <- agr[(agr$Date == "1/2/2007") | (agr$Date == "2/2/2007"),]
        agr$DateTime <- strptime(paste(agr$Date, agr$Time), "%d/%m/%Y %H:%M:%S")  #combining date and time to a single variable(DateTime)
        write.csv(agr, cacheFile) #save .rds file
    }
    agr
}