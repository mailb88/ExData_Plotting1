#!/usr/bin/env Rscript

## Check for Rda file, and load into environment.
if (! 'elecData.Rda' %in% dir()) {
	source('processData.R')
	processData()
}

load('elecData.Rda')

## Define plot function.
makePlot2 <- function() {
    with(elecData, plot(Global_active_power ~ dateTime, xlab="", 
			ylab="Global Active Power (kilowatts)", 
			main = "", type='l'))
}
## Construct the plot and save to file.
png('plot2.png')
makePlot2()
dev.off() 
