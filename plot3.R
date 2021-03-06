

df<-read.table("household_power_consumption.txt",sep=';',header=TRUE)
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
df1$DateTime<-paste(df1$Date,df1$Time);
df1$DateTime1<-strptime(df1$DateTime,"%d/%m/%Y %H:%M:%S")

df1$Sub_metering_1<-as.numeric(as.character(df1$Sub_metering_1));
df1$Sub_metering_2<-as.numeric(as.character(df1$Sub_metering_2));
df1$Sub_metering_3<-as.numeric(as.character(df1$Sub_metering_3));


par(mar=c(3,4,4,4));
with(df1,plot(DateTime1,Sub_metering_3,type="n",xlab="",ylab= "Energy Sub Metering"));

with(df1,lines(DateTime1,Sub_metering_3,col="blue",pch=1,lty=1));
with(df1,lines(DateTime1,Sub_metering_2,col="red",pch=1,lty=1));
with(df1,lines(DateTime1,Sub_metering_1,col="black",pch=1,lty=1));



legend("topright",col=c("black"," red"," blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


legend("topright",col=c("black"," red"," blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="Plot3.png")