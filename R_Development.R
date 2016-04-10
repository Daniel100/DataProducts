

install_github('slidify', 'ramnathv')
install_github('slidifyLibraries', 'ramnathv')


library(slidify)


author('Data Product Slidify')
slidify('index.Rmd')

library(knitr)

browseURL('index.html')
