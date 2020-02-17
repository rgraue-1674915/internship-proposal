library(shinydashboard)
library(shinyjs)

# ui value to be used in the shiny app entitiy
header <- dashboardHeader( title = "simple dashboard")
sidebar <- dashboardSidebar(uiOutput("sidebarpanel")) 
body <- dashboardBody(shinyjs::useShinyjs(), uiOutput("body"))
ui<-dashboardPage(header, sidebar, body, skin = "green")