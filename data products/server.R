library(shiny)
library(randomForest)
library(rCharts)
library(caret)

data("Sacramento")
dat <- get("Sacramento")
 
city <- summary(dat$city)
city <- names(city)
zipcode <- summary(dat$zip) 
zipcode <- substring(names(zipcode),2)
dat$zip <- substring(dat$zip, 2)
type <- summary(dat$type)
type <- names(type)
mod <- randomForest(price ~ ., data = dat[, -c(8,9)],  ntree=25)

shinyServer(
      function(input, output) {
            output$city <- renderUI({
                  selectInput("city", "City", as.list(city))
            })
            output$zip <- renderUI({
                  selectInput("zip", "Zip code", as.list(zipcode))
            })
            output$type <- renderUI({
                  radioButtons("type", label = "Type of the house",
                               choices = as.list(type))
            })
            
            indata <- reactive({
                  if (is.null(input$city))
                        return()
                  x <- data.frame(city = factor(input$city, levels(dat$city)), 
                                  zip = as.numeric(input$zip), beds = input$beds, baths = input$baths, sqft = input$sqft, type = factor(input$type, levels(dat$type)))
                  x
            })
            prediction <- reactive({
                  x <- indata()
                  if (is.null(x))
                        return()
                  predict(mod, x)
            })
            output$house <- renderPrint({indata()})
            output$price <- renderText({
                  prediction()
            })
            
            output$myChart <- renderChart({
                  if (is.null(input$city))
                        return()
                  d <- subset(dat, city == input$city)
                  d$NumberRoom <- d$beds + d$baths
                  l <- ceiling(length(unique(d$zip))/3)
                  options(RCHART_WIDTH = 800, RCHART_HEIGHT = l*300)
                  p1 <- rPlot(price ~ sqft|zip, data = d, color = "NumberRoom", 
                              type = 'point')
                  p1$addParams(dom = 'myChart')
                  return(p1)
            })
            output$caption <- renderText({input$city})
            output$doc <- renderUI({
                  t1 <- 'The application allows users to input some data about the house, 
                        to estimate the price and to view the price in history. 
                        This application is applicable for houses in Sacramento county. 
                        The prediction model is a random forest model that is built from 
                        the Sacramento data (package caret).'
                  t2 <- 'Inputs'
                  t3 <- 'Input information about the house that users want to estimate the price.'
                  t4 <- '1. City: select a city from the list'
                  t5 <- '2. Zip: select a zip from the list (to be noted, the zip has not been associated with the selected city yet)'
                  t6 <- '3. Beds: click to input the number of bedrooms'
                  t7 <- '4. Baths: click to input the number of bathrooms'
                  t8 <- '5. Area (sqft): click the slide to speciy the area'
                  t9 <- '6. Type: click to select the type of the house' 
                  t10 <- '7. Click the button Predict Price to submit the information of the house and get the estimated price.'
                  
                  t11 <- 'Outputs'
                  t12 <- '1. Review the submitted information of the house'
                  t13 <- '2. The estimated price of the house'
                  t14 <- '3. A plot is also displayed to show the prices in the city in the past. The price is plotted by the area and zip and colored according to the number of rooms (i.e. beds plus baths).'
                  HTML(paste(t1,'',t2,t3,t4,t5,t6,t7,t8,t9,t10,'',t11,t12,t13,t14, sep = '<br/>'))
                  
            })
      }
)