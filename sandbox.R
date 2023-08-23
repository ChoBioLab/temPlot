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
geompointfunction <- function(dataset, xval, yval, xlabel, ylabel, maintitle){
    return(
    ggplot(dataset, aes_string(x= xval,y= yval, color= xval))+ 
        geom_point(size = 2) +  
        labs(x=paste(xlabel, collapse = NULL),
        y=paste(ylabel, collapse = NULL), 
        title= paste(maintitle, collapse = NULL)
        ) +
        theme_light() +
        theme(legend.position="none", 
        legend.title = element_blank(), 
        plot.title = element_text(hjust=0.5)
        ) +
        theme(axis.text = element_text(colour = "black", family = "Arial", size = 14), axis.title = element_text(size = 14))
    )
}
geompointfunction(mtcars, "mpg", "cyl", "mpg for diff cars", "cyl for diff cars", "Mpg vs Cyl in Cool Cars")

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
geomboxfunction <- function(dataset1, xval1, yval1, maintitle) {
  dataset1[[xval1]] <- factor(dataset1[[xval1]])
  return(
    ggplot(dataset1, aes_string(x = xval1, y = yval1, color = xval1)) +
      geom_boxplot() +
      labs(x=paste(xval1, collapse = NULL),
        y=paste(yval1, collapse = NULL), 
        title= paste(maintitle, collapse = NULL)
        ) +
      theme(
        plot.title = element_text(hjust=0.5)
          )
  )
}

geomboxfunction(mtcars, "cyl", "mpg", geomboxfunction(mtcars, "cyl", "mpg", "Cyl vs Mpg in Cool Cars"))


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

#manually editing
upsetplotting <- function(dataset,title,min_int) {
upset(dataset, 
    intersect, 
    name= paste(title),
    width_ratio = 0.1,
    min_size = min_int,
    queries= list(
        upset_query(
            #highlighting any # of intersections
            intersect=c("A","D"),
            color="red",
            fill="red"
        ),
            #highlighting any sets on size bar
        upset_query(
            set="B",
            fill="blue"
        )
    ),
    set_sizes=(
        upset_set_size()
        + theme(axis.ticks.x=element_line())
    )
)
}

#user decides to highlight intersection
upsetplotting2 <- function(dataset,title,min_int,high_int=FALSE, intgroups) {
upset(dataset, 
    intersect, 
    name= paste(title),
    width_ratio = 0.1,
    min_size = min_int,
    if (high_int){
    queries= list(
        upset_query(
            #highlighting any # of intersections
            intersect=intgroups,
            color="red",
            fill="red"
        )
    )
},
    set_sizes=(
        upset_set_size()
        + theme(axis.ticks.x=element_line())
    )
)
}

upsetplotting2(a, "plot title yay", 25, high_int= TRUE, intgroups= c("A","D"))
