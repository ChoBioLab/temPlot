# temPlot
A collection of useful plotting template functions


## Upset Plots:

Example data set
```
set.seed(20190708)
genes <- paste("gene",1:1000,sep="")
g <- list(
    A = sample(genes,300), 
    B = sample(genes,525), 
    C = sample(genes,440),
    D = sample(genes,350) 
    )
```

Turning list into binary matrix
```
binary_matrix <- sapply(g, function(set_genes) genes %in% set_genes)
```

Turning binary matrix into **dataframe** (required class for upset function)
```
a <- as.data.frame(binary_matrix)
```
Upset plotting function requires
- dataset (as dataframe)
- title (of plot in quotes "")
- min_int (threshold for minimum number of intersections to be shown in plot)

```
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
    )
)
}
```
Run:
```
upsetplotting(a, "gene overlap", 25)
```
to get:
<img width="1440" alt="Screenshot 2023-08-12 at 12 06 39 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/7c9eff38-43e9-4fed-81fe-1bb870a77433">

Note:
This part of the code can be manually modified to highlight specific intersections or set sizes as needed.
```
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
    )
```
For example, you may want to highlight an intersection pink between 3 groups called bubbles, blossom, and buttercup. 
In addition, maybe you'd like to highlight the blossom set orange.
This code would be modified to read:
```
upset_query(
    intersect=c("bubbles","blossom","buttercup"),
    color="pink",
    fill="pink"
    ),
upset_query(
    set="blossom",
    fill="orange"
    )
```


## Dot Plots:
```
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
```

Example using mtcars dataset:
Run
```
geompointfunction(mtcars, "mpg", "cyl", "mpg for diff cars", "cyl for diff cars", "Mpg vs Cyl in Cool Cars")
```
to get:
<img width="1111" alt="Screenshot 2023-08-13 at 10 41 39 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/5c1acb0e-a65f-4128-b295-b8f86a410891">
