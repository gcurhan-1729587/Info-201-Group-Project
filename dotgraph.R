library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
data_2015 <- read.csv("Data/WH15.csv")
data_2016 <- read.csv("Data/WH16.csv")
data_2017 <- read.csv("Data/WH17.csv")

my_ui <- fluidPage(
  titlePanel("Life Expectancy vs. GDP"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "year",
        "Year:",
        c("2015" = "15", "2016" = "16", "2017" = "17"),
        inline = TRUE
      )
    ),
    mainPanel(
      plotlyOutput("countryPlot"),
      textOutput("country")
    )
  )
)

shinyUI(my_ui)

my_server <- function(input, output) {
  
  df <- reactive({
    return(read.csv(paste0("Data/WH", input$year,".csv")))
  })
  
  output$country <- renderText({
    paste0("SUMMARY GOES HERE.")
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

shinyApp(ui = my_ui, server = my_server)