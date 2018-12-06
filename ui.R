# Plotly requires seperate initalization.
library(plotly)

ui <- fluidPage(
  theme = "shiny.css",
  titlePanel("World Happiness Report"),
  sidebarLayout(
    sidebarPanel(
      # Widgets to select year and region.
      selectInput("year", "Select Year", choices = c("2015", "2016", "2017")),
      selectInput("region",
                  ("Select Region"),
                  choices = c("All",
                              "Western Europe",
                              "Central and Eastern Europe",
                              "Eastern Asia",
                              "Latin America and Caribbean",
                              "Middle East and Northern Africa",
                              "North America",
                              "Southeastern Asia",
                              "Southern Asia",
                              "Sub-Saharan Africa",
                              "Australia and New Zealand")
      ),
      width = 3
    ),
    mainPanel(
      # Seperates all visualizations into tabs. The overview heatmap isn't used as it is too large for shinyapps.io
      # so a static image is displayed.
      tabsetPanel(type = "tabs",
        tabPanel("Overview", img(src="heatmap.jpg", width = "700px"), includeHTML("Analysis/overview.HTML")),
        tabPanel("GDP Scatterplot", plotlyOutput("gdpPlot"), includeHTML("Analysis/sanjay.HTML")),
        tabPanel("Trust Scatterplot", plotOutput("freePlot"), includeHTML("Analysis/torin.HTML")),
        tabPanel("Generosity Bar Chart", uiOutput("plot.ui"), includeHTML("Analysis/gabe.HTML")),
        tabPanel("Conclusion",  DT::dataTableOutput("conclusion"), includeHTML("Analysis/conclusion.HTML"))
      )
    )
  )
)
  
shinyUI(ui)

