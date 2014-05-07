#!/usr/bin/env Rscript

## Check for Rda file and load data into R.
if (! 'elecData.Rda' %in% dir()) {
	source('processData.R')
	processData()
}

load('elecData.Rda')

## Define function to construct plot.
makePlot3 <- function() {
    with(elecData, plot(Sub_metering_1 ~ dateTime, xlab="", main="", 
                ylab="Energy sub metering", type='l'))
    with(elecData, points(Sub_metering_2 ~ dateTime, type='l', col='red'))
    with(elecData, points(Sub_metering_3 ~ dateTime, type='l', col='blue'))
    legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2',
	    'Sub_metering_3'), lty=c(1,1,1) , col=c('black', 'red', 'blue'))
    
}
## Construct plot and save to file.
png('plot3.png')
makePlot3()
dev.off()
