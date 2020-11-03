library(tidyverse)
library(modelr)
options(na.action = na.warn)

ggplot(sim1, aes(x, y)) + 
  geom_point()


sim1_mod <- lm(y ~ x, data = sim1)
coef(sim1_mod)

grid <- sim1 %>% 
  data_grid(x) 
grid

grid <- grid %>% 
  add_predictions(sim1_mod) 
grid

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), data = grid, colour = "red", size = 1)

sim1 <- sim1 %>% 
  add_residuals(sim1_mod)
sim1

ggplot(sim1, aes(resid)) + 
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1, aes(x, resid)) + 
  geom_ref_line(h = 0) +
  geom_point() 
mod1 <- lm(y ~ x1 + x2, data = sim3)
mod2 <- lm(y ~ x1 * x2, data = sim3)

grid <- sim3 %>% 
  data_grid(x1, x2) %>% 
  gather_predictions(mod1, mod2)
grid

ggplot(sim3, aes(x1, y, colour = x2)) + 
  geom_point() + 
  geom_line(data = grid, aes(y = pred)) + 
  facet_wrap(~ model)
sim3 <- sim3 %>% 
  gather_residuals(mod1, mod2)

ggplot(sim3, aes(x1, resid, colour = x2)) + 
  geom_point() + 
  facet_grid(model ~ x2)


