######### 2. Approximera pi med sampling #############

set.seed(16)
nr_of_iterations <- 1000

#runif samples from a uniform distribution
x <- runif(nr_of_iterations, min=0, max=1)
y <- runif(nr_of_iterations, min=0, max=1)

#criteria for choosing sample values in a circle
points_within_circle <- which(sqrt(x^2 + y^2) <= 1) #displays index of points within circle
points_outside_circle <- which(sqrt(x^2 + y^2) > 1) #shows index of points outside circle

#An approximate value of pi from the sampled value 
pi_hat <- 4*(length(points_within_circle)/nr_of_iterations) #estimate of "pi
abs_diff <- abs(pi - pi_hat)
print(abs_diff)  # om "abs_diff" blir närmare till noll då har vi bra estimate för "pi"
                 # samt kan man få bättre approximering för pi med sampling
                 # genom att öka "nr_of_iterations".

df_xy <- data.frame(x,y)
library(tidyverse)
df_xy <- as_tibble(df_xy)
print(df_xy)

#scatter plot för samplade värden.
library(ggplot2)
sc <- ggplot(df_xy, aes(x, y)) + 
  geom_point() +
  ggtitle("Scatter plot with lines!") +
  xlab("X-value") + ylab("Y-value")
sc

#cirkelbågar för avstånden 0.4, 0.8 och 1.0 ifrån origo, [0,0]
sc_with_curve_1 <- sc + 
  geom_curve(x=0, y=0.4, xend = 0.4, yend = 0, curvature = -0.5 , col="yellow")
print(sc_with_curve_1)
sc_with_curve_2 <- sc_with_curve_1 + 
  geom_curve(x=0, y=0.8, xend = 0.8, yend = 0, curvature = -0.5, col="red") 
print(sc_with_curve_2)
sc_with_curve_3 <- sc_with_curve_2 + 
  geom_curve(x=0, y=1.0, xend = 1.0, yend = 0, curvature = -0.5, col="blue")
print(sc_with_curve_3)