library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Developing Data Science Products"),
  
  
  sidebarPanel(
    numericInput('Value', 'Number of Cylinders', 4, min = 4, max = 8, step = 2),
    submitButton('Submit'),
    
    sliderInput('guess', 'Guess the Mean of Earthquake Magnitudes', value = 5, min = 4, max = 6.5, step = 0.01)
  ),
  
  mainPanel(
    h3('Cars with Cylinders'),
    h4('Number of Cylinders'),
    verbatimTextOutput("Input"),
    h4('Cars with Matching Cylinders'),
    verbatimTextOutput("Out"),
    plotOutput('Histo')
  )
  
))