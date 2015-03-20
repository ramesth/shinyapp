library(UsingR)
data(mtcars)

shinyServer(
  function(input, output,session) {
    outVarCars <- reactive({
     temp<-input$am
      vars <- rownames(mtcars[(mtcars$am==temp),])
      return(vars)
    })
    outVarMpg <- reactive({
      temp<-input$mcars
      vars <- mtcars[c(temp),"mpg"]
      return(vars)
    })
    output$plotAM<-renderPlot({boxplot(mpg ~ am,main=" Current Fuel efficiency Data ", data = mtcars, col = (c("red","blue")), ylab = "Miles Per Gallon", xlab = "Transmission Type \n (0 = automatic, 1 = manual)",boxwex=0.1, ylim = c(10, 30))})
    output$radioam <- renderText({ 
      paste(input$am)
    })
    observe({updateSelectInput(session, 'mcars','Columns', choices =outVarCars()  )})
    output$select <- renderText({ 
      paste(input$mcars)
    })
    output$radioam <- renderText({ 
      if (input$am==0)
          paste("Manual")
      else paste("Automatic")
    })
    output$mpg<-renderText({ 
      outVarMpg()
    })
    output$gallons <- renderText({ 
      paste(round(input$miles/outVarMpg(),digit=2))
    })
    
  }
)