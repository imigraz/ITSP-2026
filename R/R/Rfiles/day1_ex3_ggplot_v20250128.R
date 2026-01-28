# -------------------------------------------------------------------- #
#  Introduction course in R - Exercise ggplot
#
# 
#
#  remarks: this is the solution 
#  author: S.Herzog
#  status: 28.01.2025
# -------------------------------------------------------------------- #

  # clear all objects from workspace
    rm(list = ls())


# -------------------------------------------------------------------- #
#   Load packages ----
# -------------------------------------------------------------------- #

    library(ggplot2)
    library(tidyverse)

# -------------------------------------------------------------------- #
#   Prepare datasets ----
# -------------------------------------------------------------------- #

  # Fuel economy data ‘mpg’

    dt_mpg <- mpg

  # Pharmacokinetics of Theophylline ‘Theoph’
    
    dt_theoph <- Theoph
    
  # Famous iris data ‘iris’
    
    dt_iris <- iris

# -------------------------------------------------------------------- #
#   Task 1 - Bar charts ----
# -------------------------------------------------------------------- #

  # bar chart
    ggplot(data = dt_mpg, aes(x = manufacturer)) +
      geom_bar() 

 # a) change color and fill of bars
    
     
 # b) change background of graph using 'theme_bw()'
    
    
 # c) we need to change the angle of the labels on the x-axis
  
   
 # d) Use the same plot and change from absolute frequencies to relative frequencies.
  
    
 # e) Do you find a way to change the y axis to display %?
    
    
    
 # f) Can you get rid of the 'prop' as y axis title?
    


# -------------------------------------------------------------------- #
#   Task 2 - Histogram ----
# -------------------------------------------------------------------- #

  # histogram
    ggplot(data = dt_mpg, aes(x = displ)) +
      geom_histogram() 
    
  # a) change color and fill of bars
    
   
    
  # b) change background of graph using 'theme_bw()' (or one you prefer)
    
   
    
  # c) we might want to change the interval width into 0.25 liter
   
   
    
  # d) change x axis title to 'Engine displacement [l]' using xlab()
    
   
    
  # e) save the output in object p_hist_displ
    
   
   
  # f) Reuse the histogram code from above and retrieve histograms by "type" of car (class)   

    


# -------------------------------------------------------------------- #
#   Task 3 - Box plot ----
# -------------------------------------------------------------------- #

  # box plot
    p_boxplot_displ <-
      ggplot(data = dt_mpg, aes(y = displ)) +
        geom_boxplot(fill = "darkgreen", color = "black") +
        ylab("Engine displacement [l]") +
        theme_bw() 
    
    p_boxplot_displ
  
  # a) Adapt the box plot such that it illustrates the engine displacement in litres (displ) by  "type" of car (class)  
   
    
# -------------------------------------------------------------------- #
#   Task 4 - Combine different plots in one big plot ----
# -------------------------------------------------------------------- #

  # a) We need to install the package 'cowplot' in order to use the function plot_grid()
    
    # install.packages('cowplot') # if not already installed
    
 
  # b) Adapt the given code 
    cowplot::plot_grid(p_boxplot_displ, p_hist_displ)
   

# -------------------------------------------------------------------- #
#   Task 5 - Scatterplot ----
# -------------------------------------------------------------------- #

  # a) Create a scatter plot with engine displacement (displ) on x axis and highway miles per gallon (hwy) on y axis.
    
    ggplot(data = dt_mpg, aes(x = displ, y = hwy)) +
      geom_point() +
      theme_bw() 
    
  # b) Adapt axis titles accordingly
    
    
    
  # c) As highway miles per gallon (hwy) is only measured in integers it is likely that we have overlapping observations
   
    
  # d) We want to differentiate if number of cylinders (cyl) is >5 or not
    
  
    
  # e) Adapt the legend title to 'Number of cylinders'
    
    
  # f) Adapt legend from TRUE/FALSE to >5 and <=5 and the colors used to 'blue' and 'red'
    
  
    
# -------------------------------------------------------------------- #
#   Task 6 - Line plot ----
# -------------------------------------------------------------------- #

  # a) Create a plot with points and lines to show theophylline concentration in the subjects over time.
  
   
    
  # b) Adapt axis titles accordingly
  
   
    
  # c) We want to differentiate if dose of theophylline administered orally to the subject (Dose) is >4.5 or not
   
   
    
  # d) Adapt the legend title and legend accordingly
    
 
    

# -------------------------------------------------------------------- #
#   Task 7 - iris ----
# -------------------------------------------------------------------- #

  # a) Create a scatter plot as in the slide 'Example - Iris: adding title'
    
  
    
  # b) Create a scatterplot as in the slide 'Example - Iris: using another geom'
    
    
    
  # c) Combine these two plots within one plot as panel A and panel B

   