ui <- fluidPage(
  theme = "shiny.css",
  titlePanel("World Happiness Report"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year", choices = c("2015" = 15, "2016" = 16, "2017" = 17))
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Overview", plotOutput("heatPlot"), includeMarkdown("Analysis/overview.md")),
                  tabPanel("GDP Scatterplot", plotlyOutput("gdpPlot"), includeMarkdown("Analysis/sanjay.md")),
                  tabPanel("Trust Scatterplot", plotOutput("freePlot"))
      )
    )
  )
)
  
shinyUI(ui)