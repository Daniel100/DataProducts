Coursera Data Products Project
========================================================
author: Daniel B.
date: 10.04.2016

Dynamic Scatterplot
========================================================


This app produce a scatterplot from the mtcars data set.

Functionality:

- Select the x and y axis.
- Select the the number of cylinders


server.R
========================================================


```r
library(shiny)
library(ggplot2)
function(input, output) {
      data <- reactive({
            if(input$c1 == FALSE & input$c2 == FALSE & input$c3 == FALSE){
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
            }})
      output$plot <- renderPlot({
            print(ggplot(data(), aes_string(x = input$x, y = input$y)) + geom_point())
      })
}
```

```
function(input, output) {
      data <- reactive({
            if(input$c1 == FALSE & input$c2 == FALSE & input$c3 == FALSE){
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
            }})
      output$plot <- renderPlot({
            print(ggplot(data(), aes_string(x = input$x, y = input$y)) + geom_point())
      })
}
```

ui.R
========================================================


```r
data <- subset(mtcars, select = c('mpg','disp','wt','qsec'))
shinyUI(
      pageWithSidebar(
            headerPanel("Motor Trend Car Road Tests"),
            sidebarPanel(
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
```

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Motor Trend Car Road Tests</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<h4>Select the x and y axis</h4>
<div class="form-group shiny-input-container">
<label class="control-label" for="x">
<h5>x-Axis</h5>
</label>
<div>
<select id="x"><option value="mpg" selected>mpg</option>
<option value="disp">disp</option>
<option value="wt">wt</option>
<option value="qsec">qsec</option></select>
<script type="application/json" data-for="x" data-nonempty="">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="y">
<h5>y-Axis</h5>
</label>
<div>
<select id="y"><option value="mpg" selected>mpg</option>
<option value="disp">disp</option>
<option value="wt">wt</option>
<option value="qsec">qsec</option></select>
<script type="application/json" data-for="y" data-nonempty="">{}</script>
</div>
</div>
<h4>Select the number of cylinders for the analysis (default is ALL)</h4>
<div class="form-group shiny-input-container">
<div class="checkbox">
<label>
<input id="c1" type="checkbox"/>
<span>4 cylinders</span>
</label>
</div>
</div>
<div class="form-group shiny-input-container">
<div class="checkbox">
<label>
<input id="c2" type="checkbox"/>
<span>6 cylinders</span>
</label>
</div>
</div>
<div class="form-group shiny-input-container">
<div class="checkbox">
<label>
<input id="c3" type="checkbox"/>
<span>8 cylinders</span>
</label>
</div>
</div>
</form>
</div>
<div class="col-sm-8">
<h3>Regression Analysis</h3>
<h6>The data was extracted from the 1974 Motor Trend US magazine, 
                        and comprises fuel consumption and 10 aspects of automobile 
                        design and performance for 32 automobiles (1973–74 models).</h6>
<div id="plot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div>
</div><!--/html_preserve-->

The mtcars data
=============================================
The data was extracted from the 1974 Motor Trend US magazine, 
and comprises fuel consumption and 10 aspects of automobile 
design and performance for 32 automobiles (1973–74 models)."






