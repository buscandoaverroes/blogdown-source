# makes favicon, thanks to https://www.r-bloggers.com/2019/02/creating-a-favicon-with-r/
library(tidyverse)

favicon_data <- read_table("x y
                           .50 .00
                           .00 .66
                           .16 .9
                           .84 .9
                           1.0 .66
                           .50 .00
                           .33 .66
                           .50 .9
                           .66 .66
                           .50 .00
                           .00 .66
                           1.0 .66
                           .84 .9
                           .66 .66
                           .33 .66
                           .16 .9")

# create ggplot of favicon
favicon <- favicon_data %>%
  ggplot(aes(x = x, y = y)) +
  geom_path(lineend = "round", linejoin = "round", linewidth = .5) +
  theme_void() +
  theme(aspect.ratio = .9) # Make it a little more squatty
favicon

# save favicons

static <- file.path("/Volumes/Al-Hakem-II/r/blogdown-source/themes/blowfish/static/rawfav")

ggsave(file.path(static, "favicon.svg"), scale = 1, width = .25, height = .25, bg = "transparent")
ggsave(file.path(static, "favicon16.png"), scale = 1, width = 1, height = 1, dpi = 16, bg = "transparent")

favicon <- favicon_data %>%
  ggplot(aes(x = x, y = y)) +
  geom_path(lineend = "round", linejoin = "round", size = 1) +
  theme_void() +
  theme(aspect.ratio = .9)

# save the 32x32 favicon
ggsave("favicon32.png", plot = favicon, scale = 1, width = 1, height = 1, dpi = 32, bg = "transparent")