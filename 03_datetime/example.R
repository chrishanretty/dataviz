## ----knitropts, echo = FALSE, message = FALSE---------------------------------

knitr::opts_chunk$set(dpi=300,fig.width=4.5, fig.height = 4, warning = TRUE, message = TRUE, out.width = "100%")



## ----loadlibs-----------------------------------------------------------------
library(tidyverse)


## ----loadlibs2, echo = FALSE--------------------------------------------------
library(flipbookr)


## ----datin--------------------------------------------------------------------
dat <- read.csv("indy_polling.csv")
head(dat, 10)


## ----cleancode----------------------------------------------------------------
dat <- dat %>%
    separate(col = Fieldwork,
             into = c("FwkStart", "FwkStop"),
             sep = "–")

head(dat)


## ----cleandates---------------------------------------------------------------
dat <- dat %>%
    mutate(FwkStart = as.Date(FwkStart,
                             format = "%d %b %Y"),
           FwkStop = as.Date(FwkStop,
                             format = "%d %b %Y")) %>%
    mutate(Date = if_else(is.na(FwkStop),
                         FwkStart,
                         FwkStop))

head(dat)


## ----asnumericcode------------------------------------------------------------
dat <- dat %>%
    mutate(Yes = gsub("%", "", Yes),
           Yes = as.numeric(Yes),
           No = gsub("%", "", No),
           No = as.numeric(No))


## ----plottingcode, echo = FALSE, eval = FALSE---------------------------------
## ggplot(dat) +
##     aes(x = Date) +
##     aes(y = Yes) +
##     scale_x_date() +
##     scale_y_continuous(limits = c(0, 60)) +
##     xlab("Date") +
##     ylab("Support for independence") +
##     geom_point() +
##     geom_smooth() +
##     geom_vline(xintercept = as.Date("2016-06-23",
##                                     format = "%Y-%m-%d"),
##                colour = "darkgrey") +
##     labs(title = "Support for independence since 2014") +
##     labs(subtitle = "Vertical line shows Brexit referendum;\nblue line shows trend") +
##     labs(caption = "Source: Wikipedia") +
##     theme_bw()

