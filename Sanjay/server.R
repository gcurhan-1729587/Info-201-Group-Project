library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

my_server <- function(input, output) {
  
  df <- reactive({
    return(read.csv(paste0("Data/WH", input$year,".csv")))
  })
  
  output$country <- renderText({
    paste0("SUMMARY GOES HERE")
  })

  output$countryPlot <- renderPlotly({
    if (input$year == "17") {
      dataset <- df() %>%
        filter(Country %in% data_2016$Country) 
      temp <- filter(data_2016, Country %in% data_2017$Country) %>%
        select(Region, Country)
      dataset <- left_join(data_2017,temp)
    } else {
      dataset <- df()
    }
    plot_ly(dataset, 
            x=~Economy..GDP.per.Capita. / Happiness.Score * 100, y=~Health..Life.Expectancy. / Happiness.Score * 100, color=~Region, type = "scatter",
            text = ~paste("Country:", Country)) %>% 
            layout(title = "GDP and Life Expectancy per region as percentages of Overall Happiness", 
             xaxis = list(title = "GDP per Capita (%)"),
             yaxis = list(title = "Health / Life Expectancy (%)"))
  })
  
}

shinyServer(my_server)