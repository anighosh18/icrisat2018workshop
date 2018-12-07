
# Scatterplot
# https://ggplot2.tidyverse.org/reference/geom_point.html

g <- ggplot(Ex1, aes(x = yield, y = conc, color = irrigation))
g
summary(g)

# plot
g + geom_point()

# Add labels
g +
  geom_point(aes(color = "blue", size = 4, alpha = 2/3, shape = 16)) +
  labs(title="Yield Vs Conc", y="Conc", x="Yield", caption="IRRI") +
  scale_shape_identity()

# Add text to the points

g_pt <- geom_point(aes(color = "blue", size = 4, 
                       alpha = 2/3, shape = 16))

g_lab <- labs(title="Yield Vs Conc", y="Conc", x="Yield", 
              caption="IRRI")

g_text <- geom_text(aes(label=conc), size = 3)

g + g_pt + g_lab + g_text + scale_shape_identity()
  

# Place the texts in nicer position


g_text <- geom_text_repel(aes(label=conc), size = 3)

g + g_pt + g_lab + g_text + scale_shape_identity()
  

# Create legend for everything in the aesthetics
g +
  geom_point(aes(size = color = "blue", size = 4, alpha = 2/3)) +
  labs(title="Yield Vs Conc", y="Conc", x="Yield", caption="IRRI") +
  labs(color="blue", size = "Density")

# Add custom color
# Try scale_ +tab

g + 
  geom_point() +
  scale_x_continuous(name = "Yield") +
  scale_y_continuous(name = "Concentration") +
  scale_color_manual(name = "Legend",
                     values = c("blue"))


# Adding a smooth loess line
p <- g + geom_point() + geom_smooth()
p

# loess smoother to linear model
p <- g + geom_point() + geom_smooth(method = "lm")
p

# facets or plot by groups
p <- ggplot(data = Ex1, aes(x = yield, y = conc)) + 
  geom_point(aes(color = irrigation,
                 size = 4, alpha = 2/3)) + 
  geom_smooth(method = "lm")
p


p <- ggplot(data = Ex1, aes(x = yield, y = conc)) + 
  geom_point(aes(color = irrigation,
                 size = 4, alpha = 2/3, show.legend = FALSE)) + 
  geom_smooth(size = 2, linetype = 2, method = "lm", se = FALSE) +
  show.legend
p


p <- ggplot(data = Ex1, aes(x = yield, y = conc)) + 
  geom_point(aes(color = irrigation,
                 size = 4, alpha = 2/3)) + 
  geom_smooth(size = 2, linetype = 2, 
              method = "lm", se = FALSE) +
  theme_bw(base_family = "Times")
p


p <- ggplot(data = Ex1, aes(x = yield, y = conc)) + 
  geom_point(aes(color = irrigation,
                 size = 4, alpha = 2/3)) + 
  geom_smooth(size = 2, linetype = 2, 
              method = "lm", se = FALSE) +
  theme_bw(base_family = "Times") +
  coord_cartesian(ylim=c(0,1)) # or use jut ylim = c(0,1)
p


ggplot(Ex1, aes(yield, conc)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)
