library(ggplot2)
library(ggridges)
ggplot(iris, aes(x = Sepal.Length, y = Species, fill = Species)) +
  geom_density_ridges(
    aes(point_color = Species, point_fill = Species, point_shape = Species),
    alpha = .2, point_alpha = 1, jittered_points = TRUE
  ) +
  scale_point_color_hue(l = 40) +
  scale_discrete_manual(aesthetics = "point_shape", values = c(21, 22, 23))