#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stopping distances of cars in the 20's"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h1("Select the speed!"),
        sliderInput("speed",
                   "Select speed (mph):",
                   min = 5,
                   max = 100,
                   value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h4("This application lets you estimate the distance that it would take an average car in the 20's to stop if the current speed was the one you have selected with the slider in the left panel."),
        h4("Thanks to the advances in technology, cars today stop at much lower distances!. Still, the faster you go, the longer it will take to stop, on average. Think about this when you are driving!"),
        h3("The stopping distance in feet for the selected speed was:"),
        textOutput("text"),
        h3("The speed you selected is equivalent in km/h to:"),
        textOutput("kmh"),
        h3("The stopping distance in meters for the selected speed was:"),
        textOutput("meters")
    )
  )
))
