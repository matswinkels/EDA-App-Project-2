library(shiny)
library(shinydashboard)

shinyUI(
  shinydashboard::dashboardPage(
    
    shinydashboard::dashboardHeader(
      title = 'Eksplorator Danych',
      titleWidth = 300,

      tags$li(
        a(
          icon('github', 'fa-2x'),
          href = 'https://github.com/matswinkels/EDA-App-Project-2',
          target = '_blank'
        ),
        class = 'dropdown'
      )
    ),
    
    shinydashboard::dashboardSidebar(
      width = 300,
      
      tags$head(
        tags$link(
          rel = 'stylesheet',
          type = 'text/css',
          href = 'style.css'
        )
      ),
      
      fileInput(
        inputId = 'input.file',
        label = 'Wczytaj plik .csv',
        accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv"
        ),
        multiple = FALSE,
        placeholder = 'Nie wybrano pliku',
        buttonLabel = 'Przegladaj'
      ),
      
      checkboxInput(
        inputId = 'header', 
        label = 'Header', 
        value = TRUE
      ),
      
      checkboxInput(
        inputId = 'stringAsFactors',
        label = 'String as factors',
        value = FALSE
      ),
      
      radioButtons(
        inputId = 'sep',
        label = 'Separator',
        choices = c(
          przecinek = ',',
          srednik = ';',
          tab = '\t',
          spacja = ' '
        ),
        selected = ','
      ),
      
      radioButtons(
        inputId = 'dec',
        label = 'Separator dziesietny',
        choices = c(
          kropka = '.',
          przecinek = ','
        ),
        selected = '.'
      ),
      
      actionButton('load.again', 'Zaladuj ponownie', width = 180)
    ),
    
    shinydashboard::dashboardBody(
      DT::DTOutput('render.table')
    )
    
  )
)
