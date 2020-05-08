#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    modelfit <- lm(mpg~wt+as.numeric(cyl), data = mtcars)  
    
    modelpred <- reactive({
      wt<- input$wt
      cyl <- input$cyl
      rawdata <- data.frame(wt,cyl)
      predict(modelfit, rawdata)
    })
    
    
    totalcost <- reactive({
      miles <- input$miles
      cost <- input$costofgas
      wt<- input$wt
      cyl <- input$cyl
      rawdata <- data.frame(wt,cyl)
      x <- predict(modelfit, rawdata)
      miles / x * cost
    })
    
    output$totalcost <- renderText({
      totalcost()
    })
      
    output$modelfitbywt <- renderPlot({
     
      plot(mtcars$wt, mtcars$mpg, xlab = "Weight (1000lbs)", ylab = "Miles per Gallon (mpg)", col = mtcars$cyl, lwd = 6 ,
           main = " MPG vs WT Data Set")
      abline(modelfit, lwd = 2)
      legend("topright", legend = c(4,6,8) , col = mtcars$cyl, lty=2 , pch = 1)

    })

    
    
})
