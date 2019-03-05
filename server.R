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
   
  output$betaHist <- renderPlot({
  
  # Set a seed for the random sorting  
  set.seed(1111)
  
  # Set the name for the random points
  random_points <- input$numeric
  
  # Set the parameters of the beta distribution
  alpha <- input$sliderX
  beta <- input$sliderY
  
  # Simulate a distribution to be plotted
  dataX <- rbeta(random_points, shape1=alpha, shape2=beta, ncp = 0)
  
  # Set the information of the plot (labels, title)
  xlab <- ifelse(input$show_xlab, "Values", "")
  ylab <- ifelse(input$show_ylab, "Frequency", "")
  main <- ifelse(input$show_title, "Simulated beta distribution", "")  
  
  # Plot the histogram and add a distribution curve with the set parameters
  hist(dataX, breaks= 10, xlab=xlab, ylab=ylab, main=main, prob=TRUE)
  curve(dbeta(x, shape1 = alpha, shape2 = beta, ncp = 0), col="darkblue", lwd=2, add=TRUE)
  
    
  })
  
})
