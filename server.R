#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    lm_cars <- lm(dist ~ speed, cars)
    cars_pred <- reactive({
        (input$speed)*(coef(lm_cars)[2]) + coef(lm_cars)[1]
    })
    
    output$text <- renderText({
        cars_pred()
    })
    
    kmh_reac <- reactive({
        1.609344 * (input$speed)
    })
    
    output$kmh <- renderText({
        kmh_reac()
    })
    meters_reac <- reactive({
        0.3048 * cars_pred()
    })
    
    output$meters <- renderText({
        meters_reac()
    })
})
