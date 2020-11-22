### Purpose of this code: Generate data showing counts of candidate by
### party and gender in the 2019 election.

### Load libraries


library(tidyverse)
library(rio)

dat <- rio::import("https://www.britishelectionstudy.com/wp-content/uploads/2020/02/BES-2019-General-Election-results-file-v1.0.xlsx") %>%
    select(ConstituencyName,
           ConPPCsex19,
           LabPPCsex19,
           LDPPCsex19) %>%
    pivot_longer(cols = c(ConPPCsex19,
                          LabPPCsex19,
                          LDPPCsex19),
                 names_to = "Party",
                 values_to = "CandidateGender") %>%
    group_by(Party, CandidateGender) %>%
    summarize(value = n()) %>%
    mutate(Party = sub("PPCsex19", "", Party))

write.csv(dat,
          file = "2019_party_gender_count.csv",
          row.names = FALSE)

