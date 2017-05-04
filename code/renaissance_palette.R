library(pixmap)
library(dplyr)
library(scales)
#convert aminadab_rgb.jpg aminadab_rgb.ppm

palette_crafter <- function(path_to_pnm, n_colours, n_sample){
  pnm <- read.pnm(path_to_pnm)
  red_vector           <- as.vector(pnm@red)
  green_vector         <- as.vector(pnm@green)
  blue_vector          <- as.vector(pnm@blue)
  
  data.frame(red_vector,green_vector,blue_vector) -> rgb_triples
    rgb(red = rgb_triples[,1],green = rgb_triples[,2], blue = rgb_triples[,3]) %>% 
    table() %>% 
    as.data.frame() %>% 
    arrange(desc(Freq)) %>% 
    select(1) %>% 
    head(n = n_colours) -> rgb_main
  
    sample( rgb_main[,1], size = n_sample) %>% 
    as.vector()
}
sample_michelangelo <- palette_crafter("images/sacra_famiglia_canigiani.ppm",n_colours =1000,n_sample =400 )
show_col(as.vector(sample_michelangelo), cex_label = 0.4)

sample_raffaello <- palette_crafter("images/profeta_daniele.ppm",30)

#hacking show_col

show_col_hack <- function (colours, labels = TRUE, borders = NULL,cex_label = 1) 
{
colours= sample_raffaello
    n <- length(colours)
  ncol <- ceiling(sqrt(n))
  nrow <- ceiling(n/ncol)
  colours <- c(colours, rep(NA, nrow * ncol - length(colours)))
  colours <- matrix(colours, ncol = ncol, byrow = TRUE)
  old <- par(pty = "s", mar = c(0, 0, 0, 0))
  on.exit(par(old))
  size <- max(dim(colours))
  plot(c(0, size), c(0, -size), type = "n", xlab = "", ylab = "", 
       axes = FALSE)
  rect(col(colours) - 1, -row(colours) + 1, col(colours), -row(colours), 
       col = colours, border = FALSE)
  if (labels) {
    text(col(colours) - 0.5, -row(colours) + 0.5, colours, cex = cex_label)
  }
}

show_col_hack(sample_michelangelo,cex_label = 0.4, border = FALSE)
show_col_hack(sample_raffaello,text_size = 0.4)
