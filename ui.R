library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Car Mileage (MPG)"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("wt", "Car weight (in 1000 lbs):",
                  min = 1.5, max = 5.5, value = 3, step = 0.1),
      radioButtons("cyl", "Number of cylinders:",
                   choices = c("4", "6", "8"), selected = "4")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("App",
                 h3("Predicted MPG:"),
                 textOutput("pred"),
                 plotOutput("plot")),
        tabPanel("How to use",
                 h4("Instructions"),
                 p("1. Move the slider to choose the weight of the car."),
                 p("2. Pick the number of cylinders using the radio buttons."),
                 p("3. Open the 'App' tab. The predicted miles per gallon updates automatically."),
                 p("4. In the plot, the red dot is your prediction. Black dots are real cars from the mtcars dataset."),
                 p("The prediction comes from a linear regression: mpg ~ weight + cylinders."))
      )
    )
  )
))