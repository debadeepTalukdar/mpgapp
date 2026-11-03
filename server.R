library(shiny)

shinyServer(function(input, output) {
  
  d <- mtcars
  d$cyl <- factor(d$cyl)
  model <- lm(mpg ~ wt + cyl, data = d)
  
  pred <- reactive({
    newcar <- data.frame(wt = input$wt,
                         cyl = factor(input$cyl, levels = levels(d$cyl)))
    predict(model, newcar)
  })
  
  output$pred <- renderText({
    paste(round(pred(), 1), "miles per gallon")
  })
  
  output$plot <- renderPlot({
    plot(d$wt, d$mpg, pch = 19,
         xlab = "Weight (1000 lbs)", ylab = "MPG",
         main = "Real cars vs. your prediction")
    points(input$wt, pred(), col = "red", pch = 19, cex = 2.5)
  })
})