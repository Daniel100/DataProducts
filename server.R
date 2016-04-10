
library(shiny)
library(ggplot2)

function(input, output) {
      
      data <- reactive({
            
            if(input$c1 == FALSE & input$c2 == FALSE & input$c3 == FALSE){
                  print('ALL')
                  subset(mtcars, select = c('mpg','disp','wt','qsec'))
            }
            else if(input$c1 == TRUE & input$c2 == TRUE & input$c3 == FALSE){
                  print('46')
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 4 | cyl == 6)
            }
            else if(input$c1 == TRUE & input$c2 == FALSE & input$c3 == TRUE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 4 | cyl == 8)
            }
            else if(input$c1 == FALSE & input$c2 == TRUE & input$c3 == TRUE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 6 | cyl == 8)
            }
            else if(input$c1 == TRUE & input$c2 == FALSE & input$c3 == FALSE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 4)
            }
            else if(input$c1 == TRUE & input$c2 == FALSE & input$c3 == FALSE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 4)
            }
            else if(input$c1 == FALSE & input$c2 == TRUE & input$c3 == FALSE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 6)
            }
            else if(input$c1 == FALSE & input$c2 == FALSE & input$c3 == TRUE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 8)
            }
            else if(input$c1 == TRUE & input$c2 == TRUE & input$c3 == TRUE){
                  subset(mtcars, select = c('mpg','disp','wt','qsec'), cyl == 8)
            }
            
            })
      
      output$plot <- renderPlot({
            
            
      
            print(ggplot(data(), aes_string(x = input$x, y = input$y)) + geom_point())
      })
      
}