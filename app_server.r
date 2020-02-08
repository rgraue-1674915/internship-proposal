library(knitr)

source("scripts/mock_report.R")

rmdfiles <- c("text/report.Rmd")
sapply(rmdfiles, knit, quiet = T)

server <- function(input, output, session) {

  output$sidebarpanel <- renderUI({
    sidebarMenu(
      menuItem("Main Page", tabName = "Home", icon = icon("dashboard"), selected = TRUE),
      menuItem("Mock Report", tabName = "report", icon = icon("analytics"))
    )
  })
  
  output$body <- renderUI({
    tabItems(
      tabItem(tabName = "Home",
              includeHTML("text/intro_text.html")
      ),
      tabItem(tabName = "report",
              withMathJax(includeMarkdown("report.md"))
              )
    )
  })
  
} 