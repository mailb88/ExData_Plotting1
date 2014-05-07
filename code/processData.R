#!/usr/bin/env Rscript

## This function will do the data processing for all of the plotting scripts.
## It will output a .Rda file for fast loading that the individual scripts
## can use. The plotting scripts will check the current working directory
## for the presence of the .Rda file. If found it will be loaded, if not found
## this script will be sourced in and processData will be run.

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

## Allow the script to be called from the terminal.
if (! interactive()) processData()

## Potential improvements:
## 	- Currently the two dates are hardcoded in. From the interpretor we
##	  could pass different values in, as long as they are a character 
##	  vector. It would be more user friendly to accept a date range,
##	  (start, stop). In addition the hardcoded file output would need to
## 	  changed into a parameter to be specified.
##	- Currently the script accepts no command line args, it would be 
##	  possible, and potentially beneficial, to accept them.
