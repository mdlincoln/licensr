
<!-- README.md is generated from README.Rmd. Please edit that file -->

# licensr

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis-CI Build
Status](https://travis-ci.org/mdlincoln/licensr.svg?branch=master)](https://travis-ci.org/mdlincoln/licensr)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mdlincoln/licensr?branch=master&svg=true)](https://ci.appveyor.com/project/mdlincoln/licensr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/mdlincoln/licensr/master.svg)](https://codecov.io/github/mdlincoln/licensr?branch=master)

The goal of licensr is to give you a list of all the licenses used by
packages to which your project links.

## Installation

You can install licensr from github with:

``` r
# install.packages("devtools")
devtools::install_github("mdlincoln/licensr")
```

## Example

``` r
library(licensr)
project_licenses()
#> # A tibble: 23 x 2
#>    package    license                               
#>    <chr>      <chr>                                 
#>  1 utf8       Apache License (== 2.0) | file LICENSE
#>  2 mime       GPL                                   
#>  3 digest     GPL (>= 2)                            
#>  4 fansi      GPL (>= 2)                            
#>  5 withr      GPL (>= 2)                            
#>  6 packrat    GPL-2                                 
#>  7 assertthat GPL-3                                 
#>  8 covr       GPL-3                                 
#>  9 lazyeval   GPL-3                                 
#> 10 pillar     GPL-3                                 
#> # ... with 13 more rows
```
