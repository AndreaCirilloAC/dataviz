library(dplyr)
library(jpeg)
library(ggplot2)
library(ggrepel)
#read file
painting     <- readJPEG("images/sacra_famiglia_canigiani.jpg")
dimension    <- dim(painting)
painting_rgb <- data.frame(
  x = rep(1:dimension[2], each = dimension[1]),
  y = rep(dimension[1]:1, dimension[2]),
  R = as.vector(painting[,,1]),
  G = as.vector(painting[,,2]),
  B = as.vector(painting[,,3])
)

#apply clustering

n_clusters     <- 32
k_means        <- kmeans(painting_rgb[,c("R","G","B")], centers = n_clusters, iter.max = 30)
colours_vector <- rgb(k_means$centers)
show_col(colours_vector)

#apply resulting palette

ggplot(data = mtcars,aes(x=disp,y = hp, color= rownames(mtcars)))+
  geom_point(stat = 'identity',aes( size = cyl))+
  scale_color_manual(values = colours_vector)+
  theme_minimal()+
    geom_text(label = rownames(mtcars), color = 'grey40', check_overlap = TRUE)

#palette_maker function

palette_maker <- function(image_path = NA, number_of_colors = 20){
  if (is.na(image_path)){stop("you must provide a jpg image to build your palette from")}
  painting     <- readJPEG(image_path)
  dimension    <- dim(painting)
  painting_rgb <- data.frame(
    x = rep(1:dimension[2], each = dimension[1]),
    y = rep(dimension[1]:1, dimension[2]),
    R = as.vector(painting[,,1]),
    G = as.vector(painting[,,2]),
    B = as.vector(painting[,,3])
  )
  k_means        <- kmeans(painting_rgb[,c("R","G","B")], centers = number_of_colors, iter.max = 30)
  colours_k      <- rgb(k_means$centers[k_means$cluster,])
  colours_vector <- unique(colours_k)
  show_col(colours_vector)
  return(colours_vector)
  }
