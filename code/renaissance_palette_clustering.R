library(dplyr)
library(jpeg)
library(ggplot2)
#read file
painting <- readJPEG("images/profeta_daniele.jpg")
dimension <- dim(painting)
painting_rgb <- data.frame(
  x = rep(1:dimension[2], each = dimension[1]),
  y = rep(dimension[1]:1, dimension[2]),
  R = as.vector(painting[,,1]),
  G = as.vector(painting[,,2]),
  B = as.vector(painting[,,3])
)

#apply clustering

n_clusters <- 20
k_means    <- kmeans(painting_rgb[,c("R","G","B")], centers = n_clusters, iter.max = 30)
colours_k  <- rgb(k_means$centers[k_means$cluster,])
colours_vector <- unique(colours_k)
show_col(colours_vector)

ggplot(data = painting_rgb, aes(x = x, y = y)) + 
  geom_point(colour = colours_k)
