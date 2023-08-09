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
geompointfunction <- function(dataset, xval, yval, xlabel, ylabel){
    return(
    ggplot(dataset, aes_string(x= xval,y= yval, color= xval))+ 
        geom_point(size = 2) +  
        xlab(paste(xlabel, collapse = NULL))+ 
        ylab(paste(ylabel, collapse = NULL)) +
        theme_light() +
        theme(legend.position="none", legend.title = element_blank()) +
        theme(axis.text = element_text(colour = "black", family = "Arial", size = 14), axis.title = element_text(size = 14))
    )
}
geompointfunction(mtcars, "mpg", "cyl", "mpg for diff cars", "cyl for diff cars")

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


#venn diagram
sepallength <- paste("sepal.length",1:10,sep="")
set.seed(20210419)
x<- list(setosa = subset(iris, Species == "setosa")$Sepal.Length,
  versicolor = subset(iris, Species == "versicolor")$Sepal.Length,
  virginica = subset(iris, Species == "virginica")$Sepal.Length   
        )

library(ggplot2)
library(ggVennDiagram)
ggVennDiagram(x) + scale_fill_gradient(low="blue",high = "red")


#upsetplot
library(ComplexUpset)

#example data set
set.seed(20190708)
genes <- paste("gene",1:1000,sep="")
g <- list(
    A = sample(genes,300), 
    B = sample(genes,525), 
    C = sample(genes,440),
    D = sample(genes,350) 
    )

#list into binary data and then into data frame
binary_matrix <- sapply(g, function(set_genes) genes %in% set_genes)
a <- as.data.frame(binary_matrix)
                        
upset(a, 
    intersect, 
    name= "genes",
    width_ratio = 0.1,
    queries= list(
        upset_query(
            #highlighting any intersections
            intersect=c("A","D"),
            color="red",
            fill="red"
        ),
            #highlighting any sets on size bar
        upset_query(
            set="B",
            fill="blue"
        )
    )
)
