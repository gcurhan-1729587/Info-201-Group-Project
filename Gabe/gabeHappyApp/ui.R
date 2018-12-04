#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library("dplyr")

happy_info <- read.csv("../../Data/WH17.csv", stringsAsFactors = FALSE)

library("ggplot2")
library(shiny)

# Define UI for application that draws a histogram


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Correlation Between Generosity and Happiness"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("region_select", 
                  ("Select Region"), 
                  choices = c("Western Europe", 
                              "Central and Eastern Europe",
                              "Eastern Asia",
                              "Latin America and Caribbean",
                              "Middle East and Nothern Africa",
                              "North America",
                              "Southeastern Asia",
                              "Southern Asia",
                              "Sub-Saharan Africa"
                  ), selected = "Western Europe"
                )),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("BoxPlot")
    )
  )
)
)