shinyServer(function(input, output) {
  output$plot <- renderPlot(width=600,height=600,expr={
    
    inFile <- input$file1    
    
    if (is.null(inFile) | input$upload==0){
      plot(1,1,type="n",xaxt="n",yaxt="n",xlab="",ylab="")
      text(1,1,"no data")
    } else {
      read.n.krig(filein=inFile$datapath,
                  valcol=input$valcol,
                  res=input$res) -> result   
      plot(result)
    }
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste0(input$valcol,"_krig",
             input$res,
             ".csv")
    },
    
    content = function(file) {
      
      inFile <- input$file1    
      
      read.n.krig(filein=inFile$datapath,
                  valcol=input$valcol,
                  res=input$res) -> result   
      out <- data.frame(round(coordinates(result$krige_output@grid)),
                        signif(result$krige_output@data,5))
      colnames(out) <- c("x","y",
                         paste0(input$valcol,c(".pred",".var",".stdev")))
      write.table(out, file, sep = ",",
                  row.names = FALSE)
    }
  )
  
})
