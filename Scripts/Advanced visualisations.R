#Advanced data visualization

#Parallel coordinates
?ggparcoord

#Check the data 
names(iris)
head(iris, n=10)
str(iris)
summary(iris)

#Simple chart
ggparcoord(iris, columns = 1:4, alphaLines = 0.3)

#Simple chart, adding a color code 
ggparcoord(iris, columns = 1:4, groupColumn = 5, alphaLines = 0.3) + 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Simple chart, adding a color code 
ggparcoord(iris, columns = 1:4, groupColumn = 5, alphaLines = 0.3, boxplot = TRUE) + 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Showing points, changing transparency and color
ggparcoord(iris, columns = 1:4, groupColumn = 5, order = "anyClass",
           showPoints = TRUE, alphaLines = 0.3)+ 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Different way of scaling: No scaling
ggparcoord(iris, columns = 1:4, groupColumn = 5, order = "anyClass",
           showPoints = TRUE, alphaLines = 0.3, scale="globalminmax") + 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Different way of scaling: Standardize to Min = 0 and Max = 1
ggparcoord(iris, columns = 1:4, groupColumn = 5, order = "anyClass",
           alphaLines = 0.3, scale="uniminmax") + 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Different way of scaling: Normalize univariately (substract mean & divide by sd)
ggparcoord(iris, columns = 1:4, groupColumn = 5, order = "anyClass",
           showPoints = TRUE, alphaLines = 0.3, scale="std") + 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

#Different way of scaling: Standardize and center variables
ggparcoord(iris, columns = 1:4, groupColumn = 5, order = "anyClass",
           showPoints = TRUE, alphaLines = 0.3, scale="center")+ 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd"))

# use sample of the diamonds data for illustrative purposes
diamonds.samp <- diamonds[sample(1:dim(diamonds)[1], 400),]

#Check the data 
names(diamonds.samp)
head(diamonds.samp, n=10)
str(diamonds.samp)
summary(diamonds.samp)

# basic parallel coordinate plot, using default settings
ggparcoord(diamonds.samp, columns = c(1, 5:7), alphaLines = 0.3)

#Adding color
ggparcoord(diamonds.samp, columns = c(1, 5:7), groupColumn = 2,  alphaLines = 0.3)+ 
  scale_color_manual(values=c("#478adb", "#bcc048", "#f20675", "#cccccc", "#1ce3cd"))

## Use splines on values, rather than lines (all produce the same result)
ggparcoord(diamonds.samp, columns = c(1, 5:7), groupColumn = 2, alphaLines = 0.3)+ 
  scale_color_manual(values=c("#478adb", "#bcc048", "#f20675", "#cccccc", "#1ce3cd"))  +   
  facet_wrap(. ~ cut, ncol=2)

## Changing the method
ggparcoord(diamonds.samp, columns = c(1, 5:7), groupColumn = 2, alphaLines = 0.3, scale = "uniminmax")+ 
  scale_color_manual(values=c("#478adb", "#bcc048", "#f20675", "#cccccc", "#1ce3cd"))  +   
  facet_wrap(. ~ cut, ncol=2) 

## Use splines on values, rather than lines (all produce the same result)
ggparcoord(diamonds.samp, columns = c(1, 5:7), groupColumn = 2, alphaLines = 0.5, splineFactor = TRUE)+ 
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))  +   
  facet_wrap(. ~ cut, ncol=2)

#Dumbbell chart 
?geom_dumbbell

#Creating a 3 dinmensional dataframe 
df <- data.frame(Book=LETTERS[1:6],
                 l=c(20, 40, 10, 30, 50, 20),
                 r=c(70, 50, 30, 60, 80, 70))

#Check the data 
names(df)
head(df, n=10)
str(df)
summary(df)

#Running a simple dumbbell chart 
ggplot(df, aes(y=Book, x=l, xend=r)) + 
  geom_dumbbell(color=main2_color)

#Changing parameters
ggplot(df, aes(y=Book, x=l, xend=r)) +
  geom_dumbbell(color=main2_color, size =2) 

#Size and color could be used as a visual encoding as well 
ggplot(df, aes(y=Book, x=l, xend=r, size=r, color=r)) +
  geom_dumbbell()

#Typical dumbbell properties 
ggplot(df, aes(y=Book, x=l, xend=r)) +
  geom_dumbbell(color=main2_color, size =0.5, colour_x= main2_color, size_x=1, colour_xend= decoration_color, size_xend=7)

#Continue the global life expectation analysis with a dumbbell chart 
#Idea is to show the difference between the first and last year 

#Creating a subsample 
years <- filter(gapminder, year %in% c(1952, 2007)) %>% select(country, continent, year, lifeExp)

#Check the data 
names(years)
head(years, n=10)
str(years)
summary(years)

#Convert data to wide format
years2 <- spread(years, year, lifeExp)
names(years2) <- c("country", "continent", "y1952", "y2007")

#Create a simple dumbbell plot
ggplot(years2, aes(country, x=y1952, xend=y2007))+
  geom_dumbbell(colour=main2_color, size_x=0, size_xend=0)

#Sorted by 1952
years3 <- arrange(years2, desc(y1952))
years3$country <- factor(years3$country, levels=rev(years3$country))

#Create a simple dumbbell plot
ggplot(years3, aes(country, x=y1952, xend=y2007))+
  geom_dumbbell(colour=main2_color, size_x=0, size_xend=0)

#Adding color for the continent
ggplot(years3, aes(country, x=y1952, xend=y2007, color=continent))+
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))+
  geom_dumbbell(size_x=0, size_xend=0, dot_guide=FALSE, dot_guide_size=0.2, dot_guide_colour=decoration_color)

#To declutter we create a small multiple 
ggplot(years3, aes(country, x=y1952, xend=y2007, color=continent))+
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))+
  geom_dumbbell(size_x=0, size_xend=0, dot_guide=FALSE, dot_guide_size=0.2, dot_guide_colour=decoration_color) +
  facet_wrap(. ~ continent, ncol=5) 

#Creating a subsample 
europe2 <- filter(gapminder, continent == "Europe" & year %in% c(1952, 2007)) %>% select(country, year, lifeExp)

#Checking
head(europe2, n=10)

#Convert data to wide format
europe3 <- spread(europe2, year, lifeExp)
names(europe3) <- c("country", "y1952", "y2007")

#Checking
head(europe3, n=10)

#Create a simple dumbbell plot
ggplot(europe3, aes(country, x = y1952, xend = y2007))+
  geom_dumbbell(color=main2_color)  

#Create a simple dumbbell plot
ggplot(europe3, aes(country, x = y1952, xend = y2007)) +
  geom_vline(xintercept=mean(europe3$y2007), color= decoration_color, linetype = "dashed") +
  geom_dumbbell(color=main2_color)  

#Normally what we want is a sorted dumbbell plot 

#Sorted by 1952
europe4 <- arrange(europe3, desc(y1952))
europe4$country <- factor(europe4$country, levels=rev(europe4$country))

#Create dumbbell plot now sorted 
ggplot(europe4, aes(country, x = y1952, xend = y2007)) +
  geom_dumbbell(color=main2_color) 

#Adding the reference line
ggplot(europe4, aes(country, x = y1952, xend = y2007)) +
  geom_vline(xintercept=mean(europe4$y1952), color= decoration_color, linetype = "dashed")+
  geom_dumbbell(color=main2_color) 

#Sorted by 2007
europe5 <- arrange(europe3, desc(y2007))
europe5$country <- factor(europe5$country, levels=rev(europe5$country))

#Create dumbbell plot now sorted 
ggplot(europe5, aes(country, x = y1952, xend = y2007)) +
  geom_vline(xintercept=mean(europe5$y2007), color= decoration_color, linetype = "dashed") +
  geom_dumbbell(color=main2_color) 

#Excercise: Change the style of the dummbbell chart, do the same chart but for the variable population 
#and finally apply everything to the dataset storm 

#Waffle chart 

?waffle

#Create a random data set 
d <- c(50, 30, 20, 10)

#1. Basic waffle 
waffle(d, rows = 20, colors = c("#478adb", "#f20675", "#bcc048", "#1ce3cd"))

#2. Change size 
waffle(d, rows = 5, colors = c("#478adb", "#f20675", "#bcc048", "#1ce3cd"), size = 0.1) 

#4. Change the position of the legend
waffle(d/2 , rows = 5, colors = c("#478adb", "#f20675", "#bcc048", "#1ce3cd"), size = 0.1, legend_pos = "bottom")

#New simple dataset created 
professional <- c(`Male` = 44, `Female (56%)` = 56)

#A simple waffle 
waffle(
  professional, rows = 20, size = 0.2,
  colors = c(main1_color, main2_color), legend_pos = "bottom"
)

#You can use the iron statment to create a small multiple of waffles 
iron(
  waffle(c(thing1 = 0, thing2 = 100), colors = c(main1_color, main2_color), rows = 5, flip=TRUE),
  waffle(c(thing1 = 25, thing2 = 75), colors = c(main1_color, main2_color), rows = 5, flip=TRUE)
)

#It's better to add the legend then separatly instead of showing it in every chart 
iron(
  waffle(c(thing1 = 0, thing2 = 100), colors = c(main1_color, main2_color), rows = 5, keep = FALSE, legend='none'),
  waffle(c(thing1 = 25, thing2 = 75), colors = c(main1_color, main2_color), rows = 5, keep = FALSE, legend_pos = "bottom")
)

#5. Adding the legend only to one 

iron(
  
  waffle(
    c(men = 62, woman = 38), rows = 5, size = 0.2,
    colors = c(decoration_color, main2_color),
    keep = FALSE,
    title = "WOMAN Arcada 2018", 
    legend='none'),
  
  waffle(
    c(men = 47, woman = 53), rows = 5, size = 0.2,
    colors = c(decoration_color, main2_color),
    keep = FALSE,
    title = "WOMAN Arcada 2019", 
    legend='none'),
  
  waffle(
    c(men = 36, woman = 64), rows = 5, size = 0.2,
    colors = c(decoration_color, main2_color),
    keep = FALSE,
    title = "WOMAN Arcada 2020",
    legend_pos = "bottom")
  
)