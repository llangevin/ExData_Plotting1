#Exploratory Data Analysis
#Peer Assessments /Course Project 1
#Plot3 

#Getting the data
setwd("./Exploratory Data Analysis/PA_CP1") #set your working directory here
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip")
list.files()

#Reading the data
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
hpc<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=60*24*2,stringsAsFactors=F,na.strings="?")
hpc_header<-read.table("household_power_consumption.txt",header=T,sep=";",nrows=1,stringsAsFactors=F,na.strings="?")
names(hpc)<-names(hpc_header)
rm(hpc_header)
hpc$DateTime<-strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")
str(hpc)
head(hpc)
tail(hpc)

#Plotting
#Copy my plot to a PNG file
Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1, 1))
png(filename = "./ExData_Plotting1/plot3.png",width = 480, height = 480, units = "px")
plot(hpc$DateTime,hpc$Sub_metering_1,type = "n",xlab="",ylab ="Energy sub metering")
points(hpc$DateTime,hpc$Sub_metering_1,type = "l", col = "black")
points(hpc$DateTime,hpc$Sub_metering_2,type = "l", col = "red")
points(hpc$DateTime,hpc$Sub_metering_3,type = "l", col = "blue")
legend("topright", cex=1, lwd=1, lty=1, pch=NA, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Don't forget to close the PNG device!
dev.off()
