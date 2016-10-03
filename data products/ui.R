library(shiny)
library(rCharts)

shinyUI(fluidPage(
      titlePanel("Sacramento CA Home Prices"),
      sidebarLayout(
            sidebarPanel(
                  helpText('Input the information of the house to predict the price'),
                  uiOutput("city"),
                  uiOutput("zip"),
                  numericInput('beds', 'Number of beds', 1, min = 1, max = 10, step = 1),
                  numericInput('baths', 'Number of baths', 1, min = 1, max = 10, step = 1),
                  sliderInput(inputId = "sqft", label = "Area (squared feet)", value = 1680, min = 400, max = 5500),
                  uiOutput("type"),
                  submitButton("Predict Price")
            ),
            mainPanel(
                  tabsetPanel(
                        tabPanel("Prediction",
                              h3('Prediction of the price'),
                              h4('The house'),
                              verbatimTextOutput("house"),
                              h4('The estimated price'),
                              verbatimTextOutput("price"),
                              h4('History of price in'),
                              textOutput("caption", inline = T),
                              showOutput("myChart", "polycharts")
                        ),
                        tabPanel("Introduction", htmlOutput("doc"))
                  )
            )
      )
))