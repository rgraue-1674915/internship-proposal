library(knitr)

source("scripts/mock_report.R")

#knits the rmd files for an outputable object for shiny apps (HTML)
rmdfiles <- c("text/report.Rmd", "text/report_bottom.Rmd")
sapply(rmdfiles, knit, quiet = T)

# server function for shiny app entity
server <- function(input, output, session) {

  # establishes sidebar and menu items to be put in sidebar
  output$sidebarpanel <- renderUI({
    sidebarMenu(
      menuItem("Main Page", tabName = "Home", icon = icon("dashboard"), selected = TRUE),
      menuItem("School", tabName = "school"),
      menuItem("Mock Report", tabName = "report"),
      menuItem("My Projects", tabName = "projects")
    )
  })
  
  # creates the bodies to be displayed by the individual menu items
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
      tabItem(tabName = "projects",
              fluidPage(
                tags$head(
                  tags$style("font_size: 45px;")
                ),
                tagList(a("Weather Data (Info 201 Final project)", 
                          href = "https://rgraue-1674915.shinyapps.io/Weather_Data_app/")),
                br(),
                tagList(a("Midpoint for Project, hosted though Github", 
                          href = "https://info201b-au19.github.io/final-coop28/")),
                br(),
                tagList(a("Project Geoff (an idea that one of the ski techs had... so I made it come true)", 
                          href = "https://rgraue-1674915.shinyapps.io/Geoff/")),
                br(),
                tagList(a("Code for this proposal (git download)", 
                          href = "https://github.com/rgraue-1674915/internship-proposal.git")),
                br(),
                tagList(a("school projects",
                          href = "https://github.com/rgraue-1674915/school-projects.git"))
                )
      ),
      tabItem(tabName = "school",
              includeHTML("text/school.html"),
              renderImage({
                list(src = "imgs/transcript.PNG",
                     contentType = "image/png",
                     alt = "Transcript")
              }, deleteFile = F)
             
      )
    )
  })
  
} 