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
          href = 'https://github.com/matswinkels/EDA-App-Project',
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
      )
    ),
    
    shinydashboard::dashboardBody(
      
    )
    
  )
)
