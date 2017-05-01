library(pixmap)
#convert aminadab_rgb.jpg aminadab_rgb.ppm
read.pnm("images/aminadab_rgb.ppm")
painting_michelangelo <- read.pnm("images/aminadab_rgb.ppm")
dim(painting_michelangelo)
str(painting_michelangelo)
plot(painting_michelangelo)
plot(painting_michelangelo[1,1])
