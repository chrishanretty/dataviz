## ----knitropts, echo = FALSE, message = FALSE---------------------------------

knitr::opts_chunk$set(dpi=300,fig.width=4.5, fig.height = 4, warning = TRUE, message = TRUE, out.width = "100%")



## ----loadlibs-----------------------------------------------------------------
library(tidyverse)


## ----loadlibs2, echo = FALSE--------------------------------------------------
library(flipbookr)


## ----datin--------------------------------------------------------------------
dat <- read.csv("gdp_dem_data.csv")


## ----datlook------------------------------------------------------------------
head(dat, 5)


## ----figcode, eval = FALSE, echo = FALSE--------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) +
##     geom_point() +
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") +
##     theme_bw()


## ----figcode, eval = FALSE----------------------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) +
##     geom_point() +
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") +
##     theme_bw()


## ----figcode2, eval = FALSE---------------------------------------------------
## ggplot(dat, aes(x = gdp_pc_1992, y = v2x_libdem)) +
##     geom_point() +
##     scale_x_log10("GDP per capita in 1992, US$",
##                   breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     scale_y_continuous("V-Dem measure of liberal democracy")
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now",
##          caption = "Source: V-Dem, Penn World Tables") +
##     theme_bw()


## ----trendline, eval = FALSE--------------------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) +
##     geom_point() +
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK
##     geom_smooth(method = "lm") +
##     theme_bw()


## ----addaes, eval = FALSE-----------------------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) + #BREAK
##     aes(colour = e_regiongeo) + #BREAK2
##     geom_point() + #BREAK3
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK4
##     scale_colour_discrete("Region") +
##     theme_bw() + #BREAK5
##     theme(legend.position = "bottom")


## ----addaes2, echo = FALSE, eval = FALSE--------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) + #BREAK
##     aes(size = pop) + #BREAK2
##     geom_point(alpha = 0.5) + #BREAK3
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400, 1000,
##                              4000, 10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK4
##     scale_colour_discrete("Region") +
##     scale_size_continuous(guide = FALSE) +
##     theme_bw() + #BREAK5
##     theme(legend.position = "bottom")


## ----smallmults, eval = FALSE-------------------------------------------------
## ggplot(dat) +
##     aes(x = gdp_pc_1992) +
##     aes(y = v2x_libdem) + #BREAK
##     aes(size = pop) + #BREAK2
##     geom_point(alpha = 0.5) + #BREAK3
##     xlab("GDP per capita in 1992, US$") +
##     ylab("V-Dem measure of liberal democracy") +
##     scale_x_log10(breaks = c(400,
##                              10000,
##                              40000)) +
##     labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
##     labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK4
##     scale_colour_discrete("Region") +
##     scale_size_continuous(guide = FALSE) +
##     facet_wrap(~e_regiongeo) +
##     geom_smooth(method = "lm", se = FALSE) +
##     theme_bw() + #BREAK5
##     theme(legend.position = "bottom")

