## ----knitropts, echo = FALSE, message = FALSE---------------------------------

knitr::opts_chunk$set(dpi=300,fig.width=4.5, fig.height = 4, warning = TRUE, message = TRUE, out.width = "100%")



## ----loadlibs-----------------------------------------------------------------
library(tidyverse)


## ----loadlibs2, echo = FALSE--------------------------------------------------
library(flipbookr)


## ----datin--------------------------------------------------------------------
dat <- read.csv("2019_party_gender_count.csv")
head(dat, 10)


## ----figcode, echo = FALSE, eval = FALSE, fig = FALSE-------------------------
## ggplot(dat) +
##     aes(x = Party) +
##     aes(y = value) +
##     aes(fill = CandidateGender) +
##     scale_x_discrete("Candidate's party") +
##     scale_y_continuous("Number of candidates") +
##     geom_col() +
##     scale_fill_discrete("Gender") +
##     labs(title = "Male candidates were more common\nthan female candidates in GE2019") +
##     labs(caption = "Source: BES results file") +
##     theme_bw() +
##     theme(legend.position = "bottom")


## ----figcode2, echo = FALSE, eval = FALSE, fig = FALSE------------------------
## ggplot(dat) +
##     aes(x = Party) +
##     aes(y = value) +
##     aes(fill = CandidateGender) +
##     scale_x_discrete("Candidate's party") +
##     scale_y_continuous("Number of candidates") +
##     geom_col(position = "dodge") +
##     scale_fill_manual("Gender", values = c("darkgrey", "darkred", "grey27", "peachpuff3")) +
##     labs(title = "Male candidates were more common\nthan female candidates in GE2019") +
##     labs(caption = "Source: BES results file") +
##     theme_bw() +
##     theme(legend.position = "bottom")


## ----besin--------------------------------------------------------------------
library(rio)
bes <- rio::import("https://www.britishelectionstudy.com/wp-content/uploads/2020/02/BES-2019-General-Election-results-file-v1.0.xlsx")


## ----eval = FALSE-------------------------------------------------------------
## install.packages("rio")


## ----ncoleg, echo = TRUE, eval = FALSE----------------------------------------
## ncol(bes)


## ----nameseg, echo = TRUE, eval = FALSE---------------------------------------
## names(bes)


## ----selecteg-----------------------------------------------------------------
bes <- bes %>%
    select(ConstituencyName,
           ConPPCsex19,
           LabPPCsex19,
           LDPPCsex19)


## ----pivotcode----------------------------------------------------------------
bes <- bes %>%
    pivot_longer(cols = c(ConPPCsex19,
                          LabPPCsex19,
                          LDPPCsex19),
                 names_to = "Party",
                 values_to = "CandidateGender")

head(bes)


## ----summarizecode------------------------------------------------------------
dat <- bes %>%
    group_by(Party, CandidateGender) %>%
    summarize(value = n())

head(dat, 10)


## ----mutatecode---------------------------------------------------------------
dat <- dat %>%
    filter(!is.na(CandidateGender)) %>%
    mutate(Party = sub("PPCsex19", "", Party))

head(dat)

