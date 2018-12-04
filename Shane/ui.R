ui <- fluidPage(
  #theme = "shiny.css",
  titlePanel("World Happiness Report"),
  # sidebarLayout(
  #   # sidebarPanel(
  #   # ),
  # 
  # )
  mainPanel(
    #textOutput("selected"),
    plotOutput("plot", width = "750px", height = "400px")
  )
)

shinyUI(ui)