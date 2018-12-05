ui <- fluidPage(
  theme = "shiny.css",
  titlePanel("World Happiness Report"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select Year", choices = c("2015" = 15, "2016" = 16, "2017" = 17)),
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
      )
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Overview", plotOutput("heatPlot"), includeMarkdown("Analysis/overview.md")),
                  tabPanel("GDP Scatterplot", plotlyOutput("gdpPlot"), includeMarkdown("Analysis/sanjay.md")),
                  tabPanel("Trust Scatterplot", plotOutput("freePlot"), includeMarkdown("Analysis/torin.md")),
                  tabPanel("Generosity Bar Chart", plotOutput("genPlot"), includeMarkdown("Analysis/gabe.md")),
                  tabPanel("Conclusion",  DT::dataTableOutput("conclusion"))
      )
    )
  )
)
  
shinyUI(ui)