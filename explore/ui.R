

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Explore through data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h3("Pick the variables of the mtcars dataset to plot"),
        p("varibles of the dataset"),
        selectInput("select", h3("Select the x axis"), 
                    choices = list("Miles/(US) gallon" = "mpg","displacement (cu.in.)"= "disp","Gross horsepower" ="hp","rear axle ratio" ="drat","weight" = "wt","1/4 mile time"="qsec"), selected = "hp"),
        selectInput("select1", h3("Select the y axis"), 
                    choices = list("Miles/(US) gallon" = "mpg","displacement (cu.in.)"= "disp","Gross horsepower" ="hp","rear axle ratio" ="drat","weight" = "wt","1/4 mile time"="qsec"), selected = "wt"),
        selectInput("col", h3("Select the y axis"), 
                    choices = list("No of cylinders" = "cyl","V/S"="vs","Transmission Type"="am","No of gears"="gear"," No of carburetors"="carb"), selected = "gear"),
        h3("Pick the variables of the iris dataset to plot"),
        p("varibles of the dataset"),
        selectInput("select2", h3("Select the y axis"), 
                    choices = list("Sepal length" = "Sepal.Length","Sepal width"= "Sepal.Width","Petal length" ="Petal.Length","Petal width" ="Petal.Width"), selected = "Sepal.Width")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", h2("Explore mtcars data"),plotOutput("distPlot"),h2("Explore iris data"),plotOutput("distPlot1")),
                  tabPanel("HELP", h2("HELP"), p("This product show how data of two diferent data sets can be viewed to understand the relationship of the different
         variables of the data. There are four dropdown menu's to choose the different variables from, the first three are for the first plot
         all the variable are from the mtcars and are used to construct the scatter plot. The next dropdown is for the second plot and is from
         the iris dataset. Below is the summary of each of the variables of the two datasets"),h3("mtcars data  summary"),verbatimTextOutput("summary"),h3("iris data  summary"),verbatimTextOutput("summary1"))
      )
    )
  )
))
