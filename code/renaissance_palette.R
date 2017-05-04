library(pixmap)
library(dplyr)
#convert aminadab_rgb.jpg aminadab_rgb.ppm

painting_michelangelo <- read.pnm("images/aminadab_rgb.ppm")
str(painting_michelangelo)
plot(painting_michelangelo)
red_vector           <- as.vector(painting_michelangelo@red)
green_vector         <- as.vector(painting_michelangelo@green)
blue_vector          <- as.vector(painting_michelangelo@blue)

data.frame(red_vector,green_vector,blue_vector) %>% 
  unique() -> rgb_triples
rgb_codes <- rgb(red = rgb_triples[,1],green = rgb_triples[,2], blue = rgb_triples[,3])

show_col(rgb_codes)

painting_raffaello <- read.pnm("images/sacra_famiglia_canigiani.ppm")
red_vector           <- as.vector(painting_raffaello@red)
green_vector         <- as.vector(painting_raffaello@green)
blue_vector          <- as.vector(painting_raffaello@blue)

data.frame(red_vector,green_vector,blue_vector) %>% 
  unique() -> rgb_triples
rgb_codes <- rgb(red = rgb_triples[,1],green = rgb_triples[,2], blue = rgb_triples[,3])

show_col(rgb_codes)
