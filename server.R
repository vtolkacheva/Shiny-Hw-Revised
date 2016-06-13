library(shiny)
# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
languages_data<-read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv", encoding = 'UTF-8', sep=",", header = TRUE)


# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- languages_data
    
    if (input$lang != "All languages"){
      data <- data[data$language == input$lang,]
      data
    }
    else{
    }
    
  }))
  
})
