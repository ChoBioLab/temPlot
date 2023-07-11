#chris idk where to put any code so it's going here

#scatterplot
a <- mtcars
ggplot(a, aes(cyl,mpg, color= cyl))+ 
    geom_point(size = 2) +  
    xlab("mpg for diff cars") + 
    ylab("cyl for diff cars") +
    theme_light() +
    theme(legend.position="none", legend.title = element_blank()) +
    theme(axis.text = element_text(colour = "black", family = "Arial", size = 14), axis.title = element_text(size = 14))
#in function
geompointfunction <- function(dataset, xval, yval){
    return(
    ggplot(dataset, aes_string(x= xval,y= yval, color= xval))+ 
        geom_point(size = 2) +  
        xlab(paste(xval,"for diff cars", collapse = NULL))+ 
        ylab(paste(yval,"for diff cars", collapse = NULL)) +
        theme_light() +
        theme(legend.position="none", legend.title = element_blank()) +
        theme(axis.text = element_text(colour = "black", family = "Arial", size = 14), axis.title = element_text(size = 14))
    )
}
geompointfunction(mtcars, "mpg", "cyl")

#heatmap
a<- mtcars
mtcarsdata<- as.matrix(mtcars)+
heatmap(mtcarsdata, scale="column")

#pheatmap
pheatmap(mtcars, scale="column", show_rownames=TRUE, fontsize_row=10, fontsize_col= 10)

#boxplot
a<- mtcars
ggplot(a, aes(x = factor(cyl), y = mpg, color = factor(cyl))) +
  geom_boxplot() +
  xlab("cyl") +
  ylab("mpg")
#in function
geomboxfunction <- function(dataset1, xval1, yval1) {
  dataset1[[xval1]] <- factor(dataset1[[xval1]])
  return(
    ggplot(dataset1, aes_string(x = xval1, y = yval1, color = xval1)) +
      geom_boxplot() +
      xlab(xval1) +
      ylab(yval1)
  )
}

geomboxfunction(mtcars, "cyl", "mpg")
