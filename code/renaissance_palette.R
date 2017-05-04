library(pixmap)
library(dplyr)
library(scales)
#convert aminadab_rgb.jpg aminadab_rgb.ppm

palette_sampler <- function(path_to_pnm,n_sample){
  pnm <- read.pnm(path_to_pnm)
  red_vector           <- as.vector(pnm@red)
  green_vector         <- as.vector(pnm@green)
  blue_vector          <- as.vector(pnm@blue)
  
  data.frame(red_vector,green_vector,blue_vector) %>% 
    unique() -> rgb_triples
  rgb_codes <- rgb(red = rgb_triples[,1],green = rgb_triples[,2], blue = rgb_triples[,3])
  return(sample(rgb_codes,n_sample))
}

sample_400 <- palette_sampler("images/sacra_famiglia_canigiani.ppm",400)
show_col(sample_400)
