#!/usr/bin/env Rscript

## Construct the first plot, as per directions. Load the Rda file if possible,
## use processData() from processData.R to create the file if it does not exist.


if (! 'elecData.Rda' %in% dir()) {
    source('processData.R')
    processData()
}
load('elecData.Rda')
png('plot1.png')
hist(elecData$Global_active_power, xlab='Global Active Power (kilowatts)', 
			main = 'Global Active Power', col='red')
dev.off()
