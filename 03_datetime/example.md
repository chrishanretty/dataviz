---
title: "Bar charts"
author: "Chris Hanretty"
date: "November 2020"
output:
  xaringan::moon_reader:
    css: ["default", "rhul.css", "rhul-fonts.css","https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"]
    nature:
          highlightLines: true
---




# About bar-charts

 - Less common than you might think in the social sciences, but still useful
 - Show how frequent a particular (categorical) outcome is according
   to another (categorical) variable
 - In this case, the categorical outcome is "being a female
   parliamentary candidate", and the categorical variable is
   "political party".
 
---

# About this session

 - This session will show you how to construct a bar-chart using `ggplot`
 - It assumes some prior knowledge of how R works
 - It is not a complete guide to ggplot
 - Useful resources include:
    * Chapter 3 of ["R for Data Science"](https://r4ds.had.co.nz/data-visualisation.html)
	* The [ggplot2 manual](https://ggplot2.tidyverse.org/)
	* Kieran Healy's [Data Visualization](https://socviz.co/)

---

# Load the libraries


```r
library(tidyverse)
library(rio)
```

The `rio` package is helpful for getting files into R. If you get an
error message when loading rio, try the code below:


```r
install.packages("rio")
```

If you still get an error, you might need to get someone with admin
privileges to install `rio` for you.



---

# Get the data in

The data we're using comes from the British Election Study results
file. You can read it directly into R without first downloading it.

(Of course, you might want to download it in case you're working
without a decent internet connection).


```r
results_file <- rio::import("https://www.britishelectionstudy.com/wp-content/uploads/2020/02/BES-2019-General-Election-results-file-v1.0.xlsx")
```

If you want to download it, go to [https://www.britishelectionstudy.com/data-objects/linked-data/](https://www.britishelectionstudy.com/data-objects/linked-data/)

---

# Subsetting the data

There are a *lot* of variables in the file, so we'll only look at a subset.

There are two ways of doing this: a base R way, and a `tidyverse` way. 

Use what you're most comfortable with.


```r
### Tidyverse way
dat <- results_file %>%
    select(ConstituencyName,
           ConPPCsex19,
           LabPPCsex19,
           LDPPCsex19)
```


```r
### Base R way
dat <- results_file[,c("ConstituencyName",
                       "ConPPCsex19",
                       "LabPPCsex19",
                       "LDPPCsex19")]
```

---

# Looking at the data


```r
head(dat, 5)
```

```
##                    ConstituencyName ConPPCsex19 LabPPCsex19 LDPPCsex19
## 1                          Aberavon      Female        Male     Female
## 2                         Aberconwy        Male      Female       Male
## 3                    Aberdeen North        Male        Male     Female
## 4                    Aberdeen South        Male      Female       Male
## 5 West Aberdeenshire and Kincardine        Male        Male       Male
```

---

# Reshape the data

The data has one row for each constituency, and columns which tell us
the gender of each party's candidate.

That's not the structure we want. We want a row for each
constituency/party combination, and a variable which gives us the
gender of the candidate.

To reshape the data, we use `pivot_longer`.


```r
dat <- dat %>%
    pivot_longer(cols = c(ConPPCsex19, LabPPCsex19, LDPPCsex19),
                 names_to = "Party",
                 value_to = "CandidateGender")
```

```
## Error: 1 components of `...` were not used.
## 
## We detected these problematic arguments:
## * `value_to`
## 
## Did you misspecify an argument?
```



---

count: false
 

.panel1-figcode-auto[

```r
ggplot(dat)   #<<
```
]
 
.panel2-figcode-auto[
<img src="figure/figcode_auto_01_output-1.png" title="plot of chunk figcode_auto_01_output" alt="plot of chunk figcode_auto_01_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992)   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'gdp_pc_1992' not found
```

<img src="figure/figcode_auto_02_output-1.png" title="plot of chunk figcode_auto_02_output" alt="plot of chunk figcode_auto_02_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem)   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_03_output-1.png" title="plot of chunk figcode_auto_03_output" alt="plot of chunk figcode_auto_03_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point()   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_04_output-1.png" title="plot of chunk figcode_auto_04_output" alt="plot of chunk figcode_auto_04_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$")   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_05_output-1.png" title="plot of chunk figcode_auto_05_output" alt="plot of chunk figcode_auto_05_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy")   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_06_output-1.png" title="plot of chunk figcode_auto_06_output" alt="plot of chunk figcode_auto_06_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,  #<<
                             4000, 10000,  #<<
                             40000))   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_07_output-1.png" title="plot of chunk figcode_auto_07_output" alt="plot of chunk figcode_auto_07_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now")   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_08_output-1.png" title="plot of chunk figcode_auto_08_output" alt="plot of chunk figcode_auto_08_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables")   #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_09_output-1.png" title="plot of chunk figcode_auto_09_output" alt="plot of chunk figcode_auto_09_output" width="100%" />
]

---
count: false
 

.panel1-figcode-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    theme_bw()  #<<
```
]
 
.panel2-figcode-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/figcode_auto_10_output-1.png" title="plot of chunk figcode_auto_10_output" alt="plot of chunk figcode_auto_10_output" width="100%" />
]

<style>
.panel1-figcode-auto {
  color: black;
  width: 38.6060606060606%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-figcode-auto {
  color: black;
  width: 59.3939393939394%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-figcode-auto {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# All the code


```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") + 
    theme_bw()
```

---

# How I'd usually write it


```r
ggplot(dat, aes(x = gdp_pc_1992, y = v2x_libdem)) +
    geom_point() +
    scale_x_log10("GDP per capita in 1992, US$",
                  breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    scale_y_continuous("V-Dem measure of liberal democracy")
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now", 
         caption = "Source: V-Dem, Penn World Tables") + 
    theme_bw()
```

---

# Further options

1. Adding a trend line
2. Mapping an additional aesthetic
3. Small multiples

---

# Adding a trend line


```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK
    geom_smooth(method = "lm") + 
    theme_bw()
```

---

count: false
 

.panel1-trendline-auto[

```r
ggplot(dat)   #<<
```
]
 
.panel2-trendline-auto[
<img src="figure/trendline_auto_01_output-1.png" title="plot of chunk trendline_auto_01_output" alt="plot of chunk trendline_auto_01_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992)   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'gdp_pc_1992' not found
```

<img src="figure/trendline_auto_02_output-1.png" title="plot of chunk trendline_auto_02_output" alt="plot of chunk trendline_auto_02_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem)   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_03_output-1.png" title="plot of chunk trendline_auto_03_output" alt="plot of chunk trendline_auto_03_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point()   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_04_output-1.png" title="plot of chunk trendline_auto_04_output" alt="plot of chunk trendline_auto_04_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$")   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_05_output-1.png" title="plot of chunk trendline_auto_05_output" alt="plot of chunk trendline_auto_05_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy")   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_06_output-1.png" title="plot of chunk trendline_auto_06_output" alt="plot of chunk trendline_auto_06_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,  #<<
                             4000, 10000,  #<<
                             40000))   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_07_output-1.png" title="plot of chunk trendline_auto_07_output" alt="plot of chunk trendline_auto_07_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now")   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_08_output-1.png" title="plot of chunk trendline_auto_08_output" alt="plot of chunk trendline_auto_08_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables")   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_09_output-1.png" title="plot of chunk trendline_auto_09_output" alt="plot of chunk trendline_auto_09_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    geom_smooth(method = "lm")   #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_10_output-1.png" title="plot of chunk trendline_auto_10_output" alt="plot of chunk trendline_auto_10_output" width="100%" />
]

---
count: false
 

.panel1-trendline-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    geom_smooth(method = "lm") +
    theme_bw()  #<<
```
]
 
.panel2-trendline-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/trendline_auto_11_output-1.png" title="plot of chunk trendline_auto_11_output" alt="plot of chunk trendline_auto_11_output" width="100%" />
]

<style>
.panel1-trendline-auto {
  color: black;
  width: 38.6060606060606%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-trendline-auto {
  color: black;
  width: 59.3939393939394%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-trendline-auto {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>




---

# Mapping an additional aesthetic (colour)



```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) + #BREAK
    aes(colour = e_regiongeo) + #BREAK2
    geom_point() + #BREAK3
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK4
    scale_colour_discrete("Region") + 
    theme_bw() + #BREAK5
    theme(legend.position = "bottom") 
```

---

count: false
 

.panel1-addaes-auto[

```r
ggplot(dat)   #<<
```
]
 
.panel2-addaes-auto[
<img src="figure/addaes_auto_01_output-1.png" title="plot of chunk addaes_auto_01_output" alt="plot of chunk addaes_auto_01_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992)   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'gdp_pc_1992' not found
```

<img src="figure/addaes_auto_02_output-1.png" title="plot of chunk addaes_auto_02_output" alt="plot of chunk addaes_auto_02_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem)   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes_auto_03_output-1.png" title="plot of chunk addaes_auto_03_output" alt="plot of chunk addaes_auto_03_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo)   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_04_output-1.png" title="plot of chunk addaes_auto_04_output" alt="plot of chunk addaes_auto_04_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point()   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_05_output-1.png" title="plot of chunk addaes_auto_05_output" alt="plot of chunk addaes_auto_05_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$")   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_06_output-1.png" title="plot of chunk addaes_auto_06_output" alt="plot of chunk addaes_auto_06_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy")   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_07_output-1.png" title="plot of chunk addaes_auto_07_output" alt="plot of chunk addaes_auto_07_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,  #<<
                             4000, 10000,  #<<
                             40000))   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_08_output-1.png" title="plot of chunk addaes_auto_08_output" alt="plot of chunk addaes_auto_08_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now")   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_09_output-1.png" title="plot of chunk addaes_auto_09_output" alt="plot of chunk addaes_auto_09_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables")   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'e_regiongeo' not found
```

<img src="figure/addaes_auto_10_output-1.png" title="plot of chunk addaes_auto_10_output" alt="plot of chunk addaes_auto_10_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region")   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes_auto_11_output-1.png" title="plot of chunk addaes_auto_11_output" alt="plot of chunk addaes_auto_11_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    theme_bw()   #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes_auto_12_output-1.png" title="plot of chunk addaes_auto_12_output" alt="plot of chunk addaes_auto_12_output" width="100%" />
]

---
count: false
 

.panel1-addaes-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(colour = e_regiongeo) +
    geom_point() +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    theme_bw() +
    theme(legend.position = "bottom")  #<<
```
]
 
.panel2-addaes-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes_auto_13_output-1.png" title="plot of chunk addaes_auto_13_output" alt="plot of chunk addaes_auto_13_output" width="100%" />
]

<style>
.panel1-addaes-auto {
  color: black;
  width: 38.6060606060606%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-addaes-auto {
  color: black;
  width: 59.3939393939394%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-addaes-auto {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# Mapping an additional aesthetic (size)




---

count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat)   #<<
```
]
 
.panel2-addaes2-auto[
<img src="figure/addaes2_auto_01_output-1.png" title="plot of chunk addaes2_auto_01_output" alt="plot of chunk addaes2_auto_01_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992)   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'gdp_pc_1992' not found
```

<img src="figure/addaes2_auto_02_output-1.png" title="plot of chunk addaes2_auto_02_output" alt="plot of chunk addaes2_auto_02_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem)   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes2_auto_03_output-1.png" title="plot of chunk addaes2_auto_03_output" alt="plot of chunk addaes2_auto_03_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop)   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_04_output-1.png" title="plot of chunk addaes2_auto_04_output" alt="plot of chunk addaes2_auto_04_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5)   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_05_output-1.png" title="plot of chunk addaes2_auto_05_output" alt="plot of chunk addaes2_auto_05_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$")   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_06_output-1.png" title="plot of chunk addaes2_auto_06_output" alt="plot of chunk addaes2_auto_06_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy")   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_07_output-1.png" title="plot of chunk addaes2_auto_07_output" alt="plot of chunk addaes2_auto_07_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,  #<<
                             4000, 10000,  #<<
                             40000))   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_08_output-1.png" title="plot of chunk addaes2_auto_08_output" alt="plot of chunk addaes2_auto_08_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now")   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_09_output-1.png" title="plot of chunk addaes2_auto_09_output" alt="plot of chunk addaes2_auto_09_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables")   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_10_output-1.png" title="plot of chunk addaes2_auto_10_output" alt="plot of chunk addaes2_auto_10_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region")   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/addaes2_auto_11_output-1.png" title="plot of chunk addaes2_auto_11_output" alt="plot of chunk addaes2_auto_11_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE)   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes2_auto_12_output-1.png" title="plot of chunk addaes2_auto_12_output" alt="plot of chunk addaes2_auto_12_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    theme_bw()   #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes2_auto_13_output-1.png" title="plot of chunk addaes2_auto_13_output" alt="plot of chunk addaes2_auto_13_output" width="100%" />
]

---
count: false
 

.panel1-addaes2-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400, 1000,
                             4000, 10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    theme_bw() +
    theme(legend.position = "bottom")  #<<
```
]
 
.panel2-addaes2-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/addaes2_auto_14_output-1.png" title="plot of chunk addaes2_auto_14_output" alt="plot of chunk addaes2_auto_14_output" width="100%" />
]

<style>
.panel1-addaes2-auto {
  color: black;
  width: 38.6060606060606%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-addaes2-auto {
  color: black;
  width: 59.3939393939394%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-addaes2-auto {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# Small multiples



```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) + #BREAK
    aes(size = pop) + #BREAK2
    geom_point(alpha = 0.5) + #BREAK3
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") + #BREAK4
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    facet_wrap(~e_regiongeo) +
    geom_smooth(method = "lm", se = FALSE) + 
    theme_bw() + #BREAK5
    theme(legend.position = "bottom") 
```

---

count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat)   #<<
```
]
 
.panel2-smallmults-auto[
<img src="figure/smallmults_auto_01_output-1.png" title="plot of chunk smallmults_auto_01_output" alt="plot of chunk smallmults_auto_01_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'gdp_pc_1992' not found
```

<img src="figure/smallmults_auto_02_output-1.png" title="plot of chunk smallmults_auto_02_output" alt="plot of chunk smallmults_auto_02_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/smallmults_auto_03_output-1.png" title="plot of chunk smallmults_auto_03_output" alt="plot of chunk smallmults_auto_03_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_04_output-1.png" title="plot of chunk smallmults_auto_04_output" alt="plot of chunk smallmults_auto_04_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_05_output-1.png" title="plot of chunk smallmults_auto_05_output" alt="plot of chunk smallmults_auto_05_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$")   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_06_output-1.png" title="plot of chunk smallmults_auto_06_output" alt="plot of chunk smallmults_auto_06_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy")   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_07_output-1.png" title="plot of chunk smallmults_auto_07_output" alt="plot of chunk smallmults_auto_07_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,  #<<
                             10000,  #<<
                             40000))   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_08_output-1.png" title="plot of chunk smallmults_auto_08_output" alt="plot of chunk smallmults_auto_08_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now")   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_09_output-1.png" title="plot of chunk smallmults_auto_09_output" alt="plot of chunk smallmults_auto_09_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables")   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_10_output-1.png" title="plot of chunk smallmults_auto_10_output" alt="plot of chunk smallmults_auto_10_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region")   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'pop' not found
```

<img src="figure/smallmults_auto_11_output-1.png" title="plot of chunk smallmults_auto_11_output" alt="plot of chunk smallmults_auto_11_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error in FUN(X[[i]], ...): object 'v2x_libdem' not found
```

<img src="figure/smallmults_auto_12_output-1.png" title="plot of chunk smallmults_auto_12_output" alt="plot of chunk smallmults_auto_12_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    facet_wrap(~e_regiongeo)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error: At least one layer must contain all faceting variables: `e_regiongeo`.
## * Plot is missing `e_regiongeo`
## * Layer 1 is missing `e_regiongeo`
```

<img src="figure/smallmults_auto_13_output-1.png" title="plot of chunk smallmults_auto_13_output" alt="plot of chunk smallmults_auto_13_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    facet_wrap(~e_regiongeo) +
    geom_smooth(method = "lm", se = FALSE)   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error: At least one layer must contain all faceting variables: `e_regiongeo`.
## * Plot is missing `e_regiongeo`
## * Layer 1 is missing `e_regiongeo`
## * Layer 2 is missing `e_regiongeo`
```

<img src="figure/smallmults_auto_14_output-1.png" title="plot of chunk smallmults_auto_14_output" alt="plot of chunk smallmults_auto_14_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    facet_wrap(~e_regiongeo) +
    geom_smooth(method = "lm", se = FALSE) +
    theme_bw()   #<<
```
]
 
.panel2-smallmults-auto[

```
## Error: At least one layer must contain all faceting variables: `e_regiongeo`.
## * Plot is missing `e_regiongeo`
## * Layer 1 is missing `e_regiongeo`
## * Layer 2 is missing `e_regiongeo`
```

<img src="figure/smallmults_auto_15_output-1.png" title="plot of chunk smallmults_auto_15_output" alt="plot of chunk smallmults_auto_15_output" width="100%" />
]

---
count: false
 

.panel1-smallmults-auto[

```r
ggplot(dat) +
    aes(x = gdp_pc_1992) +
    aes(y = v2x_libdem) +
    aes(size = pop) +
    geom_point(alpha = 0.5) +
    xlab("GDP per capita in 1992, US$") +
    ylab("V-Dem measure of liberal democracy") +
    scale_x_log10(breaks = c(400,
                             10000,
                             40000)) +
    labs(title = "Countries richer in 1992 have\nhigher levels of democracy now") +
    labs(caption = "Source: V-Dem, Penn World Tables") +
    scale_colour_discrete("Region") +
    scale_size_continuous(guide = FALSE) +
    facet_wrap(~e_regiongeo) +
    geom_smooth(method = "lm", se = FALSE) +
    theme_bw() +
    theme(legend.position = "bottom")  #<<
```
]
 
.panel2-smallmults-auto[

```
## Error: At least one layer must contain all faceting variables: `e_regiongeo`.
## * Plot is missing `e_regiongeo`
## * Layer 1 is missing `e_regiongeo`
## * Layer 2 is missing `e_regiongeo`
```

<img src="figure/smallmults_auto_16_output-1.png" title="plot of chunk smallmults_auto_16_output" alt="plot of chunk smallmults_auto_16_output" width="100%" />
]

<style>
.panel1-smallmults-auto {
  color: black;
  width: 38.6060606060606%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-smallmults-auto {
  color: black;
  width: 59.3939393939394%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-smallmults-auto {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# Next steps

 - If you have data which could be presented using a scatter-plot, experiment
 - Pay attention to labelling and captions
 - Think about mapping additional aesthetics. Is it worth it? Does it become too busy?
 
