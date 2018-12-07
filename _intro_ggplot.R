# Scatterplot
# https://ggplot2.tidyverse.org/reference/geom_point.html

Ex1 <- read.csv("./Data/R Graphics.csv")

g <- ggplot(Ex1, aes(x = yield, y = conc, color = irrigation))
g
summary(g)

# plot
g + geom_point()

# Add labels

g_geom <- geom_point(aes(size = 4, 
                         alpha = 2/3, shape = 16))

g_labs <- labs(title="Yield Vs Conc", 
               y="Conc", x="Yield", caption="IRRI")

g + geom_point() + g_geom + g_labs + scale_shape_identity()

# Add text to the points
g_text <- geom_text(aes(label=conc), size = 3, color = "black")

g + g_geom + g_labs + g_text + scale_shape_identity()
  

# Place the texts in nicer position
g_text <- ggrepel::geom_text_repel(aes(label=conc),
                                   size = 3, color = "black")

g + g_geom + g_labs + g_text + scale_shape_identity()
  
# Add custom color
# Try scale_ +tab


g_xscale <- scale_x_continuous(name = "Yield")

g_yscale <- scale_y_continuous(name = "Concentration")
  
g_scalecol <- scale_color_manual(name = "Legend", 
                                 values = c("red","blue"))

g + geom_point() + g_xscale + g_yscale + g_scalecol

# Adding a smooth loess line
p <- g + geom_point() + geom_smooth()
p

# loess smoother to linear model
p <- g + geom_point() + geom_smooth(method = "lm")
p


# add smooth with lm
p <- ggplot(data = Ex1, aes(x = yield, y = conc)) 

p_geom <- geom_point(aes(color = irrigation, size = 4, alpha = 2/3))

p + p_geom + geom_smooth(method = "lm")


# Chage the background
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
  coord_cartesian(ylim=c(0,1)) # or use just ylim = c(0,1)
p


# Control legend
p <- ggplot(data = Ex1, aes(x = yield, y = conc)) + 
  geom_point(aes(color = irrigation,
                 size = 4, alpha = 2/3, show.legend = FALSE)) + 
  geom_smooth(size = 2, linetype = 2, method = "lm", se = FALSE) +
  
  guides(color=guide_legend("Irrigation"), 
                    size = FALSE, shape = FALSE, alpha = FALSE)
p
