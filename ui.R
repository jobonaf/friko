shinyUI(pageWithSidebar(
  headerPanel("","friko: free interactive kriging, online"),
  sidebarPanel(
    tags$body(
      h5('select a local ',
         code('csv'),
         ' file containing at least the columns x and y (m)'),
      helpText("Avoid special characters, accented letters etc.")
    ),
    fileInput('file1', '',
              accept=c('text/csv', 'text/comma-separated-values,text/plain')),
    tags$hr(),
    textInput(inputId='valcol',
              label='column with data to be kriged'),
    sliderInput(inputId='res',
              label='resolution (m)',min=100,max=1000,value=200,step=50),
    tags$hr(),
    actionButton("upload", "OK"),
    downloadButton(outputId="downloadData",label="download"),
    tags$hr(),
    tags$small(HTML("Developed with <a href=https://www.rstudio.com>RStudio</a> and R packages ",
                    "<a href=https://cran.r-project.org/web/packages/sp/index.html>sp</a>, ",
                    "<a href=https://cran.r-project.org/web/packages/automap/index.html>automap</a> and ",
                    "<a href=https://cran.r-project.org/web/packages/shiny/index.html>shiny</a>, by ",
                    "G.Bonaf&egrave; <a href=http://www.arpa.fvg.it>ARPA FVG</a> - ",
                    "<a href=http://www.arpa.fvg.it/cms/istituzionale/chi-siamo/agenzia/centri_valenza_regionale/Centri-valenza-regionale.html#ancora3>CRMA</a> &copy; 2016",
                    "<br>Hosting: <a href=http://www.arpae.it>Arpae</a>"))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))

