
# DEMOGRAPHICS DATA --------------------------------------------------
#
# UW SEFS Graduate Student Financial Stress Survey

# Designed: Spring 2023 Quarter
# Polled: Spring 2023 Quarter
# Code by: Lauren Satterfield, Miro Stuke, Lety Santillana, ....
#
# PURPOSE: 
# --------------------------------------------------------------------

# clear workspace
# rm(list = ls(all.names = TRUE))

# install and load packages
install.packages("questionr")
library(tidyverse)
library(dplyr)
library(questionr) #for processing survey data

# read in raw data
survey <- read.csv(".csv")

# subset your data for only demographics
