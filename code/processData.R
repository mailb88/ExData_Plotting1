#!/usr/bin/env Rscript

## This function will do the data processing for all of the plotting scripts. It will output a .Rda file for fast loading that the individual scripts can load and use. The plotting scripts will check for the presence of the .Rda file and source this script if necessary.

processData <- function(dates=c('1/2/2007', '2/2/2007')) {
   
	elec <- read.table('household_power_consumption.txt', header=TRUE,
	                   sep=';', na.strings='?', stringsAsFactors=FALSE,
	                   nrows=2075260, colClasses=c('character', 
	                                        'character', rep('numeric', 7)))
	dateIndex <- elec$Date %in% dates
	elecData <- elec[dateIndex,]
	dateTime <- paste(elecData[,1], elecData[,2])
	elecData$dateTime <- as.POSIXct(dateTime, format="%d/%m/%Y %H:%M:%S")
	
	save(elecData, file='elecData.Rda')		
}

if (! interactive()) processData()


