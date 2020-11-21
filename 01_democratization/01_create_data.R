### Purpose of this code:
### Generate data showing current (2019) levels of democracy from V-Dem
### together with GDP per capita in 1992 and 2019
### and some region information

### Load libraries


library(tidyverse)
library(pwt9)
library(vdemdata)

### If you do not have these packages installed, you will see an error
### If you want to install these packages, you will need to run the
### code between the brackets. Comment out any packages not already
### installed.
if (FALSE) {
    install.packages("tidyverse")
    install.packages("pwt9")
    if (!require("devtools")) {
        install.packages("devtools")
    }
    library(devtools)
    devtools::install_github("vdeminstitute/vdemdata")

}

### Get the GDP data
data("pwt9.1")

### 
gdp_data <- pwt9.1 %>%
    select(country, isocode, year,
           rgdpe, pop) %>%
    mutate(gdp_per_cap = rgdpe / pop) %>%
    filter(year %in% c(1992, 2017)) %>%
    dplyr::select(country, isocode, year, gdp_per_cap, ) %>%
    pivot_wider(id_cols = c(country, isocode),
                values_from = gdp_per_cap,
                names_from = year,
                names_prefix = "gdp_pc_")

### Get the V-Dem data
data("vdem")
### Get out the variables we're interested in
vdem <- vdem %>%
    select(country_name, country_text_id, year,
           e_regiongeo, v2x_libdem,
           pop = e_mipopula)

### Tidy region labels
var_info("e_regiongeo")
region_labels <- c("Europe", "Europe", "Europe", "Europe",
                   "Africa", "Africa", "Africa", "Africa", "Africa",
                   "Asia", "Asia", "Asia", "Asia", "Asia",
                   "Oceania",
                   "Americas", "Americas", "Americas")
vdem <- vdem %>%
    mutate(e_regiongeo = region_labels[e_regiongeo])

### Get the most recent non-missing values for each country
vdem <- vdem %>%
    filter(!is.na(v2x_libdem)) %>%
    group_by(country_name, country_text_id) %>%
    arrange(desc(year)) %>%
    fill(pop, .direction = "up") %>% 
    filter(row_number() == 1)

dat <- merge(gdp_data,
             vdem,
             by.x = "isocode",
             by.y = "country_text_id",
             suffixes = c(".pwt", ".vdem"),
             all = TRUE)

write.csv(dat, file = "gdp_dem_data.csv", row.names = FALSE)
