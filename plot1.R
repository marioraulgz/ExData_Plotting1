library(lubridate)
library(dplyr)
library(tidyr)

#Get data and subset it with a pipeline
hpc <- read.csv("household_power_consumption.txt", sep = ";")
hpc <- hpc %>% filter(Date=="1/2/2007" | Date =="2/2/2007") %>% unite("Date Time", Date:Time , sep =" ") %>% mutate(`Date Time`= dmy_hms(`Date Time`))
#1
with(hpc, hist(as.numeric(Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)"))

dev.copy(png, file = "plot1.png")
dev.off()
