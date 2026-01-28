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
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar() 

 # a) change color and fill of bars
    
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar(fill = "darkgreen", color = "black")
     
 # b) change background of graph using 'theme_bw()'
    
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar(fill = "darkgreen", color = "black") +
      theme_bw() 
    
 # c) we need to change the angle of the labels on the x-axis
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar(fill = "darkgreen", color = "black") +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
   
 # d) Use the same plot and change from absolute frequencies to relative frequencies.
    
    ggplot(data = dt_mpg, 
           mapping = aes(x = manufacturer,
                         y = after_stat(prop), group = 1)) +
      geom_bar(fill = "darkgreen", color = "black") +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
 # e) Do you find a way to change the y axis to display %?
    
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar(aes(y = after_stat(prop), group = 1),
               fill = "darkgreen", color = "black") +
      
      scale_y_continuous(labels = scales::percent) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
    
    
 # f) Can you get rid of the 'prop' as y axis title?
    
    ggplot(data = dt_mpg, mapping = aes(x = manufacturer)) +
      geom_bar(aes(y = after_stat(prop), group = 1),
               fill = "darkgreen", color = "black") +
      
      scale_y_continuous(labels = scales::percent) +
      theme_bw() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1),
            axis.title.y = element_blank()) 

# -------------------------------------------------------------------- #
#   Task 2 - Histogram ----
# -------------------------------------------------------------------- #

  # histogram
    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram() 
    
  # a) change color and fill of bars
    
    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram(fill = "darkgreen", color = "black") 
    
  # b) change background of graph using 'theme_bw()' (or one you prefer)
    
    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram(fill = "darkgreen", color = "black") +
      theme_bw()
    
  # c) we might want to change the interval width into 0.25 liter
   
    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram(fill = "darkgreen", color = "black",
                     binwidth = 0.25) +
      theme_bw()
    
  # d) change x axis title to 'Engine displacement [l]' using xlab()
    
    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram(fill = "darkgreen", color = "black",
                     binwidth = 0.25,) +
      xlab("Engine displacement [l]") +
      theme_bw() 
    
  # e) save the output in object p_hist_displ
    
    p_hist_displ <-
      ggplot(data = dt_mpg, mapping = aes(x = displ)) +
        geom_histogram(fill = "darkgreen", color = "black",
                       binwidth = 0.25,) +
        xlab("Engine displacement [l]") +
        theme_bw() 
   
  # f) Reuse the histogram code from above and retrieve histograms by "type" of car (class)   

    ggplot(data = dt_mpg, mapping = aes(x = displ)) +
      geom_histogram(fill = "darkgreen", color = "black",
                     binwidth = 0.25,) +
      xlab("Engine displacement [l]") +
      theme_bw()  + 
      facet_grid(class ~.)

    # or other solution
    
    p_hist_displ +
      facet_grid(class ~.)

# -------------------------------------------------------------------- #
#   Task 3 - Box plot ----
# -------------------------------------------------------------------- #

  # box plot
    p_boxplot_displ <-
      ggplot(data = dt_mpg, mapping = aes(y = displ)) +
        geom_boxplot(fill = "darkgreen", color = "black") +
        ylab("Engine displacement [l]") +
        theme_bw() 
    
    p_boxplot_displ
  
  # a) Adapt the box plot such that it illustrates the engine displacement in litres (displ) by  "type" of car (class)  
    p_boxplot_displ <-
      ggplot(data = dt_mpg, mapping = aes(y = displ, x = class)) +
        geom_boxplot(fill = "darkgreen", color = "black") +
        ylab("Engine displacement [l]") +
        theme_bw() 
    
    p_boxplot_displ  
    
# -------------------------------------------------------------------- #
#   Task 4 - Combine different plots in one big plot ----
# -------------------------------------------------------------------- #

  # a) We need to install the package 'cowplot' in order to use the function plot_grid()
    
    # install.packages('cowplot') # if not already installed
    library(cowplot)
 
  # b) Adapt the given code 
    cowplot::plot_grid(p_boxplot_displ, p_hist_displ)
    
    cowplot::plot_grid(p_boxplot_displ, p_hist_displ, 
                       labels = c("A", "B"), nrow = 2)
    

# -------------------------------------------------------------------- #
#   Task 5 - Scatterplot ----
# -------------------------------------------------------------------- #

  # a) Create a scatter plot with engine displacement (displ) on x axis and highway miles per gallon (hwy) on y axis.
    
    ggplot(data = dt_mpg, mapping = aes(x = displ, y = hwy)) +
      geom_point() +
      theme_bw() 
    
  # b) Adapt axis titles accordingly
    
    ggplot(data = dt_mpg, mapping = aes(x = displ, y = hwy)) +
      geom_point() +
      
      xlab("Engine displacement [l]") +
      ylab("Highway miles per gallon") +
     
      theme_bw() 
    
  # c) As highway miles per gallon (hwy) is only measured in integers it is likely that we have overlapping observations
    
    ggplot(data = dt_mpg, mapping = aes(x = displ, y = hwy)) +
      geom_point(alpha = 0.3) +
      
      xlab("Engine displacement [l]") +
      ylab("Highway miles per gallon") +
      
      theme_bw() 
    
  # d) We want to differentiate if number of cylinders (cyl) is >5 or not
    
    ggplot(data = dt_mpg, 
           mapping = aes(x = displ, y = hwy, color = (cyl > 5))) +
      geom_point(alpha = 0.3) +
      
      xlab("Engine displacement [l]") +
      ylab("Highway miles per gallon") +
     
      theme_bw() 
    
  # e) Adapt the legend title to 'Number of cylinders'
    
    ggplot(data = dt_mpg, 
           mapping = aes(x = displ, y = hwy, color = (cyl > 5))) +
      geom_point(alpha = 0.3) +
      
      xlab("Engine displacement [l]") +
      ylab("Highway miles per gallon") +
      
      labs(color = "Number of cylinders") +
      
      theme_bw() 
    
  # f) Adapt legend from TRUE/FALSE to >5 and <=5 and the colors used to 'blue' and 'red'
    
    ggplot(data = dt_mpg, mapping = aes(x = displ, y = hwy, 
                                        color = (cyl > 5))) +
      geom_point(alpha = 0.3) +
      
      xlab("Engine displacement [l]") +
      ylab("Highway miles per gallon") +
      labs(color = "Number of cylinders") +
      scale_color_manual(labels = c(">5", "<=5"),
                         values = c("blue", "red"))+
      theme_bw() 
    
# -------------------------------------------------------------------- #
#   Task 6 - Line plot ----
# -------------------------------------------------------------------- #

  # a) Create a plot with points and lines to show theophylline concentration in the subjects over time.
  
    ggplot(data = dt_theoph, mapping = aes(x = Time, y = conc,
                                group = Subject)) +
      geom_point() +
      geom_line() +
     
      theme_bw() 
    
  # b) Adapt axis titles accordingly
  
    ggplot(data = dt_theoph, mapping = aes(x = Time, y = conc,
                                group = Subject)) +
      geom_point() +
      geom_line() +
      
      xlab("Time since drug administration  [hr]") +
      ylab("Theophylline concentration in the sample [mg/L]") +
      
      theme_bw() 
    
  # c) We want to differentiate if dose of theophylline administered orally to the subject (Dose) is >4.5 or not
   
    ggplot(data = dt_theoph, mapping = aes(x = Time, y = conc,
                                group = Subject, color = (Dose > 4.5))) +
      geom_point() +
      geom_line() +
      
      xlab("Time since drug administration  [hr]") +
      ylab("Theophylline concentration in the sample [mg/L]") +
     
      theme_bw() 
    
  # d) Adapt the legend title and legend accordingly
    
    ggplot(data = dt_theoph, mapping = aes(x = Time, y = conc,
                                group = Subject, color = (Dose > 4.5))) +
      geom_point() +
      geom_line() +
      
      xlab("Time since drug administration  [hr]") +
      ylab("Theophylline concentration in the sample [mg/L]") +
      labs(color = "Dose") +
      scale_color_manual(labels = c(">4.5", "<=4.5"),
                         values = c("purple", "orange"))+
      theme_bw() 
    

# -------------------------------------------------------------------- #
#   Task 7 - iris ----
# -------------------------------------------------------------------- #

  # a) Create a scatter plot as in the slide 'Example - Iris: adding title'
    
    p_iris_scatter <- 
      ggplot(data = dt_iris, 
             aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
        geom_point(size = 3) +
        labs(title = "Dataset Iris") +
        theme_bw()
    
    p_iris_scatter
    
  # b) Create a scatterplot as in the slide 'Example - Iris: using another geom'
    
    p_iris_box <-
      
      ggplot(data = iris, 
             aes(x = Species, y = Sepal.Width, fill = Species)) +
        geom_boxplot() +
        labs(title = "Dataset Iris") +
        theme_bw()
    
    p_iris_box
    
  # c) Combine these two plots within one plot as panel A and panel B

    cowplot::plot_grid(p_iris_scatter, p_iris_box, 
                       labels = c("A", "B"), nrow = 2)
    