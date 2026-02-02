# -------------------------------------------------------------------- #
#  Introduction course in R - Exercise saving ggplots
#
# 
#
#  remarks: this is the solution 
#  author: S.Herzog
#  status: 29.01.2025
# -------------------------------------------------------------------- #

  # clear all objects from workspace
    rm(list = ls())
    

# -------------------------------------------------------------------- #
#   Load packages ----
# -------------------------------------------------------------------- #
    
   library(ggplot2)
   library(tidyverse)
    
# -------------------------------------------------------------------- #
#   Task 1 - Prepare dataset ----
# -------------------------------------------------------------------- #
    
  # save datat set 'iris' in 'dt_iris'
  
    dt_iris <- iris
    
  # Look at dt_iris
    dt_iris %>% 
      filter(row_number() < 6) %>% 
      flextable::flextable() 
    
# -------------------------------------------------------------------- #
#   Task 2 - Create plot ----
# -------------------------------------------------------------------- #
  # Run the code to create scatter plot as shown on the slide  
    
    lab_species <- c("Iris setosa", "Iris virginica", "Iris versicolor")
    
    plot_iris_f <-
      ggplot(data = dt_iris, aes(x = Sepal.Length, y = Sepal.Width, fill = Species)) +
      geom_point(aes(shape = Species), size = 3, alpha = 0.7) +
      
      scale_fill_manual(values = c("darkred", "blue", "orange"),
                        labels = lab_species) +
      scale_shape_manual(values = c(21, 22, 24),
                         labels = lab_species) +
      labs(title = "Dataset Iris") +
      xlab("Sepal length [cm]") +
      ylab("Sepal width [cm]") +
      coord_cartesian(xlim = c(4, 8), ylim = c(2, 5)) +
      theme_bw() +
      theme(plot.title = element_text(face = "bold", size = 25),
            axis.title = element_text(size = 20),
            axis.text = element_text(size = 14),
            legend.title = element_text(size = 16),
            legend.text = element_text(size = 14)) 
    
    plot_iris_f
    
    
    
# -------------------------------------------------------------------- #
#   Task 3 - Save plot ----
# -------------------------------------------------------------------- #
    
  # a) Save the ggplot using function ggsave() as 'png' 
    
    ggsave(filename = "plot_iris_ggsave_v20250130.png", 
           path = "R/Routput/",
           plot = plot_iris_f)
  
  # b) Try to change/include following arguments in the function ggsave() and look at the output in folder 'Routput'  
    
    ggsave(filename = "plot_iris_ggsave_v20250130_new.png", 
           path = "R/Routput/",
           plot = plot_iris_f, 
           units = "cm", width = 12, height = 7, scale = 2)
    