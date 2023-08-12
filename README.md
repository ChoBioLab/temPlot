# temPlot
A collection of useful plotting template functions


Upset Plots:

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
Run
```
upsetplotting(a, "gene overlap", 25)
```
<img width="1440" alt="Screenshot 2023-08-12 at 12 06 39 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/7c9eff38-43e9-4fed-81fe-1bb870a77433">
