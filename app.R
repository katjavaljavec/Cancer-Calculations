library(shiny)
library(dplyr)
source("script.R", local=TRUE)
data <- read.csv("dataUK.csv", header = TRUE, sep=",")

ui <- fluidPage(
  titlePanel("Cancer prediction"),
  
  helpText("Note: Data for calculating the probability",
           "are available only when the value of given",
           "(age + duration of monitoring)",
           "does not exceed 89 years."),

  sidebarLayout(
    
    sidebarPanel(
    
      selectInput(inputId = "gender",
                label = "Your gender",
               c("Male"="Male", "Female"="Female")),
              
      sliderInput(inputId = "age",
                  label="Specify your age",
                  min=1, max=80, value=24), 
      
      sliderInput(inputId = "mon",
                  label="Specify duration of monitoring [years]",
                  min=1, max=80, value=24)
    ),
  mainPanel(
    h3('Results of prediction'),
    
    h4('Your gender'),
    verbatimTextOutput("yourGender"),
    
    h4('Your age'),
    verbatimTextOutput("yourAge"),
    
    h4('Specified duration of monitoring'),
    verbatimTextOutput("durationTime"),
    
    h4('Your probability [%] of getting cancer in specified duration of monitoring '),
    verbatimTextOutput("prediction")
  )
))


server <- function(input, output, session) {
  
  output$yourGender <- renderPrint({input$gender})
  output$yourAge <- renderPrint({input$age})
  output$durationTime <- renderPrint({input$mon})
  output$prediction <- reactive(myfunction(input$age, input$mon, input$gender))
  
}

      
shinyApp(ui=ui, server=server)