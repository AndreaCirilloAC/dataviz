library(pixmap)
library(dplyr)
#convert aminadab_rgb.jpg aminadab_rgb.ppm
read.pnm("images/aminadab_rgb.ppm")
painting_michelangelo <- read.pnm("images/aminadab_rgb.ppm")
str(painting_michelangelo)
plot(painting_michelangelo)
red_vector           <- as.vector(painting_michelangelo@red)
green_vector         <- as.vector(painting_michelangelo@green)
blue_vector          <- as.vector(painting_michelangelo@blue)

data.frame(red_vector,green_vector,blue_vector) %>% 
  unique() -> rgb_triples
