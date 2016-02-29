library(shiny)
library(datasets)
data(mtcars)
data(quakes)

cylfunction <- function(Value) rownames(mtcars[mtcars$cyl == Value,])

shinyServer(
  function(input, output) {
    output$Input <- renderPrint({input$Value})
    output$Out <- renderPrint({cylfunction(input$Value)})
    output$Histo <- renderPlot({
      hist(quakes$mag, xlab = 'Earthquake Magnitude', col = 'red', main = 'Histogram of Earthquake Magnitudes')
      guess <- input$guess
      lines(c(guess, guess), c(0,200), col = "black", lwd = 5)
      mse <- mean((quakes$mag - guess)^2)
      text(6,150, paste(" mu = ", guess))
      text(6,140, paste(" MSE = ", round(mse, 2)))
    })
  }
)