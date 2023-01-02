#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#### Define UI for application 

ui <- navbarPage(
    
    #Title of the tab when MANTIS is launched
    windowTitle = ("Garden Planner"),
    
    #Title of the Homepage
    title = strong(span("Garden Planner", style = "color: MediumSeaGreen; font-size: 30px; font-family: Papyrus")),
    
    header = tagList(
        useShinydashboard()
    ),
    
    ##home page set up
    tabPanel(title = "Home", icon = icon("home"),
             fluidPage(
                 useShinyalert(),  # Set up shinyalert
                 setBackgroundImage(src = "https://th.bing.com/th/id/OIP.0zs9FoJWs3cDXbvQ9MhuBwHaFD?pid=ImgDet&rs=1"),
                 fluidRow(column(12,align="center",h1(strong(span("Welcome to the Garden Planner Application", style="color: #D4AF37; font-family: Papyrus")))),
                          column(12,align="center",h3(span("Your one stop shop for garden planning:", style="color: #F4F6F7 ; font-family: Papyrus"))),
                          column(4,align="center",actionBttn(inputId = "Plant_Info",label = "Planting Guide",style = "float",size = "lg",color = "default")),
                          column(4,align="center",actionBttn(inputId = "G_Planning",label = "Garden Planning",style = "float",size = "lg",color = "default")),
                          column(4,align="center",actionBttn(inputId = "Seed_Info",label = "Seed Selection",style = "float",size = "lg",color = "default"))
                 )
             ))
    
) # end UI specifications


# Define server logic required to draw a histogram
server <- function(input, output) {

    ##home page informational pop up buttons
    observeEvent(input$Plant_Info, {
        shinyalert(title = "Planting Guide",text = "A tool to guide when to plant the seeds you own or seeds selected in our Seed Selection section", type = "info")
    })
    
    observeEvent(input$G_Planning, {
        shinyalert(title = "Garden Planning",text = "A tool where you give information on your garden size and Garden Planter shows where to plant each seed based on it's growth size and requirements", type = "info")
    })
    
    observeEvent(input$Seed_Info, {
        shinyalert(title = "Seed Selection",text = "A seed bank where you select the seeds you currently own or would like to plant", type = "info")
    })
    
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
