## ----knitropts, echo = FALSE, message = FALSE---------------------------------

knitr::opts_chunk$set(dpi=300,fig.width=4.5, fig.height = 4, warning = TRUE, message = TRUE, out.width = "100%")



## ----loadlibs, echo = FALSE, message = FALSE----------------------------------
library(tidyverse)
library(flipbookr)


## ----gendata, echo = FALSE----------------------------------------------------
set.seed(2033)
dat <- data.frame(fac = "a",
                  y = rt(250, 5, 0))



## ----egplot, echo = FALSE, eval = FALSE---------------------------------------
## ggplot(dat) +
##     aes(x = fac) +
##     aes(y = y) +
##     geom_boxplot(width = 1/3) +
##     scale_x_discrete("Some categorical variable") +
##     scale_y_continuous("Some continuous outcome") +
##     annotate("text",
##              x = 1.4,
##              y = median(dat$y),
##              label = "Median") +
##     annotate("text",
##              x = 1.4,
##              y = quantile(dat$y, 0.75),
##              label = "75th percentile") +
##     annotate("text",
##              x = 1.4,
##              y = quantile(dat$y, 0.25),
##              label = "25th percentile") +
##     annotate("text",
##              x = 1.4,
##              y = median(dat$y) + 1.5 * IQR(dat$y),
##              label = "Median + 1.5 times\ninterquartile range") +
##     annotate("text",
##              x = 1.4,
##              y = median(dat$y) - 1.5 * IQR(dat$y),
##              label = "Median - 1.5 times\ninterquartile range") +
##     annotate("text",
##              x = 1.4,
##              y = max(dat$y),
##              label = "Outlier")


## ----besin--------------------------------------------------------------------
library(tidyverse)
library(rio)
bes <- rio::import("https://www.britishelectionstudy.com/wp-content/uploads/2020/02/BES-2019-General-Election-results-file-v1.0.xlsx")

bes <- bes %>%
    mutate(ConChg = Con19 - Con17) %>%
    select(ConstituencyName, Region, ConChg)
           


## ----conchgplot, echo = FALSE, eval = FALSE-----------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_boxplot() +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()


## ----fctreorder---------------------------------------------------------------
bes <- bes %>%
    mutate(Region = fct_reorder(Region,
                                ConChg,
                                .fun = median,
                                na.rm = TRUE))


## ----conchgplot2, echo = FALSE, eval = FALSE----------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_boxplot() +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()


## ----loadvizlibs--------------------------------------------------------------
library(ggridges)
library(ggbeeswarm)


## ----violin, echo = FALSE, eval = FALSE---------------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_violin() +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()


## ----ridge, echo = FALSE, eval = FALSE----------------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_density_ridges() +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()


## ----swarm, echo = FALSE, eval = FALSE----------------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_beeswarm(alpha = 0.5) +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()


## ----swarmplus, echo = FALSE, eval = FALSE------------------------------------
## ggplot(bes) +
##     aes(x = Region) +
##     aes(y = ConChg) +
##     xlab("Region") +
##     ylab("Change in Conservative vote\n2017 to 2019") +
##     geom_boxplot(colour = "red") +
##     geom_beeswarm(alpha = 0.5) +
##     labs(title = "Change in the Conservative vote\nby region") +
##     coord_flip() +
##     theme_bw()

