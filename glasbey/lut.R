library(data.table)
library(magrittr)
library(ggplot2)

lut = fread("glasbey/glasbey.txt") %>%
  .[, Hex := rgb(Red, Green, Blue, maxColorValue = 255)] %>%
  .[, X := rep(1:20, length = 256)] %>%
  .[, Y := rep(1:13, each = 20)[1:256]]

p = ggplot(lut, aes(x = X, y = Y, fill = Hex)) +
  geom_tile() +
  geom_text(aes(label = Index)) +
  scale_fill_identity() +
  theme_void()

ggsave("glasbey/glasbey.png", p, width = 9, height = 6, dpi = 900)
