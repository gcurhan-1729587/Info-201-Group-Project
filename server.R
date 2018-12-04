library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)
library(data.table)

server <- function(input, output) {
  selectedData <- reactive({
    dataPath <- paste0("Data/WH", input$year, ".csv")
    data <- read.csv(dataPath) %>%
      subset()
  })
  
  output$heatPlot <- renderPlot({
    editedData <-selectedData() %>% 
      mutate(Country = sub("United States", "USA",  Country)) %>% 
      mutate(Country = sub("United Kingdom", "UK", Country))
    map.world <- map_data('world')
    mapped <- left_join(map.world, editedData, by = c('region' = 'Country'))
    ggplot(data = mapped, aes(x = long, y = lat, group = group)) +
      geom_polygon(aes(fill = Happiness.Score)) + 
      labs(title = "Happiness Score by Nation", x = "Longitude", y = "Latitude", fill = "Happiness Score") +
      coord_fixed()
  })

  output$gdpPlot <- renderPlotly({
    plot_ly(data = selectedData(), 
            x=~Economy..GDP.per.Capita. / Happiness.Score * 100, y=~Health..Life.Expectancy. / Happiness.Score * 100, color=~Region, type = "scatter",
            text = ~paste("Country:", Country)) %>% 
      layout(title = "GDP and Life Expectancy per region as percentages of Overall Happiness", 
             xaxis = list(title = "GDP per Capita (%)"),
             yaxis = list(title = "Health / Life Expectancy (%)"))
  })
  
  output$freePlot <- renderPlot({
    ggplot(data = selectedData()) +
      geom_smooth(aes(x = Freedom, y = Happiness.Score)) +
      geom_point(aes(x = Freedom, y = Happiness.Score, color = Trust..Government.Corruption.)) +
      scale_color_gradient(low = "yellow", high = "blue") +
      labs(
        title = "Correlations: Happiness, Freedom, and Government Trust", 
        x = "Freedom", 
        y = "Happiness Score",
        color = "Trust in Gov."
      )
  })
}

shinyServer(server)
