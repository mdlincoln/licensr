
<!-- README.md is generated from README.Rmd. Please edit that file -->

# licensr

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

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
#> # A tibble: 14 x 2
#>    package    license                               
#>    <chr>      <chr>                                 
#>  1 utf8       Apache License (== 2.0) | file LICENSE
#>  2 digest     GPL (>= 2)                            
#>  3 withr      GPL (>= 2)                            
#>  4 packrat    GPL-2                                 
#>  5 assertthat GPL-3                                 
#>  6 pillar     GPL-3                                 
#>  7 rlang      GPL-3                                 
#>  8 R6         MIT + file LICENSE                    
#>  9 cli        MIT + file LICENSE                    
#> 10 crayon     MIT + file LICENSE                    
#> 11 magrittr   MIT + file LICENSE                    
#> 12 praise     MIT + file LICENSE                    
#> 13 testthat   MIT + file LICENSE                    
#> 14 tibble     MIT + file LICENSE
```
