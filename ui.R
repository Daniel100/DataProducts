

data <- subset(mtcars, select = c('mpg','disp','wt','qsec'))

shinyUI(
      pageWithSidebar(
            
            headerPanel("Motor Trend Car Road Tests"),
            
            sidebarPanel(
                  
                  #sliderInput('sampleSize', h4('Sample Size'), min=1, max=nrow(data),
                  #            value=min(1, nrow(data)), step=1, round=0),
                  
                  h4('Select the x and y axis'),
                  selectInput('x', h5('x-Axis'), names(data)),
                  selectInput('y', h5('y-Axis'), names(data)),
                  
                  h4('Select the number of cylinders for the analysis (default is ALL)'),
                  checkboxInput('c1', '4 cylinders'),
                  checkboxInput('c2', '6 cylinders'),
                  checkboxInput('c3', '8 cylinders')
                  
            ),
            
            mainPanel(
                  h3("Regression Analysis"),
                  h6(  "The data was extracted from the 1974 Motor Trend US magazine, 
                        and comprises fuel consumption and 10 aspects of automobile 
                        design and performance for 32 automobiles (1973–74 models)."),
                  
                  plotOutput('plot')
            )
            
            
      )    
) # End shinyUI


