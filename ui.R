library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Fuel consumption \n
              calculation"),
  sidebarPanel(
    tabsetPanel(type = "tabs", 
                tabPanel("Input", radioButtons("am", label = h4("Transmission type"),
                                                    choices = list("Manual" = 0, "Automatic" = 1
                                                    ),selected = 0),
                         selectInput('mcars',h4('Select Type of Car'), choices=NULL, selectize=TRUE),
                         
                         
                         sliderInput('miles', h4('Number of Miles'),value = 0, min = 0, max =500, step = 1,)
                         )
                         
                         
                ,
               # tabPanel("Help", htmlOutput("<DIV>adfadfad</DIV>", inline = TRUE)
               tabPanel("Help", div(class="header",checked = NA,
                                p("This application allows  calculate number of gallons required 
                                     depending upon the transmission type and car selected.
                                     This application has three tabs: Input, Help, and comparison tabs and on the right hand
                                                                  side output screen.
                                                                  Main data entry portion is Input tab, which should be used as follows:
                                                                  "),
                                
                                p("1. Select Transmission Type. this will result in refreshing the drop down with appropirate cars")
                                    ),
                                p("2. Select Type of Car"),
                                p("3. select the the amount of miles you intend to drive"),
                                p("look at the right hand side of the screen Number of Gallon required, which is updated dynamically")
                         
                         ),
               tabPanel("Comparison", plotOutput('plotAM'))
               
               
                
    )
    
    
   
   ),
  mainPanel(
    
    h4('You selection transmission type'),
    verbatimTextOutput("radioam"),
    h4('Your selected car'),
    verbatimTextOutput('select'),
    h4('Your mile per gallon'),
    verbatimTextOutput("mpg"),
    h4('Number of Gallons required'),
    verbatimTextOutput("gallons")
          
  )
 
)
)