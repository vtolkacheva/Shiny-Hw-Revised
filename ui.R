library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)
languages_data<-read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv", encoding = 'UTF-8', sep=",", header = TRUE)
data <- languages_data


# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("One thousand Most Frequently Used Words"),
    # Create a new Row in the UI for selectInputs
    
    sidebarLayout(
      sidebarPanel(
        fluidRow(
          column(10,
                 selectInput("lang",
                             "Choose language:",
                             c("All languages",
                               unique(as.character(data$language))))
          )
        )
      ),
      mainPanel(
        p("Это приложение показывает 1000 самых частотных слов некоторых языков. Данные основаны на материалах сайта http://www.101languages.net/common-words/. Нельзя гарантировать, что данные собраны хорошо (процесс сбора данных на сайте не описан), ровно как и не стоит верить переводам.")        
      )
    ),
    
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)
