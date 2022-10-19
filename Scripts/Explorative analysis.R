#Explorative Analysis (diamonds dataset)

#Check on the data 
names(diamonds)
head(diamonds, n = 10)
str(diamonds)
summary(diamonds)

#Make sure you've set your preferred theme as a default

#One dimensional distributions

#Frequency Polygon

#Checking the options
?geom_freqpoly

#Simple:carat - play around with binwidth 
ggplot(diamonds, aes(price)) + 
  geom_freqpoly(colour = main2_color) 

#Changing the bin width
ggplot(diamonds, aes(price)) + 
  geom_freqpoly(colour = main2_color, binwidth = 200) 

#Adding color as a visual encoding
ggplot(diamonds, aes(price, colour = cut)) +
  geom_freqpoly() +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) 

#How to zoom by defining the limits for the x axis
ggplot(diamonds, aes(price, colour = cut)) +
  geom_freqpoly() +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) + 
  xlim(0, 5000)

#Histogram

#Checking the options
?geom_histogram

#Simple:carat - the same with a histogram 
ggplot(diamonds, aes(price)) + 
  geom_histogram(colour = NA, fill = main2_color, binwidth = 100) + 
  xlim(0, 5000)

#Histogram for different cut options 
ggplot(diamonds, aes(price, fill = cut)) +
  geom_histogram(position = "dodge") + 
  scale_fill_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#The whole idea of the grammar of graphs 
ggplot(diamonds, aes(price, colour = cut)) + 
  geom_histogram(colour=decoration_color, fill = decoration_color, alpha = 0.2, size =0) +
  geom_freqpoly()+ 
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Introducing the color package 
library(RColorBrewer)
head(brewer.pal.info, 20)

#Color set - color brewer 
ggplot(diamonds, aes(price, colour = cut)) +  
  scale_colour_brewer(palette = "Accent")  +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly()  

#Colors in revers order
ggplot(diamonds, aes(price, colour = cut)) +  
  scale_colour_brewer(palette = "Accent", direction = -1)  +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly() 

#Color set - colour brewer
ggplot(diamonds, aes(price, colour = cut)) +  
  scale_colour_brewer(palette = "Set1") +
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha = 0.07, size =0) +
  geom_freqpoly()

#Zoom in again 
ggplot(diamonds, aes(price, colour = cut)) + 
  geom_histogram(colour=decoration_color, fill=decoration_color, alpha=0.2, size=0) +
  geom_freqpoly() + 
  scale_colour_manual(values=c("#478adb", "#1ce3cd", "#f206d3", "#bcc048", "#cccccc"))  + 
  xlim(0, 5000)

#Multiple: carat - histogram for the different cuts to facilitate comparison: first the simple version
ggplot(diamonds, aes(price)) + 
  geom_histogram(binwidth = 200, fill = main2_color) + 
  facet_wrap(. ~ cut)

#Small multiple histogram for carat by the different cuts to facilitate comparison: first the simple version
ggplot(diamonds, aes(price, fill = cut)) + 
  geom_histogram(binwidth = 200) + 
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +
  facet_wrap(. ~ cut)

#Boxplot

#Checking the options
?geom_boxplot

# Simple boxplot by category 
ggplot(diamonds, aes(cut, price)) +
  geom_boxplot(colour=main2_color)

# Boxplot using to numeric variable, we need to define a grouping rule
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 1)), color=main2_color)

# Smaller groups 
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.5)), color=main2_color)

# Even smaller groups 
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)), color=main2_color)

# Without outliers 
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)), 
               color=main2_color,
               outlier.alpha=0)

# Use a specific encoding for the outliers
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)), 
               color=main2_color,
               outlier.alpha = 0.1, 
               outlier.shape = 19, 
               outlier.color=decoration_color)

#Desnsity chart

#Checking the options
?geom_density

#Simple:carat - the same with a density chart
ggplot(diamoonds, aes(price)) +  
  geom_density(fill = main2_color, color = NA)

#Multiple density chart 
ggplot(data=diamonds, aes(price, group = cut, fill = cut)) +
  geom_density(adjust = 1.5 , color = NA) + 
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))   

#Multiple density chart, with using one colour and transparency we can identify easly the overlap as a more dense part through all cuts 
ggplot(data=diamonds, aes(price, group=cut, fill=cut)) +
  geom_density(adjust=1.5 , color= NA, fill=main2_color, alpha =0.1) 

#Small multiple denSity for carat by the different cuts 
ggplot(diamonds, aes(price, stat(density), fill=cut)) + 
  geom_density(binwidth = 0.2, color= NA) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +   
  facet_wrap(. ~ cut) 

#Ridgeline plot

#Checking the options
?geom_density_ridges

#Another way of creating small multiples is using the ridgeline plot 
ggplot(diamonds, aes(x = price, y = cut)) +
  geom_density_ridges(fill=main2_color, color=fill_color) 

#Encoding color 
ggplot(diamonds, aes(x = price, y = cut, fill=cut)) +
  geom_density_ridges(color=NA) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Introducing the scaling factor
ggplot(diamonds, aes(x = price, y = cut, fill = cut)) +
  geom_density_ridges(color=NA, scale = 8, size=0.1) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Using colour to represent x twice (viridis scale)
ggplot(diamonds, aes(x = price, y = cut, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_viridis_c() 

#Using colour (self defined) to represent x twice (own created scale)
ggplot(diamonds, aes(x = price, y = cut, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Adding lines for the quantile 
ggplot(diamonds, aes(x = price, y = cut)) +
  stat_density_ridges(scale=1, color=main2_color, fill="lightgrey", alpha=0.2, quantile_lines=TRUE) 

#Adding lines for the quantile, only median  
ggplot(diamonds, aes(x=price, y=cut)) +
  stat_density_ridges(scale=1, color=main2_color, fill="lightgrey", alpha=0.2, quantile_lines=TRUE, quantiles=2)

#Adding lines for the quantile 
ggplot(diamonds, aes(x=price, y=cut, fill = factor(stat(quantile)))) +
  stat_density_ridges(geom = "density_ridges_gradient", scale=1, quantile_lines=TRUE, calc_ecdf=TRUE, quantiles = c(0.025, 0.975))+
  scale_fill_manual(values = c(main2_color, "#282626", main1_color))

#Adding the actual points  
ggplot(diamonds, aes(x=price, y=cut)) +
  geom_density_ridges(scale=1, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=0.07, point_size=0.07, size=0.8) 

#Adding the actual points  
ggplot(diamonds, aes(x=price, y=cut)) +
  geom_density_ridges(scale=0.5, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=0.07, point_size=0.07, size=0.8, position="raincloud") 

#Encoding color 
ggplot(diamonds, aes(x = price, y = cut, fill=cut, color=cut)) +
  geom_density_ridges(scale=0.5, jittered_points=TRUE , 
                      point_alpha=0.1, point_size=0.07, size=0.8, position="raincloud") +
  scale_color_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048")) +
  scale_fill_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Using the iris data set 
ggplot(iris, aes(x = Sepal.Length, y = Species, fill = Species)) + 
  geom_density_ridges(color=NA, scale = 8, size=0.1) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675"))

#Using colour to represent x twice
ggplot(iris, aes(x = Sepal.Length, y = Species, fill = stat(x))) + 
  geom_density_ridges_gradient(color=NA, scale = 0.8, size=0.1) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Relationship analysis 

#Scatter plot 

#Checking the options
?geom_point

#Basic scatter plot 
ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(color=main2_color)

#Basic scatter plot - adjusting the size 
ggplot(diamonds, aes(x=carat, y=price)) +  
  geom_point(size=0.02, color=main2_color)

#Basic scatter plot - adjusting the opacity
ggplot(diamonds, aes(x=carat, y=price)) +  
  geom_point(size=0.02, alpha=0.09, color=main2_color) 

#Basic scatter plot - change y limits
ggplot(diamonds, aes(x=carat, y=price)) +  
  geom_point(size=0.2, alpha=0.2, color=main2_color) + 
  ylim(0, 5000) + 
  xlim(0, 2) 
  
#Axis labeling depending on the quantiles 
ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color=main2_color)  + 
  xlab("")+ 
  ylab("")+ 
  scale_x_continuous(breaks = round(as.vector(quantile(diamonds$carat)), digits = 1))+
  scale_y_continuous(breaks = round(as.vector(quantile(diamonds$price)), digits = 1))

#Basic scatter plot - color as visual encoding redundant  
ggplot(diamonds, aes(x=carat, y=price, color=price)) + 
  geom_point(size=0.02) 

#Adding price as another visual encoding using a color code 
ggplot(diamonds, aes(x=carat, y=price, colour = price)) +
  geom_point(size=0.04, alpha=0.12)+
  scale_colour_gradient(low = main1_color, high = main2_color) 

#Another way to handle big data sets is to create a sample  
diamonds_sample <- diamonds[sample(nrow(diamonds), 500),]

#Basic scatter plot 
ggplot(diamonds_sample, aes(x=carat, y=price)) + 
  geom_point(color=main2_color)

#Change the position scale to logarithmic scaling
ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(size=0.1, alpha=0.09, color=main2_color) +
  scale_x_log10() 

#Axis labeling depending on the quantiles for logaritmic scaling
ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color=main2_color)  + 
  xlab("")+ 
  ylab("")+ 
  scale_x_log10(breaks = round(as.vector(quantile(diamonds$carat)), digits = 1))+
  scale_y_continuous(breaks = round(as.vector(quantile(diamonds$price)), digits = 1))

#Adding a trend line 
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(color=main2_color, size=0.8, alpha=0.09)+
  stat_smooth(color=decoration_color)

#Small multiples - one variable
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(color=main2_color, size=0.8, alpha=0.09)+
  facet_wrap( ~ cut, ncol=2) +
  stat_smooth(color=decoration_color) 

#Small multiples - one variable with free scale 
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(color=main2_color, size=0.8, alpha=0.09)+
  facet_wrap( ~ cut, ncol=2, scales = "free") +
  stat_smooth(color=decoration_color)

#Small multiples- two variables
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(color=main2_color, size=0.8, alpha=0.09)+
  facet_wrap(color ~ cut) +
  stat_smooth(color=decoration_color)

#Dot-dash scatter plot 
ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color=main2_color) + 
  geom_rug(size=0.03, alpha=0.08, color=main2_color) + 
  xlab("") + 
  ylab("")

#Marginal plot to compare all simple distributions with the scatter plot relationship representation 

?ggMarginal

#Now we set the new defined theme to the default option 
theme_set(sandra_theme)

#Density
pp <- ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color=main2_color) + 
  theme(axis.title=element_blank(), axis.text=element_blank())

ggMarginal(pp, type = "density", fill=main2_color, alpha=1, color='transparent')

#Box-plot  

ggMarginal(pp, type = "boxplot", size=30, fill=main2_color)

#Histogram  

ggMarginal(pp, type = "histogram", size=20, fill=main2_color, colour=NA)

#Using the iris data set 

piris <- ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) +
  geom_point()

ggMarginal(piris, groupColour = TRUE, groupFill = TRUE)

#Beeswarm 

?geom_jitter()

#Simple jitter plot
ggplot(diamonds, aes(x=cut, y=price)) + 
  geom_jitter()

#Changing size and opacity 
ggplot(diamonds, aes(x=cut, y=price)) + 
  geom_jitter(size=0.2, alpha=0.2, color=main2_color)

#Switching axis
ggplot(diamonds, aes(y=cut, x=price)) + 
  geom_jitter(size=0.2, alpha=0.2, color=main2_color)

#Check the options
?geom_quasirandom()

#Simple beewswarm
ggplot(diamonds, aes(y=cut, x=price)) + 
  geom_quasirandom(size=0.2, alpha=0.2, color=main2_color, groupOnX=FALSE)

#Adding color
ggplot(diamonds, aes(y=cut, x=price, colour=cut)) + 
  geom_quasirandom(size=0.2, alpha=0.5, groupOnX=FALSE) +
  scale_colour_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Adding color
ggplot(diamonds, aes(y=cut, x=price, colour=cut)) + 
  geom_quasirandom(size=0.2, alpha=0.5, groupOnX=FALSE, method = "smiley") +
  scale_colour_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))

#Hexagonal binning

#Checking the options
?geom_hex

#Aggregation through hexagonal binning - defining the number of bins 
ggplot(diamonds, aes(x=carat, y=price))+ 
  geom_hex(bins=40, alpha = 0.6)+
  xlim(0, 5)+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Aggregation through hexagonal binning - logaritmic scaling 
ggplot(diamonds, aes(x=carat, y=price))  + 
  geom_hex(alpha = 0.6) +
  scale_x_log10(breaks = round(as.vector(quantile(diamonds$carat)), digits = 1))+
  scale_y_log10(breaks = round(as.vector(quantile(diamonds$price)), digits = 1))+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Checking the options
?geom_bin2d

#Heatmap based on rectangles
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_bin2d(bins = 50) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Change opacity
ggplot(diamonds, aes(x=carat, y=price)) +
  geom_bin2d(bins = 50, alpha = 0.6)+
  scale_fill_gradient(low=main2_color, high=main1_color) 

#Checking the options
?stat_density_2d

#Density estimation with contours
ggplot(diamonds, aes(x=carat, y=price)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon")  +
  scale_fill_continuous(type = "viridis") 

#Density estimation with contours
ggplot(diamonds, aes(x=carat, y=price)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Adding a stroke 
ggplot(diamonds, aes(x=carat, y=price)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white") +
  scale_fill_gradient(low=main2_color, high=main1_color)