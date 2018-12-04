#Server

# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)
happ17 <- read.csv("../../Data/WH17.csv")
happ16 <- read.csv("../../Data/WH16.csv")
happ15 <- read.csv("../../Data/WH15.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$freePlot <- renderPlot({
    ggplot(data = year) +
      geom_smooth(aes(x = Freedom, y = Happiness.Score)) +
      geom_point(aes(x = Freedom, y = Happiness.Score, color = Trust..Government.Corruption.)) +
      scale_color_gradient(low = "yellow", high = "blue") +
      labs(
        title = "Correlations: Happiness, Freedom, and Government Trust", 
        x = "Freedom", 
        y = "Happiness Score", # y-axis label (with units!)
        color = "Trust in Gov."
      )
      
      
    
  })
  
})
