#!/usr/bin/env Rscript

# This script calls the plotting functions written in plot2.R and plot3.R.
source('plot2.R')
source('plot3.R')

if (! 'elecData.Rda' %in% dir()) {
	source('processData.R')
	processData()
}


load('elecData.Rda')


makePlot24 <- function() {
	with(elecData, plot(Voltage ~ dateTime, type='l', xlab='datetime',
	                    ylab='Voltage',	main=""))
}

makePlot44 <- function() {
	with(elecData, plot(Global_reactive_power ~ dateTime, type='l',
	                    xlab='datetime', ylab='Global_reactive_power',
	                    main=""))
}

makePlot4 <- function() {
    par(mfrow=c(2,2))
    makePlot2()
    makePlot24()
    makePlot3()
    makePlot44()
}
png('plot4.png')

makePlot4()
dev.off()
