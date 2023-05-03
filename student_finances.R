
# STUDENT FINANCES DATA --------------------------------------------------
#
# UW SEFS Graduate Student Financial Stress Survey

# Designed: Spring 2023 Quarter
# Polled: Spring 2023 Quarter
# Code by: Lety Santillana, Fern Crossway, ....
#
# PURPOSE: 
# ------------------------------------------------------------------------

# clear workspace
# rm(list = ls(all.names = TRUE))

# install and load packages
#install.packages("questionr")
library(tidyverse)
library(dplyr)
#library(questionr) #for processing survey data

# read in raw data
survey <- read.csv("SEFS Graduate Student Finances Survey_49 responses.csv")

# subset your data for only student finances

student_fin <- survey[8:25]

#str(student_fin)
#colnames(student_fin)

data_means <- student_fin %>% select(2, 4:7, 11:12, 16:17) %>% summarise(across(everything(), mean, na.rm = TRUE))
  ## data points edited in excel to remove special characters and letters
  ## some data points were ranges--these were averaged 


