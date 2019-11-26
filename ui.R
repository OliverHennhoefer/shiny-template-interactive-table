library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Header"),
  sidebarPanel(
    
    textInput("input1", "First Input: (character)", "hallo world"),
    numericInput("input2", "Second Input: (numeric)", min = 1, max = 10, step = 1, value = 1),
    actionButton("add", "Add Data"),
    actionButton("delete", "Delete Selection")
    
  ),
  mainPanel(
    tabsetPanel(
      
      tabPanel("My Portfolio", value=1, DT::dataTableOutput("showtable")),
      id = "tabselected"
      
    )
  ))
)