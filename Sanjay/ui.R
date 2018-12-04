library(shiny)

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