library(shiny)
library(dplyr)
library(ggplot2)
library(data.table)

server <- function(input, output) {
  
  # Only use necessary data to improve efficiency.
  selectedData <- reactive({
    dataPath <- paste0("../Data/WH16.csv")
    data <- fread(dataPath) %>%
      mutate(Country = if_else(Country == "United States", 'USA',
                       if_else(Country == "United Kingdom", 'UK', Country))) %>%
      subset()
  })

  # output$selected <- renderText({
  #   paste0("There have been ", nrow(filteredData()), " UFO spottings in ", input$state, ".")
  # })
  
  output$plot <- renderPlot({
    map.world <- map_data('world')
    mapped <- left_join(map.world, selectedData(), by = c('region' = 'Country'))
    ggplot(data = mapped, aes(x = long, y = lat, group = group)) +
      geom_polygon(aes(fill = `Happiness Score`)) + 
      labs(title = "Happiness Score by Nation", caption = "World Happiness Report, 2016", x = "Longitude", y = "Latitude")
  })
}

shinyServer(server)