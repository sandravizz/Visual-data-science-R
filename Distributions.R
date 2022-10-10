#Explorative Analysis (gapminder dataset)

# Creating a visual analytic story 
names(gapminder)
head(gapminder, n=10)
str(gapminder)
summary(gapminder)

#Make sure you've set your preferred theme as a default

#One dimensional distributions

#Frequency Polygon

#Checking the options
?geom_freqpoly

#Simple chart
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color) 

#Changing the bin width (more details)
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color, binwidth = 0.8)

#Changing the bin width (less details)
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color, binwidth = 10) 

#Adding color as a visual encoding
ggplot(gapminder, aes(lifeExp, colour = continent)) +
  geom_freqpoly() +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) 

#How to zoom by defining the limits for the x axis
ggplot(gapminder, aes(lifeExp, colour = continent)) +
  geom_freqpoly() +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) + 
  xlim(60, 80)

#Histogram

#Checking the options
?geom_histogram

#Simple chart, the same with a histogram 
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color, binwidth = 10) 

#How to zoom by defining the limits for the x axis 
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color) + 
  xlim(60, 80)

#Histogram for different cut options 
ggplot(gapminder, aes(lifeExp, fill = continent)) +
  geom_histogram(position = "dodge") + 
  scale_fill_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Changing the bin options
ggplot(gapminder, aes(lifeExp, fill = continent)) +
  geom_histogram(position = "dodge", binwidth = 10) + 
  scale_fill_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#The whole idea of the grammar of graphs 
ggplot(gapminder, aes(lifeExp, color = continent)) +
  geom_histogram(colour=decoration_color, fill = decoration_color, alpha = 0.2, size =0) +
  geom_freqpoly()+ 
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Introducing the color package 
library(RColorBrewer)
head(brewer.pal.info, 20)

#Color set - color brewer 
ggplot(gapminder, aes(lifeExp, color = continent)) +  
  scale_colour_brewer(palette = "Accent")  +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly()  

#Colors in revers order
ggplot(gapminder, aes(lifeExp, color = continent)) +  
  scale_colour_brewer(palette = "Accent", direction = -1)  +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly() 

#Color set - color brewer
ggplot(gapminder, aes(lifeExp, color = continent)) +   
  scale_colour_brewer(palette = "Set1") +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha = 0.07, size =0) +
  geom_freqpoly()

#Zoom in again 
ggplot(gapminder, aes(lifeExp, color = continent)) +  
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly() + 
  scale_colour_manual(values=c("#478adb", "#1ce3cd", "#f206d3", "#bcc048", "#cccccc"))  + 
  xlim(60, 80)

#Multiple: histogram for the different continents to facilitate comparison: first the simple version
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(binwidth = 2, fill = main2_color, colour = "black") + 
  facet_wrap(. ~ continent)

#Changing the colors
ggplot(gapminder, aes(lifeExp, fill = continent)) + 
  geom_histogram(binwidth = 2, colour = "black") + 
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +
  facet_wrap(. ~ continent)

#Boxplot

#Checking the options
?geom_boxplot

# Simple boxplot by category 
ggplot(gapminder, aes(continent, lifeExp)) +
  geom_boxplot(colour=main2_color)

# Boxplot using to numeric variable, we need to define a grouping rule
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
  geom_boxplot(aes(group = cut_width(lifeExp, 10)), color=main2_color)

# Smaller groups 
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
  geom_boxplot(aes(group = cut_width(lifeExp, 5)), color=main2_color)

# Without outliers 
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
  geom_boxplot(aes(group = cut_width(lifeExp, 5)), color=main2_color,
               outlier.alpha=0)

# Use a specific encoding for the outliers
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
  geom_boxplot(aes(group = cut_width(lifeExp, 5)), color=main2_color, 
               color=main2_color,
               outlier.alpha = 0.5, 
               outlier.shape = 19, 
               outlier.color=decoration_color)

#Tufe boxplot
ggplot(gapminder, aes(factor(continent),lifeExp)) + 
  geom_tufteboxplot(outlier.colour="transparent", size=1, color=main2_color) 

#Tufe boxplot
ggplot(gapminder, aes(factor(lifeExp),gdpPercap)) + 
  geom_tufteboxplot(aes(group = cut_width(lifeExp, 5)), color=main2_color) 

#Desnsity chart

#Checking the options
?geom_density

#Simple chart - the same with a density chart
ggplot(gapminder, aes(lifeExp)) +  
  geom_density(fill = main2_color, color = NA)

#Multiple density chart 
ggplot(gapminder, aes(lifeExp, group = continent, fill = continent)) +
  geom_density(adjust = 1.5 , color = NA) + 
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))   

#Multiple density chart, with using one color and transparency we can identify easly the overlap as a more dense part through all cuts 
ggplot(gapminder, aes(lifeExp, group=continent, fill=continent)) +
  geom_density(adjust=1.5 , color= NA, fill=main2_color, alpha =0.1) 

#Small multiple density for carat by the different cuts 
ggplot(gapminder, aes(lifeExp, stat(density), fill=continent)) + 
  geom_density(color = NA) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +   
  facet_wrap(. ~ continent) 

#Ridgeline plot

#Checking the options
?geom_density_ridges

#Another way of creating small multiples is using the ridgeline plot 
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(fill=main2_color, color=fill_color) 

#Encoding color 
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent)) +
  geom_density_ridges(color=NA) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Introducing the scaling factor
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent)) +
  geom_density_ridges(color=NA, scale = 8) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Using color to represent x twice (viridis scale)
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_viridis_c() 

#Using color (self defined) to represent x twice (own created scale)
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Check on the data 
names(lincoln_weather)
head(lincoln_weather, n=10)
str(lincoln_weather)
summary(lincoln_weather)

ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = Month, fill = stat(x))) +
  geom_density_ridges_gradient(scale = 2.5, rel_min_height = 0.01, color="black", size=0.1) +
  scale_fill_viridis_c() 

ggplot(lincoln_weather, aes(x = `Mean Temperature [F]`, y = Month, fill = stat(x))) +
  geom_density_ridges_gradient(scale = 2.5, rel_min_height = 0.01, color="black", size=0.1) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Adding lines for the quantile 
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  stat_density_ridges(scale=1, color=main2_color, fill="lightgrey", alpha=0.2, quantile_lines=TRUE) 

#Adding lines for the quantile, only median  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  stat_density_ridges(scale=1, color=main2_color, fill="lightgrey", alpha=0.2, quantile_lines=TRUE, quantiles=2)

#Filling a specific part of the distribution
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = factor(stat(quantile)))) +
  stat_density_ridges(geom = "density_ridges_gradient", scale=1, quantile_lines=TRUE, calc_ecdf=TRUE, quantiles = c(0.025, 0.975))+
  scale_fill_manual(values = c(main2_color, "#282626", main1_color))

#Adding the actual points  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(scale=1, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8) 

#Adding the actual points  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(scale=0.5, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8, position="raincloud") 

#Encoding color 
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent, color=continent)) +
  geom_density_ridges(scale=0.5, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8, position="raincloud") +
  scale_color_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048")) +
  scale_fill_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Relationship analysis 

#Scatter plot 

#Checking the options
?geom_point

#Basic scatter plot 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(color=main2_color)

#Basic scatter plot - adjusting the size 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +  
  geom_point(size=0.5, color=main2_color) 

#Basic scatter plot - adjusting the opacity
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +  
  geom_point(alpha=0.3, color=main2_color)

#Basic scatter plot changing the Y limits
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(size=0.5, color=main2_color) + 
  ylim(0, 16000)

#Axis labeling depending on the quantiles 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(size=0.7, alpha=0.7, color=main2_color)  + 
  scale_x_continuous(breaks = round(as.vector(quantile(gapminder$lifeExp)), digits = 1))+
  scale_y_continuous(breaks = round(as.vector(quantile(gapminder$gdpPercap)), digits = 1)) 

#Adding price as another visual encoding using a colour code 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap, colour = lifeExp)) +
  geom_point(size=0.7, alpha=1)+
  scale_colour_gradient(low = main1_color, high = main2_color) 

#Another way to handle big datasets is to create a sample  
gapminder_sample <- gapminder[sample(nrow(gapminder), 500),]

#Basic scatter plot 
ggplot(gapminder_sample, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(color=main2_color)

#Change the position scale to logarithmic scaling
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(size=2, alpha=0.5, color=main2_color) +
  scale_y_log10() 

#Axis labeling depending on the quantiles 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + 
  geom_point(size=2, alpha=0.5, color=main2_color) + 
  xlab("")+ 
  ylab("")+ 
  scale_x_continuous(breaks = round(as.vector(quantile(gapminder$lifeExp)), digits = 1))+
  scale_y_continuous(breaks = round(as.vector(quantile(gapminder$gdpPercap)), digits = 1))

#Axis labeling depending on the quantiles for logaritmic scaling
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point(size=0.02, alpha=0.09, color=main2_color)  + 
  xlab("")+ 
  ylab("")+ 
  scale_x_log10(breaks = round(as.vector(quantile(diamonds$carat)), digits = 1))+
  scale_y_log10(breaks = round(as.vector(quantile(diamonds$price)), digits = 1))

#Adding a trend line 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point(color=main2_color, size=0.8, alpha=0.2)+
  stat_smooth(color=decoration_color)

#Small multiples - one variable
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point(color=main2_color, size=0.8, alpha=0.2)+
  facet_wrap( ~ continent, ncol=2) +
  stat_smooth(color=decoration_color) 

#Small multiples - one variable with free scale 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point(color=main2_color, size=0.8, alpha=0.2)+
  facet_wrap( ~ continent, ncol=2, scales = "free") +
  stat_smooth(color=decoration_color)

#Marginal plot to compare all simple distributions with the scatterplot relationship representation 

#Now we set the new defined theme to the default option 
theme_set(sandra_theme)

?ggMarginal

#Density
pp <- ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_point(color=main2_color) + 
  theme(axis.title=element_blank(), axis.text=element_blank())

ggMarginal(pp, type = "density", fill = main2_color, alpha=1, color='transparent')

#Box-plot  

ggMarginal(pp, type = "boxplot", size=30, fill=main2_color)

#Histogram  

ggMarginal(pp, type = "histogram", size=20, fill=main2_color)

#Beeswarm 

?geom_jitter()

#Simple jitter plot
ggplot(gapminder, aes(x=lifeExp, y=continent)) +
  geom_jitter(color=main2_color)

#Switching axis
ggplot(gapminder, aes(y=lifeExp, x=continent)) +
  geom_jitter(color=main2_color)

#Check the options
?geom_quasirandom()

#Simple beewswarm
ggplot(gapminder, aes(x=lifeExp, y=continent)) + 
  geom_quasirandom(size=3, alpha=0.7, color=main2_color, groupOnX=FALSE)

#Simple beewswarm
ggplot(gapminder, aes(x=lifeExp, y=continent, colour=continent)) + 
  geom_quasirandom(size=3, alpha=0.7, groupOnX=FALSE) +
  scale_colour_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Simple beewswarm
ggplot(gapminder, aes(x=lifeExp, y=continent, colour=continent)) + 
  geom_quasirandom(alpha=0.7, groupOnX=FALSE, method = "smiley") +
  scale_colour_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Hexagonal binning

#Checking the options
?geom_hex

#Aggregation through hexagonal binning - defining the number of bins 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_hex(bins=60, alpha =0.8)+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Aggregation through hexagonal binning - logarithmic scaling 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_hex(alpha = 0.6) +
  scale_x_log10(breaks = round(as.vector(quantile(gapminder$lifeExp)), digits = 1))+
  scale_y_log10(breaks = round(as.vector(quantile(gapminder$gdpPercap)), digits = 1))+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Checking the options
?geom_bin2d

#Heatmap based on rectangles
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_bin2d(bins = 60) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Heatmap based on rectangles
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  geom_bin2d(bins = 50, alpha = 0.4)+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Checking the options
?stat_density_2d

#Density estimation with contours
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon")  +
  scale_fill_continuous(type = "viridis") 

#Density estimation with contours
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Adding a stroke 
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white") +
  scale_fill_gradient(low=main2_color, high=main1_color)
