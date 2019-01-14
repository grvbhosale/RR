library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      CostofGasoline = input$dis/mpg*input$cost,
                      Cylinders = cyl, Transmission = am)
    data <- filter(data, Cylinders %in% input$cyl, 
                   Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, CostofGasoline)
    data
  }, options = list(lengthMenu = c(8, 16, 32), pageLength = 32))
})