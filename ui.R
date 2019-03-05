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
  titlePanel("Simulating a beta distribution"),
  
  #  
  sidebarLayout(
    sidebarPanel(
       numericInput("numeric", "Number of random points for distribution", step = 10, min = 100, max = 1000, value = 550),
       sliderInput("sliderX", "Set the first shape parameter", 0.5, 10, value = 2),
       sliderInput("sliderY", "Set the second shape parameter", 0.5, 10, value = 2),
       checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
       checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
       checkboxInput("show_title", "Show/Hide Title", value = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(
      type="tabs",
      tabPanel(
        h3("Documentation"),
        h4("Select the distribution parameters as you like, as it will change accordingly"),
        h5("Link for the ui.R file is:"),
        helpText(a("ui.R", href="https://github.com/octavio2507/DataProductsProject/blob/master/ui.R")),
        h5("Link for the server.R file is:"),
        helpText(a("server.R", href="https://github.com/octavio2507/DataProductsProject/blob/master/server.R"))),
      tabPanel(h3("Beta distribution plot"),
       plotOutput("betaHist"))
    ))
  )
))
