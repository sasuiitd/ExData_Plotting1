df<-read.table("household_power_consumption.txt",sep=';',header=TRUE)
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
df1$DateTime<-paste(df1$Date,df1$Time);
df1$DateTime1<-strptime(df1$DateTime,"%d/%m/%Y %H:%M:%S")

df1$Global_active_power<-as.numeric(as.character(df1$Global_active_power));
df1$Global_reactive_power<-as.numeric(as.character(df1$Global_reactive_power));

df1$Voltage<-as.numeric(as.character(df1$Voltage));

df1$Sub_metering_1<-as.numeric(as.character(df1$Sub_metering_1));
df1$Sub_metering_2<-as.numeric(as.character(df1$Sub_metering_2));

par(mfrow=c(2,2), mar=c(4,4,2,2));

with(df1,plot(DateTime1,Global_active_power,type="n",xlab="",
              ylab= "Global Active Power(kilowatts)"));
with(df1,lines(DateTime1,Global_active_power));

with(df1,plot(DateTime1,Voltage,type="n",xlab="datetime",ylab= "Voltage"));
with(df1,lines(DateTime1,Voltage));

with(df1,plot(DateTime1,Sub_metering_3,type="n",xlab="",ylab= "Energy Sub Metering"));

with(df1,lines(DateTime1,Sub_metering_3,col="blue"));
with(df1,lines(DateTime1,Sub_metering_2,col="red"));
with(df1,lines(DateTime1,Sub_metering_1,col="black"));


with(df1,plot(DateTime1,Global_reactive_power,type="n",xlab="datetime",
              ylab= "Global Reactive Power(kilowatts)"));
with(df1,lines(DateTime1,Global_reactive_power));

dev.copy(png,file="Plot4.png")
