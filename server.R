library(shiny)
library(ggplot2)
library(data.table)

df = data.frame(Column1=character(), Column2=numeric())

shinyServer(function(input,output)({
  
  data_table <- reactiveVal(df)
  
  observeEvent(input$add, {
    t = rbind(data.frame(Column1=input$input1, Column2=input$input2), data_table())
    data_table(t)
  })
  
  observeEvent(input$delete, {
    t = data_table()
    if (!is.null(input$showtable_rows_selected)) {
      t <- t[-as.numeric(input$showtable_rows_selected),]
    }
    data_table(t)
  })
  
  output$showtable <- DT::renderDataTable({
    data.table(data_table())
  })
  
  
}))