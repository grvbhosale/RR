

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Cost of gas over some distance using data from mtcars"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Distance to Travel:"),
      numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 100000),
      numericInput('cost', 'Gasoline Price ($ per gallon):', 2.523),
      checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
      checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
    ),
    mainPanel(
      dataTableOutput('table')
    )
  )
))