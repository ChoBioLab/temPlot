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
- high_int set to either TRUE or FALSE that highlights a specific intersection between sets red
- intgroups, a vector of character strings with names of intersections you want to highlight 


Run:
```
upsetplotting2(a, "plot title yay", 25, high_int = TRUE, intgroups = c("A", "D"))
```
to get:
<img width="1317" alt="Screenshot 2023-08-23 at 1 46 57 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/34b14820-8687-46fd-ab7f-fb71e5f398b9">


## Dot Plots:

geompointfunction requires:
- dataset
- xval, independent variable
- yval, dependent variable
- xlabel, title of x-axis in quotes
- ylabel, title of y-axis in quotes
- maintitle, title of figure

Example using mtcars dataset:

Run:
```
geompointfunction(mtcars, "mpg", "cyl", "mpg for diff cars", "cyl for diff cars", "Mpg vs Cyl in Cool Cars")
```
to get:
<img width="1111" alt="Screenshot 2023-08-13 at 10 41 39 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/5c1acb0e-a65f-4128-b295-b8f86a410891">

## Box Plots:

geomboxfunction requires:
- dataset1
- xval1, independent variable
- yval1, dependent variable
- xlab1, title of x-axis in quotes
- ylab1, title of y-axis in quotes
- maintitle, title of figure

Example using mtcars data set:

Run:
```
geomboxfunction(mtcars, "cyl", "mpg", "cylinder", "miles per gallon", "Cyl vs Mpg in Cool Cars")
```
to get:
<img width="683" alt="Screenshot 2023-08-23 at 2 12 26 PM" src="https://github.com/ChoBioLab/temPlot/assets/137223320/acbf8eba-49ed-4b24-b1a5-329d03a9a5c7">
