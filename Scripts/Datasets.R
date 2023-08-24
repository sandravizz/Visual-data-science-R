#Datasets 

#Storms - https://dplyr.tidyverse.org/reference/storms.html
names(storms)
head(storms, n=10)
str(storms)
summary(storms)

#Life expectancy
names(gapminder)
head(gapminder, n=10)
str(gapminder)
summary(gapminder)

#Txhousing 
names(txhousing)
head(txhousing, n=10)
str(txhousing)
summary(txhousing)

#Orange
names(Orange)
head(Orange, n=10)
str(Orange)
summary(Orange)

#Flights 
names(flights)
head(flights, n=10)
str(flights)
summary(flights)

#Diamonds 
names(diamonds)
head(diamonds, n=10)
str(diamonds)
summary(diamonds)

#How to create subsamples
diamonds_sample <- diamonds[sample(nrow(diamonds), 1000),]

#Mpg 
names(mpg)
head(mpg, n=10)
str(mpg)
summary(mpg)

#Economics 
names(economics)
head(economics, n=10)
str(economics)
summary(economics)

#Economics 2
names(economics_long)
head(economics_long, n=10)
str(economics_long)
summary(economics_long)

#Car
names(mtcars)
head(mtcars, n=10)
str(mtcars)
summary(mtcars)

#Plays 
#https://data.world/sports/ncaa-mens-march-madness
NCAAraw <- read.csv("https://gist.githubusercontent.com/drussotto/eca9bddf187ff7fee559363245235d02/raw/612fc02f6fb410b5d535b11d70ee07e3e4741d3d/march_madness_historical.csv")
names(NCAAraw)

NCAA <- separate(NCAAraw,Date,into=c("Month","Day","Year"), sep="/")

#Make sure the date columns are numeric
NCAA[, 1] <- as.numeric(as.character( NCAA[, 1] ))
NCAA[, 2] <- as.numeric(as.character( NCAA[, 2] ))
NCAA[, 3] <- as.numeric(as.character( NCAA[, 3] ))

NCAA$Year<-ifelse(NCAA$Year<70, NCAA$Year+2000, NCAA$Year+1900)

NCAAsum<-aggregate(. ~Year, data=NCAA, sum, na.rm=TRUE)
NCAAavg<-aggregate(. ~Year, data=NCAA, mean, na.rm=TRUE)
NCAAround<-aggregate(. ~Round, data=NCAA, mean, na.rm=TRUE)

#Difference between scores
NCAAavg$diff.score<-NCAAavg$Winning.Score-NCAAavg$Losing.Score
NCAAround$diff.score<-NCAAround$Winning.Score-NCAAround$Losing.Score

#Mean between scores
NCAAavg$mean.score<-mean(NCAAavg$Winning.Score,NCAAavg$Losing.Score,
                         trim = 0, na.rm = FALSE)

names(NCAA)
head(NCAA, n=10)
head(NCAAsum, n=10)
head(NCAAavg, n=10)
head(NCAAround, n=10)
str(NCAA)
summary(NCAA)



