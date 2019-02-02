library(kernlab)
library(ggplot2)
library(plotly)
data(mtcars)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   output$distPlot <- renderPlot({
   p<- qplot(mtcars[,input$select],mtcars[,input$select1],xlab = input$select,ylab = input$select1, col = factor(mtcars[,input$col]),size = 30,geom=c("point", "smooth"), main = "Scatter Plot")
   p+labs(colour = input$col) 
   })
  output$distPlot1<- renderPlot({
    qplot(iris[,"Species"],iris[,input$select2],geom = "boxplot",xlab = "Species",ylab = input$select2,main = "BOX PLOT",fill = iris[,"Species"])
  })
  output$summary <- renderPrint({
    summary(mtcars)
  })
  output$summary1 <- renderPrint({
    summary(iris)
  })
  
})
# UCBAdmissions look into it