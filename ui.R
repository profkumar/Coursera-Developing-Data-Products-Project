##############################
### Manoj Kumar - ui.R #######
##############################

library(shiny)

shinyUI(
  pageWithSidebar(
  
  # Project Title
  headerPanel("Coursera: Developing Data Products: Project", windowTitle= "Manoj Kumar - Coursera - Developing Data Products - Assignmet - Project"),
  
  
  sidebarPanel(
    # 4th Level Header of Input Panel
    h4("Input:"),
    
    # Option 1: Tick a box to display the input and its class
    checkboxGroupInput(inputId = "checkGroup", label = "1. Tick the check box to see its class in output",
                       choices = list("Manoj Kumar" = "Manoj Kumar", "India" = "India",
                                      "Hello World!" = "Hello World!")),
    # Second option: selecting a data range
    dateRangeInput(inputId = "RangeDate", label = "2. Select a Range of Dates as Input"),
    
    # Selecting a radio button to display its class
    radioButtons(inputId = "SelectRadio", label = "3. Tick a Radio Button below and See its Class in Output",
                 choices = list("Manoj Kumar" = "Manoj Kumar", "India" = "India")),

    # Selecting from a Drop Down Combo Box
    selectInput(inputId = "ComboBox",
                label = "4. Pick a Value from the Drop Down Box below",
                choices = list("Manoj Kumar" = "Manoj Kumar", "India" = "India", "Data Science" = "Data Science", "Hello World" = "Hello World")),
    
    # Slider with minimum of 0 and maximum of 10 value with incremental step of 1 unit, default selection of 0
    sliderInput(inputId = "slider", label = "5. Select a value by sliding the slider", min = 0, max = 10, value = 0, step = 1),
    
    textInput(inputId = "comment", label = "6. Write a word or text in the box below", value = "Manoj Kumar"),
    
    sliderInput(inputId = 'glucose', label = "7. Enter Glucose Level (mg/dl)", value = 90, min = 50, max = 200, step = 5)
    
  ),
  
  # Designing the main panel : displaying results of input (selection and type)
  mainPanel(
    # 4rth level heading out the output frame
    h4("Output: Your Input and Class of Input"),
    
    # Displaying the results:
    tableOutput("outputDisplay"),
    
    h4('7. Diabetese Prediction'),
    h5('Selected glucose level (mg/dl) : '),
    verbatimTextOutput("inputValue"),
    h5('For the above selected glucose level, the prediction of diabetese is : '),
    verbatimTextOutput("prediction")
  )
))
