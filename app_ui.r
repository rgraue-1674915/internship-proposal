library(shinydashboard)
library(shinyjs)

header <- dashboardHeader( title = "simple dashboard")
sidebar <- dashboardSidebar(uiOutput("sidebarpanel")) 
body <- dashboardBody(shinyjs::useShinyjs(), uiOutput("body"))
ui<-dashboardPage(header, sidebar, body, skin = "green")