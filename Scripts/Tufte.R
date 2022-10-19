#Tufte Charts 

#Setting the theme 
Tufte_theme <- theme_tufte(ticks = FALSE, base_size = 16)
theme_set(Tufte_theme) 

ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(size=0.02, alpha=0.09, color="#f206d3") + 
  geom_rangeframe(size=2) 

#Tufte Boxplot
ggplot(quakes, aes(factor(mag),stations)) + 
  geom_tufteboxplot(outlier.colour="transparent", color= "#f206d3") + 
  theme(axis.title=element_blank()) +
  annotate("text", x = 50, y = 120, adj=1,  family="serif", label = c(""))

#With the diamond dataset
ggplot(diamonds, aes(factor(cut),price)) + 
  geom_tufteboxplot(outlier.colour="transparent", size=0.5, color= "#f206d3") + 
  theme(axis.title=element_blank()) +
  annotate("text", x = 25, y = 20, adj=1,  family="serif", label = c(""))

#With the diamond dataset
ggplot(gapminder, aes(factor(continent),lifeExp)) + 
  geom_tufteboxplot(outlier.colour="transparent", size=2, color= "#f206d3") + 
  theme(axis.title=element_blank()) 

#Range-frame plot - showing lables only for the quantiles
ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color="#f206d3")  + 
  xlab("")+ 
  ylab("")+ 
  scale_x_continuous(breaks = round(as.vector(quantile(diamonds$carat)), digits = 1))+
  scale_y_continuous(breaks = round(as.vector(quantile(diamonds$price)), digits = 1))

#Dot-dash scatterplot 
ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color="#f206d3") + 
  geom_rug(size=0.03, alpha=0.08, color="#f206d3") + 
  xlab("") + 
  ylab("")

#Marginal plot to compare all simple distributions with the scatterplot relationship representation 

#Density
pp <- ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color="#f206d3") + 
  theme(axis.title=element_blank(), axis.text=element_blank())

ggMarginal(pp, type = "density", fill="#f206d3", alpha=1, color='transparent')

ppp <- ggplot(gapminder, aes(lifeExp, gdpPercap)) + 
  geom_point(size=1, alpha=1, color="#f206d3") 

ggMarginal(ppp, type = "density", fill="#f206d3", alpha=1, color='transparent')

#Box-plot  
pp <- ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color="blue") + 
  theme(axis.title=element_blank(), axis.text=element_blank())

ggMarginal(pp, type = "boxplot", size=30, fill="blue")

#Histogram  
pp <- ggplot(diamonds, aes(carat, price)) + 
  geom_point(size=0.02, alpha=0.09, color="blue") + 
  theme(axis.title=element_blank(), axis.text=element_blank())

ggMarginal(pp, type = "histogram", size=20, fill="blue")

