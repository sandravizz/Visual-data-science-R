---
title: "Explorative Analysis"
subtitle: "Discovering patterns by visualising distriubtions and relationships"
author: "Sandra Becker"
date: "06/09/2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Explorative Analysis 

```{r , include=FALSE}

#Loading the libaries

library(ggplot2)
library(ggthemes)
library(nlme)
library(gganimate)
library(gapminder)
library(ggExtra)
library(psych)
library(reshape2)
library(dplyr)
library(nycflights13)
library(ggcorrplot)
library(waffle)
library(tidyr)
library(scales)
library(ggalt)
library(data.table)
library(extrafont)
library(lubridate)
library(DT)
library(grid)
library(gridExtra)
library(prettydoc)
library(devtools)
library(tidyverse)
library(ggdark)
library(here)
library(png)
library(gifski)
library(forcats)
library(tufte)
library(colorspace)
library(viridisLite)
library(Zelig)
library(formatR)
library(DiagrammeR)
library(xaringan)
library(ggridges)
library(GGally)

```

```{r , include=FALSE}

#Defining the theme
 
fill_color = '#111111'
decoration_color = '#cccccc'
main1_color = '#f20675'
main2_color = '#1ce3cd'

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

```

### Frequency charts 

```{r }

#Changing the binwidth
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main2_color, binwidth = 0.001) 

#Adding another visual encoding, cut as colour
ggplot(diamonds, aes(price, colour = cut)) +
  geom_freqpoly(binwidth = 500)+ 
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

```
