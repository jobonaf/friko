library(sp)
library(automap, lib.loc = "/home/giovanni/R/x86_64-pc-linux-gnu-library/3.2")

create.grid <- function(data,res){
  grid = spsample(data, type = "regular", cellsize = res)
  gridded(grid) = TRUE
  fullgrid(grid) = TRUE
  return(grid)
}

read.n.krig <- function(filein,valcol,sep=",",res) {
  data <- read.table(filein, sep=sep, header=T)
  data <-SpatialPointsDataFrame(data[,c("x","y")], data)
  fmla <- as.formula(paste0(valcol,"~1"))
  grid <- create.grid(data,res)
  result = autoKrige(fmla, data, grid)
  return(result)
}

