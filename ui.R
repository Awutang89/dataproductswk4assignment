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
    titlePanel("Predicting Your Gas Cost per Month Based on Your Car Specs"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Welcome to better budgeting. Our simple calculator will help you determine the monthly cost for gas depending on your car specs"),
            h4("Please input the following information:"),
            numericInput("miles", "How Many Miles do you Drive per Month?", value = 2500 , min = 0, max = 16000, step = 100),
            numericInput("costofgas", "What is the cost of gas in your area ($/gal)?", value = 1.67, min = 0, max = 10),
            numericInput("wt", "What is the Approximate `Weight Of your car in (1000lbs)?", value = 3.4, min = 0, max = 20),
            selectInput("cyl","Select how many cylinders your engine has:", c(4,6,8))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("modelfitbywt"),
            h2("Based on the data you put in, your estimated mpg is:"), 
            textOutput("totalcost"), 
            h2("US dollars!"),
            textOutput("modelpred"),
        )
    )
))
