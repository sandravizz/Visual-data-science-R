#Themes 

#Checking the theme options
?theme

#We can set a theme as default, for example 
theme_set(theme_bw())

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly() 

#Defining the general colors to avoid hard coding  
fill_color = '#111111'
decoration_color = '#cccccc'
main1_color = '#f20675'
main2_color = '#1ce3cd'

#Create a personalized theme
sandra_theme<-theme_bw() + theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  plot.title = element_text(size = 14, hjust = 0.2, color = decoration_color),
  axis.title = element_text(size = 10, hjust = 0.5, color = decoration_color),
  axis.text = element_text(colour = decoration_color, size = 8),
  axis.ticks = element_blank(),
  axis.line = element_line(colour = decoration_color, size=0.3, linetype = "dashed"), 
  panel.border = element_blank(),
  panel.grid = element_blank(),
  strip.text = element_text(size = 12, color = decoration_color),
  panel.background = element_blank(),
  strip.background =element_blank(),
  plot.background = element_blank(),
  legend.text	= element_text(size = 10, hjust = 0.5, color = decoration_color), 
  legend.position = c(0.815, 0.27),
  legend.key = element_blank(),
  legend.title = element_blank() 
)

#Now we set the new defined theme to default 
theme_set(sandra_theme)

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main1_color) 

#There is also a dark theme option with black background
theme_set(dark_theme_gray()+ theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  plot.title = element_text(size = 14, hjust = 0, color = decoration_color),
  axis.ticks = element_blank(),
  axis.title = element_text(size = 10, hjust = 0.5, color = decoration_color),
  legend.title = element_blank(),
  panel.background =element_rect(fill = fill_color),
  strip.background =element_rect(fill = fill_color), 
  plot.background = element_rect(fill = fill_color),
  legend.background = element_rect(fill = fill_color)
))

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main2_color) 

#No axis title
theme_set(dark_theme_gray()+ theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  axis.title = element_blank(),
  axis.text = element_text(colour = decoration_color, size = 9),
  axis.ticks = element_blank(),
  legend.title = element_blank(),
  panel.background =element_rect(fill = fill_color),
  strip.background =element_rect(fill = fill_color), 
  plot.background = element_rect(fill = fill_color),
  legend.background = element_rect(fill = fill_color)
))

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main2_color) 

#Setting the theme 
Tufte_theme <- theme_tufte(ticks = FALSE, base_size = 16)
theme_set(Tufte_theme) 

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = fill_color) 
