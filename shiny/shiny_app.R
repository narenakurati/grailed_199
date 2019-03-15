library(shinydashboard)
library(shiny)
library(ggplot2)
library(httr)
library(dplyr)

ui <- dashboardPage(
  dashboardHeader(title = "Grailed Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(titel = "Grailed", status = "primary", plotOutput("plot1", height = 600, width = 600))
    )
  )
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(data = test_data_frame, aes(x = interval, y = n, color = designer)) + geom_point() + geom_line() + ylab("number of items sold")
  })
}

shinyApp(ui, server)
