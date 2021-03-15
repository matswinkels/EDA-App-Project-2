library(shiny)
library(shinydashboard)

shinyUI(
  shinydashboard::dashboardPage(
    
    ######### HEADER #########
    
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
    
    ######### SIDEBAR #########
    
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
      
      actionButton('load.again', 'Zaladuj ponownie', width = 180),
      
      shinydashboard::sidebarMenu(id = 'sidebar',
        menuItem(text = 'Home', tabName = 'menuHome', icon = icon('home')),
        menuItem(text = 'Eksploracja', tabName = 'menuExplore', icon = icon('map')),
        menuItemOutput('menuVisualise'),
        menuItem(text = 'Informacje o aplikacji', tabName = 'menuInfo', icon = icon('info-circle'))
      )
    ),
    
    ######### BODY #########
    
    shinydashboard::dashboardBody(
      shinydashboard::tabItems(
        
        ###### HOME ######
        
        tabItem(tabName = 'menuHome'
          #
        ),
        
        ###### EKSPLORACJA ######
        
        tabItem(tabName = 'menuExplore',
          DT::DTOutput('render.table')
        ),
        
        ###### WIZUALIZACJA ######
        
        tabItem(tabName = 'menuVisualise'
          #
        ),
        
        tabItem(tabName = 'menuHist'
          #
        ),
        
        tabItem(tabName = 'menuScatter'
          #
        ),
        
        tabItem(tabName = 'menuBoxplot'
          #
        ),
        
        ###### INFO ######
        
        tabItem(tabName = 'menuInfo'
          #
        )
        
      )
    )
  )
)
