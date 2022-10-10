#Time series analysis: Line charts are very useful to show time series 
#The line chart is the recomended way to represent time series data, why? 

#Check the data 
names(economics)
head(economics, n=10)
str(economics)
summary(economics)

#1 General plot definition and theme saved in a variable
e <-ggplot(economics, aes(date, unemploy))

#Showing the different geoms for time data 
e + geom_point() + ggtitle("point")
e + geom_bar(stat = "identity") + ggtitle("bar")
e + geom_area() + ggtitle("area")
e + geom_line() + ggtitle("line") 

#2 Showing trends for different categories 

#Check the data 
names(economics_long)
head(economics_long, n=10)
str(economics_long)
summary(economics_long)

#All in one chart, what is the problem?
ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line() 

#Changing to a small multiple 
ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line() + 
  facet_wrap(~variable, ncol=5) 

#Changing to a small multiple - adding a reference line to make them comparable
ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line() + 
  facet_wrap(~variable, ncol=4) +
  geom_hline(yintercept = 0.5) + geom_smooth(color = trend_color)

#3 If we want to see the exact movements how the y values changes 

#Check the data 
names(economics)
head(economics, n=10)
str(economics)
summary(economics)

#Filtering the dataset 
recent <- economics[economics$date > as.Date("2013-01-01"), ]

#The noraml line chart 
ggplot(recent, aes(date, unemploy)) + geom_line()

#The chart with exact changes 
ggplot(recent, aes(date, unemploy)) + geom_step()

#Group element in line and other charts 

#Problem with line charts 

#Check the data 
names(Oxboys)
head(Oxboys, n=10)
str(Oxboys)
summary(Oxboys)

# A single line tries to connect all the observations 
h<- ggplot(Oxboys, aes(age, height)) 
h + geom_line() 

#Grouping the observation by the variables subject
h1 <- ggplot(Oxboys, aes(age, height, group=Subject))
h1 + geom_line()

# Create a small multiple for the variable subject to understand the logic 
h1 + geom_line() + 
  facet_wrap(~Subject, ncol=2) 

#Introducing the smooth element 

# Using the group aesthetic with both geom_line() and geom_smooth()
# groups the data the same way for both layers
h1 + geom_line() + 
     geom_smooth(aes(), colour = trend_color, size = 0.5, method = "lm", se = FALSE)

# Changing the group aesthetic for the smoother layer
# fits a single line of best fit across all boys
h1 + geom_line() +
     geom_smooth(aes(group = 1), colour = trend_color, size = 3, method = "lm", se = TRUE)

# Adding a confidence intervall
h1 + geom_line() +
  geom_smooth(aes(group = 1), colour = trend_color, size = 0.5, method = "lm", se = TRUE)

# Now we combine a box-plot with the line chart 
h2 <- ggplot(Oxboys, aes(Occasion, height))
h2 + geom_boxplot() + geom_line(colour = "blue")

# We can add the a line chart again for all the subjects  
h2 + geom_boxplot() + geom_line(aes(group = Subject, colour = "blue"), size=0.3)

# We can add the a line chart grouped 
h2 + geom_boxplot() + geom_smooth(aes(group = 1), method = "lm", se = FALSE)

# Creating a visual analytical story 
names(gapminder)
head(gapminder, n=10)
str(gapminder)
summary(gapminder)

#General trend in life expactency
ggplot(gapminder) +
  geom_line(aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color= line_color) +
  labs(title = "Life expectancy has increased worldwide") 

#Checking on continents 
ggplot(gapminder) +
  geom_line(aes (year, lifeExp, group = country, color= continent), lwd = 0.3, show.legend = TRUE) +
  labs(title = "Life expectancy has increased worldwide") 

#Introducing a small multiple to better distingish between continents 
ggplot() +
  geom_line(data=gapminder, aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color= line_color) + 
  facet_wrap(~ continent, ncol=5, strip.position = "bottom") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Life expectancy by continent")

# Zooming in to see only europe 
ggplot(subset(gapminder, continent ==  "Europe")) +
  geom_line(aes(year, lifeExp, group = country), color= line_color, show.legend = FALSE) +
  labs(title = "Life expectancy in Europe - detecting an outlier") 

# Select only Europe in order to understand which country is the outlier
europe <- dplyr::filter(gapminder, continent == "Europe")

ggplot(europe, aes(year, lifeExp)) +
  geom_line(color=line_color) +
  facet_wrap(~country) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Changes in Life Expectancy by country in europe") 

#We can also show the trend as dots 
ggplot(europe, aes(year, lifeExp)) +
  geom_point(color="grey", size=2) +
  facet_wrap(~country) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Changes in Life Expectancy by country in europe") 

#Coming back to the general chekcing on patterns globally 

#What will be the output of this code?
#Adding a trend line - defining the method as loss 
ggplot() +
  geom_line(data=gapminder, aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color= line_color) + 
  facet_wrap(~ continent, ncol=5, strip.position = "bottom") +
  geom_smooth(data=gapminder, aes(year, lifeExp, group = 1), lwd = 2, method = 'loess', span = 2, se = TRUE, color = trend_color) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Life expectancy by continent including trendline")

#We can even add all data in the background by setting the variable we do the facet with to zero 
ggplot() +
  geom_line(data = transform(gapminder, continent = NULL), aes (year, lifeExp, group = country), alpha = 0.5, lwd = 0.1, colour = "white") +
  geom_line(data=gapminder, aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color= line_color) +
  geom_smooth(data=gapminder, aes(year, lifeExp, group = 1), lwd = 2, method = 'loess', span = 0.1, se = TRUE, color = trend_color) + 
  facet_wrap(~ continent, ncol=5, strip.position = "bottom") + 
  theme(strip.background = element_blank(), strip.placement = "outside") +
  theme(axis.text.x = element_blank()) +
  labs(title = "Life expectancy by continent including trendline, showing all data in the back") 

#Now we could filter again on europe and have far more context 
ggplot() +
  geom_line(data = transform(gapminder, continent = NULL), aes (year, lifeExp, group = country), alpha = 0.5, lwd = 0.1, colour = "white") +
  geom_line(data=europe, aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color= line_color) +
  geom_smooth(data=europe, aes(year, lifeExp, group = 1), lwd = 2, method = 'loess', span = 0.1, se = TRUE, color = trend_color) +
  theme(strip.background = element_blank(), strip.placement = "outside") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Life expectancy by country in europe, including a trend line and showing all data in the back") 

#Showing how to add a line by aggregating the data 

#Aggregating the data 
gapminderavg<-aggregate(. ~year, data=gapminder, mean, na.rm=TRUE)
head(gapminderavg, n=10)

#Make a plot with the aggregated data 
ggplot(gapminderavg) +
  geom_line(aes (year, lifeExp), lwd = 0.3, show.legend = FALSE, color = "orange") +
  labs(title = "Total") 

#Adding this line to the general plot by using twice the geom_line with different datasets  
ggplot() +
  geom_line(data=gapminderavg, aes (year, lifeExp), lwd = 5, show.legend = FALSE, color = "orange") +
  geom_line(data=gapminder, aes (year, lifeExp, group = country), lwd = 0.3, show.legend = FALSE, color = line_color) +
  labs(title = "Total vs. all countries") 

##Extra 
# Select only Europe: second way
ggplot(subset(gapminder, continent ==  "Europe")) +
  geom_line(aes(year, lifeExp, group = country, size= pop, color=pop, alpha = pop), show.legend = FALSE) + 
  facet_wrap(~ continent) +
  labs(title = "Life expectancy has increased worldwide") + dark_mode(theme_fivethirtyeight())

#Excercise: choose a different dataset (from the dataset script) 
#and try the different options of line charts also with facets and different trend lines 

#One examples 
head(txhousing, n=20) 
t <-ggplot(txhousing, aes(date, sales)) 
t + geom_line(aes(group = city)) + facet_wrap(~city, ncol=4) 

# Storms - https://dplyr.tidyverse.org/reference/storms.html
names(storms)
head(storms, n=10)
str(storms)
summary(storms)

#Different dataset
ggplot(storms, aes(pressure, wind, group=year)) + 
  sandra_theme +
  geom_point(color="yellow") + 
  facet_wrap(~year, ncol=4) 

#Changing to a small multiple - adding a reference line to make them comparable
ggplot(storms, aes(pressure, wind)) +
  geom_point(colour = line_color, size = 0.3) + 
  facet_wrap(~ status, ncol=3)

#Changing to a small multiple - adding a reference line to make them comparable
ggplot(storms, aes(pressure, wind, group=wind)) +
  geom_line(colour = line_color, size = 0.3) + 
  facet_wrap(~ status, ncol=3) 




