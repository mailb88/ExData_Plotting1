#!/usr/bin/env Rscript

# Load the Rda file with processed data if possible, import the processData function from processData.R if it isn't. processData will create the Rda file for future use.

if (! 'elecData.Rda' %in% dir()) {
    source('processData.R')
    processData()
}
load('elecData.Rda')
png('plot1.png')
hist(elecData$Global_active_power, xlab='Global Active Power (kilowatts)', 
			main = 'Global Active Power', col='red')
dev.off()
