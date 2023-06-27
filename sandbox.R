#chris idk where to put any code so it's going here

#scatterplot
a <- mtcars
ggplot(a, aes(cyl,mpg, color= cyl))+ geom_point(size = 2) +  xlab("mpg for diff cars") + ylab("cyl for diff cars") +
    theme_light() +
    theme(legend.position="none", legend.title = element_blank()) +
    theme(axis.text = element_text(colour = "black", family = "Arial", size = 14), axis.title = element_text(size = 14))

#heatmap
a<- mtcars
mtcarsdata<- as.matrix(mtcars)+
heatmap(mtcarsdata, scale="column")

#boxplot
a <- mtcars
ggplot(a, aes(x=cyl, y=mpg, color= cyl))+
geom_boxplot()+
xlab("cyl")+
ylab("mpg")

#how do i make a dotplot with this...looked at Rachel's code from figure 2F
do_DotPlot(mtcars,
features= #what goes here?
,cluster.idents= TRUE
use_viridis= TRUE
viridis_color_map = 'viridis',
viridis_direction = 1)+
ggplot2::theme(legend.position = 'bottom')

#how do i make volcano plots without log2FC data(mtcars) or can i not do that?
