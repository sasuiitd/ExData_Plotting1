#Read the text file and subset to get to the right dataset for plotting graphs
df<-read.table("household_power_consumption.txt",sep=';',header=TRUE);
df1<-subset(df,Date=="1/2/2007" | Date=="2/2/2007");
#converting the Global active power into numeric to be able to plot the histogram
df1$Global_active_power<-as.numeric(as.character(df1$Global_active_power));

hist(df1$Global_active_power, col="red",xlab=NULL,main=NULL);
title(main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,file="Plot1.png")
