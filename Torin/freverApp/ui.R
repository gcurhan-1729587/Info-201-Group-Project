# UI
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Effect of Freedom on Happiness"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("select_year", 
                  ("Select Year"), 
                  choices = c("2017", 
                              "2016",
                              "2015"
                  ),
                  selected = happ17)),
  
  
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("freePlot")
  )
)
)
)