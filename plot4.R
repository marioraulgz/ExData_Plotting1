library(lubridate)
library(dplyr)
library(tidyr)

hpc <- read.csv("household_power_consumption.txt", sep = ";")
hpc <- hpc %>% filter(Date=="1/2/2007" | Date =="2/2/2007") %>% unite("Date Time", Date:Time , sep =" ") %>% mutate(`Date Time`= dmy_hms(`Date Time`))


par(mfrow=c(2,2))
with(hpc, {
  plot(`Date Time`, as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(`Date Time`, as.numeric(Voltage),type="l",xlab="datetime",ylab="Voltage")
  plot(`Date Time`, as.numeric(Sub_metering_1), type = "l",xlab="",ylab="Energy sub metering", main="Energy sub-metering")
  lines(`Date Time`,as.numeric(Sub_metering_2), col ="red")
  lines(`Date Time`,as.numeric(Sub_metering_3), col ="blue")
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
  plot(`Date Time`, as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png, file = "plot4.png")
dev.off()
