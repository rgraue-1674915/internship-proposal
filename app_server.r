library(knitr)

source("scripts/mock_report.R")

rmdfiles <- c("text/report.Rmd", "text/report_bottom.Rmd")
sapply(rmdfiles, knit, quiet = T)

server <- function(input, output, session) {

  output$sidebarpanel <- renderUI({
    sidebarMenu(
      menuItem("Main Page", tabName = "Home", icon = icon("dashboard"), selected = TRUE),
      menuItem("Mock Report", tabName = "report"),
      menuItem("School Projects", tabName = "school")
    )
  })
  
  output$body <- renderUI({
    tabItems(
      tabItem(tabName = "Home",
              includeHTML("text/intro_text.html")
      ),
      tabItem(tabName = "report",
              withMathJax(includeMarkdown("report.md")),
              renderPlotly(item_sale_visual),
              withMathJax(includeMarkdown("report_bottom.md"))
      ),
      tabItem(tabName = "school",
              fluidPage(
                tagList(a("Weather Data (Info 201 Final project)", href = "https://rgraue-1674915.shinyapps.io/Weather_Data_app/")),
                br(),
                tagList(a("Midpoint for Project, hosted though Github", href = "https://info201b-au19.github.io/final-coop28/")),
                br(),
                tagList(a("Project Geoff (an idea that one of the ski techs had... so I made it come true)", href = "https://rgraue-1674915.shinyapps.io/Geoff/"))
                )
      )
    )
  })
  
} 