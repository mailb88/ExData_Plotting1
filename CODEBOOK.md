## Codebook:

The assignment requires creating four plots and the code used to make them. The required plots can be found in the plots directory. The code used to create them can be found in the code directory. 

### Code:
There are five files in the code directory. Each requires the unzipped data set to be located in the current working directory. The original zipped data can be found at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
The processData.R loads the data and extracts all rows which match the date strings given. It then adds a POSIXct variable and saves the data as an Rda file for easy loading in the plotting files.
The first three plotting files load the Rda, or call processData and then load it, before constructing the plot and saving it to a file.
The last plotting file loads plot2.R and plot3.R and uses the functions described in them to construct the last plot.
