#Read the text file and subset to get to the right dataset for plotting graphs

df<-read.table("household_power_consumption.txt",sep=';',header=TRUE);
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007");
df1$DateTime<-paste(df1$Date,df1$Time);
df1$Global_active_power<-as.numeric(as.character(df1$Global_active_power));

df1$DateTime1<-strptime(df1$DateTime,"%d/%m/%Y %H:%M:%S")

with(df1,plot(DateTime1,Global_active_power,type="n",xlab="",
              ylab= "Global Active Power(kilowatts)"));
with(df1,lines(DateTime1,Global_active_power));
dev.copy(png,file="Plot2.png");
