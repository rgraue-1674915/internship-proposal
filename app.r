library(shiny)

source("app_server.r")
source("app_ui.r")

# shinyApp object
shinyApp(ui = ui, server = server)
