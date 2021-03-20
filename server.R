library(shiny)

shinyServer(function(input, output, session) {
  
  dataset <- reactiveValues(
    original = NULL,
    columns = NULL,
    col.selected = NULL
  )
  
  observeEvent(input$input.file, {
    # Pierwsze wczytanie danych
    if (!is.null(input$input.file)) {
      tryCatch({
        dataset$original <- read.csv(
          file = input$input.file$datapath,
          header = input$header,
          stringsAsFactors = input$stringAsFactors,
          sep = input$sep,
          dec = input$dec)
        
        dataset$columns <- colnames(dataset$original)
      },
      warning = function(warn){
        showNotification(paste0(warn), type = 'warning', duration = 10, closeButton = TRUE)
      },
      error = function(err){
        showNotification(paste0(err), type = 'err', duration = 10, closeButton = TRUE)
      }
      )
    }
  })
  
  updateValues <- reactive({
    # Aktualizuje wartosci zmiennych (TO DO)
    return (NULL)
  })
  
  observeEvent(input$load.again, {
    # Ponowne zaladowanie danych
    if (!is.null(input$input.file)) {
      tryCatch({
        dataset$original <- read.csv(
          file = input$input.file$datapath,
          header = input$header,
          stringsAsFactors = input$stringAsFactors,
          sep = input$sep,
          dec = input$dec)
        
        dataset$columns <- colnames(dataset$original)
  
      },
      warning = function(warn){
        showNotification(paste0(warn), type = 'warning', duration = 8, closeButton = TRUE)
      },
      error = function(err){
        showNotification(paste0(err), type = 'err', duration = 8, closeButton = TRUE)
      }
      )
    }
  })
  
  output$render.table <- DT::renderDT({
    # Renderuje tabele w zakladce 'eksploracja'
    if (is.null(input$input.file))
      return (NULL)
    dataset$original
  })


  output$menuVisualise <- renderMenu({
    # renderuje sidebar menu dla zakladki 'wizualizacja'
    menuItem(
      text = 'Wizualizacja', tabName = 'menuVisualise', icon = icon('chart-area'),
      menuSubItem('Histogram', tabName = 'menuHist'),
      menuSubItem('Wykres rozrzutu', tabName = 'menuScatter'),
      menuSubItem('Wykres pudelkowy', tabName = 'menuBoxplot'))
  })
  
  observe({
    # Aktualizuje liste nazw kolumn w zakladce eksploracja
    updateSelectInput(
      session,
      inputId = 'expl.select.col',
      choices = dataset$columns
    )
  })
  
  # observeEvent(input$expl.apply.col, {
  #   # Obsluguje przycisk do potwierdzenia wyboru kolumny w zakladce eksploracja
  #   if (!is.null(input$expl.select.col)) {
  #     dataset$col.selected <- input$expl.select.col
  #   }
  # })
  
  output$summary <- renderPrint({
    # Renderuje podsumowanie wybranej zmiennej
    if (!is.null(dataset$original)) {
      column <- dataset$original[input$expl.select.col]
      summary(column)
    }
  })
  
  
})
