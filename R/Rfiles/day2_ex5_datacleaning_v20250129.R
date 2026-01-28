# -------------------------------------------------------------------- #
#  Course Introduction to R
#    Example ’messy_glucose.xlsx’
#
# 
#  input:   messy_glucose.xlsx
#  output:  messy_glucose_prepared_vYYYYMMDD.Rdata
#  purpose: -
#
#  remarks: - 
#  author:  Sereina Herzog
#  status:  29.01.2025
# -------------------------------------------------------------------- #

 # clear workspace
   rm(list=ls(all=TRUE))
  
 # general information about data set version  
  
   date_prepared <- "20250129" 
  
 
# ------------------------- #
#  PATHS ----
# ------------------------- #
  
  # paths laptop
    
    path_Rfiles <- "R/Rfiles/"
  
    path_Rdata <- "R/Rdata/"
    
      
# ------------------------- #
#  LIBRARIES ----
# ------------------------- #
  
    library(tidyverse)
    library(ggplot2)
    library(readxl) # good package for .xlsx

 
# ------------------------- #
#  FUNCTIONS ----
# ------------------------- #
 
     # not needed in this exercise
  
    
    
# --------------------------------------------------------------------------- #
#  INPUT ----
# --------------------------------------------------------------------------- #
  # ------------------------- #
  ##  file names input ----
  # ------------------------- #
   
    # get name of file in folder Rdata 
       file_input <- "messy_glucose.xlsx"
      
      # note: interesting function to look at: list.files()
        
  # ------------------------- #
  ##  file names output ----
  # ------------------------- #  
    
   
    # create output name for dataset
      file_output_rdata <- paste0("messy_glucose_prepared_v",
                                  date_prepared,
                                  ".Rdata")
    
  
  
  
# --------------------------------------------------------------------------- #
#  INFORMATION GENERAL ----
# --------------------------------------------------------------------------- #

    info <- list()

  ## General information ----
    info_general <-
      tibble(Topic = c("Original data file",
                       
                       "Date prepared",
                       "Current data file"
                       ),

             Name = c(file_input,
                    
                      date_prepared,
                      file_output_rdata
                    )
      )

      info$general <- info_general


# --------------------------------------------------------------------------- #
#  DATA IMPORT ----
# --------------------------------------------------------------------------- #
  # hints: range, cell_rows(), col_names    
      dt_tmp <-
        readxl::read_xlsx()
      
# --------------------------------------------------------------------------- #
#  DATA PREPARATION ----
# --------------------------------------------------------------------------- #
  # 1. step cleaning 
      
 # dt_glucose <-   
      dt_tmp 
        # get rid of empty columns
          
        # get rid of empty rows (= no pat_id)
          
        # change pat_id to be a string variable
          
        # give Race and Sex labels
       
      
      # note: interesting functions: across()
   
  # 2.step calculate/create parameters needed
   dt_glucose <-
      dt_glucose %>% 
        # glucose_diff = POST - PRE
          
        # age at date 10.11.2023
          mutate(tmp = difftime(time2 = DofB, time1 = as.Date(x = "10.11.2023",
                                                              format = "%d.%m.%Y"),
                                units = "days"),
                 age = as.numeric(tmp)/365.25) %>% 
          select(-tmp)
         
  
      
    # check class of all parameters in dataset
      str(dt_glucose)
 
      
# --------------------------------------------------------------------------- #
# Dictionary ----
# --------------------------------------------------------------------------- #
 # sometimes detailed dictionary is available
  
   # dictionary <-
   #    tibble(parameter = names(dt_supraclavicular),
   #           parameter_label = c("Subject ID",
   #                               'Gender',
   #                               'BMI',
   #                               
   #                               'Total opioid consumption [mg]'),
   #           parameter_info = c("Subject ID",
   #                              'Gender',
   #                              'Body mass index',
   #                             
   #                              'Total opioid consumption')
   #           )  
   #    
   # info$dictionary <- dictionary    
        
# --------------------------------------------------------------------------- #
# SAVE ----
# --------------------------------------------------------------------------- #
 
      save(
        # information about dataset
          info,
          
        # datasets  
          dt_glucose,
       
        
        # path & name where workspace is saved as Rdata
        file = paste0(path_Rdata, file_output_rdata)
      
      )    
        
 
   
          