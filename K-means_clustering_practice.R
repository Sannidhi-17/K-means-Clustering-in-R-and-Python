# read the data
data("USArrests.csv")
df <- scale(USArrests)
head(df)

# Compute the Kmeans
set.seed(101)
km.res <- kmeans(df, 4, nstart = 1)
km.res
# Its possible to compute the mean of the each variable in the cluster
aggregate(USArrests, by = list(cluster = km.res$cluster), mean)

# Visualization
library(factoextra)
library(ggplot2)

fviz_cluster(km.res, data=df, ggtheme = theme_minimal())