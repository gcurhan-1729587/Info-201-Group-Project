#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
happy_info <- read.csv("../../Data/WH17.csv", stringsAsFactors = FALSE)

library("ggplot2")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$BoxPlot <- renderPlot({
    
    if(input$region_select == "Western Europe"){
      region <- happy_info %>%
        filter(Region == "Western Europe")
    } 
    else if(input$region_select == "Central and Eastern Europe"){
      region <- happy_info %>%
        filter(Region == "Central and Eastern Europe")
    }
    else if(input$region_select == "Eastern Asia"){
      region <- happy_info %>%
        filter(Region == "Eastern Asia")
    }
    else if(input$region_select == "Latin America and Caribbean"){
    region <- happy_info %>%
      filter(Region == "Latin America and Caribbean")
    }
   else if(input$region_select == "Middle East and Nothern Africa"){
    region <- happy_info %>%
      filter(Region == "Middle East and Nothern Africa")
    }
   else if(input$region_select == "North America"){
    region <- happy_info %>%
      filter(Region == "North America")
    }
   else if(input$region_select == "Southeastern Asia"){
      region <- happy_info %>%
        filter(Region == "Southeastern Asia")
   }
    else if(input$region_select == "Southern Asia"){
      region <- happy_info %>%
        filter(Region == "Southern Asia")
    }
    else {
      region <- happy_info %>%
        filter(Region == "Sub-Saharan Africa")
    }
    
    ggplot(data = region) + 
      geom_bar(aes(x = Country, fill = Generosity, weight = Happy.score)) + 
      scale_fill_gradient(low = "green", high = "red") +
      coord_flip() +
      labs(title = "Happiness Score Boxplot",
           x = "Country",
           y = "Happiness Score")

    
})
})
