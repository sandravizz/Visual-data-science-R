#Checking the version 

getRversion()

#Packages and libraries

#Install packages
if(!'ggplot2'%in%installed.packages()){
  install.packages('ggplot2')}
if(!'ggthemes'%in%installed.packages()){
  install.packages('ggthemes')}
if(!'nlme'%in%installed.packages()){
  install.packages('nlme')}
if(!'gapminder'%in%installed.packages()){
  install.packages('gapminder')}
if(!'gganimate'%in%installed.packages()){
  install.packages('gganimate')}
if(!'ggExtra'%in%installed.packages()){
  install.packages('ggExtra')}
if(!'psych'%in%installed.packages()){
  install.packages('psych')}
if(!'reshape2'%in%installed.packages()){
  install.packages('reshape2')}
if(!'dplyr'%in%installed.packages()){
  install.packages('dplyr')}
if(!'nycflights13'%in%installed.packages()){
  install.packages('nycflights13')}
if(!'ggcorrplot'%in%installed.packages()){
  install.packages('ggcorrplot')}
if(!'waffle'%in%installed.packages()){
  install.packages('waffle')}
if(!'tidyr'%in%installed.packages()){
  install.packages('tidyr')}
if(!'scales'%in%installed.packages()){
  install.packages('scales')}
if(!'ggalt'%in%installed.packages()){
  install.packages('ggalt')}
if(!'data.table'%in%installed.packages()){
  install.packages('data.table')}
if(!'extrafont'%in%installed.packages()){
  install.packages('extrafont')}
if(!'lubridate'%in%installed.packages()){
  install.packages('lubridate')}
if(!'DT'%in%installed.packages()){
  install.packages('DT')}
if(!'grid'%in%installed.packages()){
  install.packages('grid')}
if(!'gridExtra'%in%installed.packages()){
  install.packages('gridExtra')}
if(!"prettydoc" %in% installed.packages()) {
  install.packages("prettydoc")}
if(!"devtools" %in% installed.packages()) {
  install.packages("devtools")}
if(!"tidyverse" %in% installed.packages()) {
  install.packages("tidyverse")}
if(!"ggdark" %in% installed.packages()) {
  install.packages("ggdark")}
if(!"here" %in% installed.packages()) {
  install.packages("here")}
if(!"gifski" %in% installed.packages()) {
  install.packages("gifski")}
if(!"forcats" %in% installed.packages()) {
  install.packages("forcats")}
if(!"tufte" %in% installed.packages()) {
  install.packages("tufte")}
if(!"colorspace" %in% installed.packages()) {
  install.packages("colorspace")}
if(!"viridisLite" %in% installed.packages()) {
  install.packages("viridisLite")}
if(!"formatR" %in% installed.packages()) {
  install.packages("formatR")}
if(!"DiagrammeR" %in% installed.packages()) {
  install.packages("DiagrammeR")}
if(!"xaringan" %in% installed.packages()) {
  install.packages("xaringan")}
if(!"ggridges" %in% installed.packages()) {
  install.packages("ggridges")}
if(!"GGally" %in% installed.packages()) {
  install.packages("GGally")}
if(!"corrplot" %in% installed.packages()) {
  install.packages("corrplot")}
if(!"ggplot2movies" %in% installed.packages()) {
  install.packages("ggplot2movies")}
if(!"ggpointdensity" %in% installed.packages()) {
  install.packages("ggpointdensity")}
if(!"rstat" %in% installed.packages()) {
  install.packages("rstat")}
if(!"ggstatsplot" %in% installed.packages()) {
  install.packages("ggstatsplot")}
if(!"ggbeeswarm" %in% installed.packages()) {
  install.packages("ggbeeswarm")}
if (!require(devtools)) {
  install.packages('devtools')
}
devtools::install_github('Ather-Energy/ggTimeSeries')
devtools::install_github('erocoar/gghalves')

#Connect with the libraries
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
library(gifski)
library(forcats)
library(tufte)
library(colorspace)
library(viridisLite)
library(formatR)
library(DiagrammeR)
library(xaringan)
library(ggridges)
library(GGally)
library(ggplot2movies)
library(corrplot)
library(ggpointdensity)
library(ggstatsplot)
library(ggTimeSeries)
library(ggbeeswarm)
library(gghalves)