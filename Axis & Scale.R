#Scales 

#Check on the data 
names(gapminder)
head(gapminder, n=10)
str(gapminder)
summary(gapminder)

#General scatter plot  
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color)   

#Apply a log scale to the X axis postiion 
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color) +
  scale_x_log10()  

#Apply a a linear transformation to the Y axis position with limits 
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color) +
  scale_x_log10() +
  scale_y_continuous(limits = c(0, 60))

#Apply a a linear transformation to the Y axis position with defining the breaks 
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color) +
  scale_x_log10() +
  scale_y_continuous(breaks = c(0, 20, 25, 35, 40, 45, 50, 55, 60, 80))

#Add labels  
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color) +
  scale_x_log10() +
  scale_y_continuous(breaks = c(30, 40, 60), label = c("low", "center", "high"))

#Change the Y scale in reverse 
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(colour = main2_color) +
  scale_x_log10() +
  scale_y_reverse()

#Add another visual encoding size 
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop)) +
  geom_point(colour = main2_color) +
  scale_x_log10()  +
  scale_size()  

#Apply a scale rage to the variable size  
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, alpha=pop)) +
  geom_point(colour = main2_color) +
  scale_x_log10()  +
  scale_size(range = c(2, 12))  

#Add another visual encoding color 
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop,  colour = continent)) +
  geom_point() +
  scale_x_log10()  +
  scale_size(range = c(2, 12)) +
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Apply another scale to color  
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop,  color = continent)) +
  geom_point() +
  scale_x_log10()  +
  scale_size(range = c(2, 12)) +
  scale_colour_manual(values = continent_colors) +
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Change to facet   
ggplot(gapminder, aes(gdpPercap, lifeExp,  colour = continent)) +
  geom_point() +
  scale_x_log10()  +
  scale_size(range = c(2, 12)) +
  scale_colour_manual(values = continent_colors) +
  facet_wrap(~continent) +
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Adding transparency    
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop,  colour = continent)) +
  geom_point(alpha=0.2) +
  scale_x_log10()  +
  scale_size(range = c(2, 12)) +
  scale_colour_manual(values = continent_colors) +
  facet_wrap(~continent) +
  scale_colour_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Creating a subsample and define the color scale 
diamonds_sample <- diamonds[sample(nrow(diamonds), 1000),]

d <- ggplot(diamonds_sample, aes(carat, price)) +
    geom_point(aes(colour = cut))+
    facet_wrap(~cut)

# Change scale label
d + scale_colour_brewer("Diamond\nclarity")
d + scale_colour_brewer(palette = "Greens")
d + scale_colour_brewer(palette = "Set1")

# scale_fill_brewer works just the same as
# scale_color_brewer but for fill colors
p <- ggplot(diamonds, aes(x = price, fill = cut)) +
  geom_histogram(position = "dodge", binwidth = 1000)

p + scale_fill_brewer()

# the order of color can be reversed
p + scale_fill_brewer(direction = -1)

#Creating some random numbers
df <- data.frame(
  x = runif(100),
  y = runif(100),
  z1 = rnorm(100),
  z2 = abs(rnorm(100))
)

#Check on the data 
names(df)
head(df, n=10)
str(df)
summary(df)

# Default colour scale colours from light blue to dark blue
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z2))

# For diverging colour scales use gradient2
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z1), size=5) +
  scale_colour_gradient2()

# Adjust colour choices with low and high
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z2), size=5) +
  scale_colour_gradient(low = "red", high = "blue")

#Check on the data 
names(mtcars)
head(mtcars, n=10)
str(mtcars)
summary(mtcars)

#Creating color scale manual 
p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point(aes(colour = factor(cyl)))

p + scale_colour_manual(values = c("red", "blue", "green"))

#Check on the data 
names(mpg)
head(mpg, n=10)
str(mpg)
summary(mpg)

# Scale size 
p <- ggplot(mpg, aes(displ, hwy, size = hwy)) +
  geom_point()
plot(p)

p + scale_size("Highway mpg")
p + scale_size(range = c(0, 10))

# If you want zero value to have zero size, use scale_size_area:
p + scale_size_area()

# If you want to map size to radius (usually bad idea), use scale_radius
p + scale_radius()

#Axis

# Flip the X and Y axis 
p + coord_flip()

# Reverse the X and Y Axis 
p + scale_x_reverse() + scale_y_reverse()

# Zoom in by defining the limits of the axis 
p + coord_cartesian(xlim=c(0,5), ylim=c(0, 20)) 
