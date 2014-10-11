##########################################
#####   Manoj Kumar - server.R         ###
##########################################

# install the package if not already installed
# library(devtools)
# devtools::install_github('rstudio/shinyapps')

# Loading shiny library
library(shiny)

# Function to calculate Risk of getting diabetic for a given glucose level
DiabetesRisk <- function(glucose) glucose / 200

# writing server function:
shinyServer(function(input, output) {
  
  #Displaying output as a table format
  output$outputDisplay <- renderTable({
    
    # writing a matrix of displaying input and output
    MyMatFunc = matrix(
                      # Tick an Input check box to display the class of the data type, uncheck to display NULL
                      c(paste(input$checkGroup, " ", collapse=', '), 
                      toupper(class(input$checkGroup)),
                      
                      # Inputting a range of dates from date picker
                      paste(as.character(as.Date(input$RangeDate[1], origin = "1975-01-29")), " : ",
                            as.character(as.Date(input$RangeDate[2], origin = "1975-01-29")), collapse = ','),
                      #Displaying its class in upper case
                      toupper(class(input$RangeDate)),
                      
                      # Selecting a radio button 
                      input$SelectRadio, 
                      # And displaying its class
                      toupper(class(input$SelectRadio)),
                      
                      # Selecting a value from Drop Down Combo Box
                      input$ComboBox, 
                      # Displaying the class of selected value 
                      toupper(class(input$ComboBox)),
                      
                      # Selecting Input using Slider
                      input$slider, 
                      # Displaying input value
                      toupper(class(input$slider)),
                      
                      # Entering a text value in given text box
                      input$comment, 
                      # Displaying class of comment in output
                      toupper(class(input$comment))
                      
    ), ncol=2, byrow = TRUE)
    
    # Defining the header of each column in the matrix
    colnames(MyMatFunc) = c("Your Input", "Class of that Input")
    
    # Displaying the results into the matrix
    MyMatFunc
    
  })
  
  
  # Displaying Diabetes Prediction Result
  output$inputValue <- renderPrint({input$glucose})
  output$prediction <- renderPrint({DiabetesRisk(input$glucose)})
  
})
