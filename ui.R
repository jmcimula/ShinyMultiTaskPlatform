
library(shiny)
library(DT)
# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Developing Data Products"),
  
  sidebarPanel(
           h3("Economics dataset"),
           helpText("Note:", 
                    "This dataset was produced from US economic time series data available from http://research.stlouisfed.org/fred2",
                    ". PCE : Personal Consumption Expenditures, POP : Total Population, PSAVERT : Personal Savings Rate, UEMPMED: Median Duration of Unemployment, UNEMPLOY : Number of Unemployment in thousands. [Link]http://www.google.com "),
           checkboxGroupInput("checkGroup",label = h3("Descriptive statistics"),
                                       choices = list("PCE" = "PCE", "POP" = "POP","PSAVERT" = "PSAVERT","UEMPMED" = "UEMPMED","UNEMPLOY"="UNEMPLOY" ),selected = "PCE"),
           submitButton("SubmitCheckBox"),
           textInput("text", label = h3("Plotting system (Type Cor or Plot)")),
           submitButton("SubmitText"),
           radioButtons("radio", label = h3("Dynamic Regression Models"),
                                 choices = list("PCE" = "PCE", "POP" = "POP","PSAVERT" = "PSAVERT","UEMPMED" = "UEMPMED","UNEMPLOY"="UNEMPLOY" )),
           submitButton("SubmitRadio")
    
  ),
  mainPanel(  
    h3("DATA VISUALIZATION"),
    h4("Descriptive statistics"),
    verbatimTextOutput("ck"),
    h4("Exploratory Data Analysis"),
    plotOutput("tx"),
    h4("Creation of all combinations of selected variables that will go into models as predictors"),
    #verbatimTextOutput("rd")
    dataTableOutput("rd")
    
    )
 
  
  )
)