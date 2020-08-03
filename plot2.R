library(lubridate)
library(dplyr)
library(tidyr)

hpc <- read.csv("household_power_consumption.txt", sep = ";")
hpc <- hpc %>% filter(Date=="1/2/2007" | Date =="2/2/2007") %>% unite("Date Time", Date:Time , sep =" ") %>% mutate(`Date Time`= dmy_hms(`Date Time`))

#2
with(hpc, plot(`Date Time`, as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)"))


dev.copy(png, file = "plot2.png")
dev.off()