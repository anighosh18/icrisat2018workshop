library(ggplot2)
library(ggrepel)

Ex1 <- read.csv("./Data/R Graphics.csv")
irri_yes <- subset(Ex1, irrigation == "yes")
irri_no <- subset(Ex1, irrigation == "no")

# Resources
# Cheatsheet: https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html
# 

# Grammar of Graphics: Independently control/design building blocks and then combine them 
# Making the plot increasingly complex
# data
# aesthetic mapping
# geometric object
# statistical transformations
# scales
# coordinate system
# position adjustments
# faceting

#plot(x,y) # X-Y plotting
#Example1: Simple scatter plot

qplot(x = yield, y = conc, data = irri_yes,
      xlab = "Concentration", 
      ylab = "Yield",
      main = "Yield Vs Concentration")


qplot(x = yield, y = conc, data = irri_yes,
      xlab = "Concentration", 
      ylab = "Yield",
      main = "Yield Vs Concentration",
      geom = c("point","smooth"))

# Legend and color
qplot(x = yield, y = conc, data = Ex1, color = irrigation)

# facets 
# .~ irrigation ->  row .~ column 
qplot(x = yield, y = conc, data = Ex1, facets = .~irrigation)


qplot(x = yield, y = conc, data = Ex1, facets = irrigation~.)


# density smooth
qplot(conc, data = irri_no, geom = "density")

qplot(yield, data = Ex1, geom = "density", col = irrigation)

qplot(x = yield, y = conc, data = Ex1, color = irrigation,
      geom = c("point", "smooth"), method = "lm")

qplot(x = yield, y = conc, data = Ex1, facets = .~irrigation,
      geom = c("point", "smooth"), method = "lm")


# Finer controls
# Adjusting the annotations size: Aesthetics
# Note: Aesthetics -> things we can see
# position (i.e., on the x and y axes)
# color (“outside” color)
# fill (“inside” color)
# shape (of points)
# linetype
# size
# alpha (transparency)

p <- qplot(x = yield, y = conc, data = irri_yes,
           xlab = "Concentration", 
           ylab = "Yield",
           main = "Yield Vs Concentration")

# Axis labels and title
p + theme(axis.title=element_text(face="bold.italic", 
                                  size="12", color="brown"),
          plot.title = element_text(hjust = 0.5))

# Symbols, sizes and colors of the plots
# Step 1
p + 
  aes(color = irrigation) +
  theme(axis.title = element_text(face="bold.italic", 
                                size="12", color="brown"),
        plot.title = element_text(hjust = 0.5))

# Step 2
p 

aes_p <- aes(shape = 21, color = "blue", size = 4, alpha = 2/3)

th_p <-  theme(axis.title = element_text(face="bold.italic", 
                                  size="12", color="brown"),
        plot.title = element_text(hjust = 0.5))

p + aes_p + th_p + scale_shape_identity() # scale_shape_identity is needed for integer variables


# Turning off the legends for some of the aesthetics

p_guide <- guides(color=FALSE, size = FALSE, shape = FALSE, alpha = FALSE)

# Without any legend
p + aes_p + th_p + p_guide + scale_shape_identity()

# add a custom text and legend
p_labs <- labs(title="Yield Vs Conc", y="Conc", x="Yield", caption="IRRI")

p_guide <- guides(color=guide_legend("irrigation"), size = FALSE, shape = FALSE, alpha = FALSE)

p + aes_p + th_p + p_guide + p_labs + scale_shape_identity()

# Finding help
help.search("geom_point", package = "ggplot2")
