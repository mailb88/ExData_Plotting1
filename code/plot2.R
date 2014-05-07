#!/usr/bin/env Rscript

if (! 'elecData.Rda' %in% dir()) {
	source('processData.R')
	processData()
}

load('elecData.Rda')

makePlot2 <- function() {
    with(elecData, plot(Global_active_power ~ dateTime, xlab="", 
			ylab="Global Active Power (kilowatts)", 
			main = "", type='l'))
}
png('plot2.png')
makePlot2()
dev.off() 
