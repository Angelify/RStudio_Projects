```r
title: "This code demonstrates how to load data, preprocess it, and create a data visualization in R Markdown"
author: "! Adaeze Anyaegbunam !"
date: "15/07/2024"
output:
  html_document:
  number_sections: yes
pdf_document: default
word_document: default
```
# This section sets the metadata for the R Markdown document. It includes the title, author, date, and the desired output formats (HTML, PDF, and Word document).

```r
# This chunk can be used to set some defaults for the whole document
knitr::opts_chunk$set(echo = TRUE)
```

# This line sets the default options for the entire R Markdown document. The `knitr::opts_chunk$set()` function is used to configure the behavior of the code chunks. In this case, the `echo = TRUE` option ensures that the code will be displayed in the output document.

```r
# Loading the packages:
library(tidyverse)
library(gapminder)
```

# This block loads the necessary packages for the analysis. The `tidyverse` package provides a collection of modern data science tools, including the `ggplot2` library for data visualization. The `gapminder` package contains the `gapminder` dataset, which will be used for the analysis.

```r
# We are using the gapminder dataset:
mydata <- gapminder %>%
  # round gdpPercap to 0 decimals:
  mutate(gdpPercap = round(gdpPercap)) %>%
  # divide pop by million, round to 1 decimal:
  mutate(pop_millions = (pop/1e6) %>%
           round(1))
```

# This code block creates a new dataset called `mydata` by modifying the original `gapminder` dataset. The `mutate()` function is used to create two new columns:

#  1. `gdpPercap`: The GDP per capita is rounded to 0 decimal places.
#  2. `pop_millions`: The population is divided by 1 million and rounded to 1 decimal place.

# This preprocessing step is done to make the data more readable and easier to work with in the subsequent analysis.

```r
# A random sample of rows in the dataset:
mydata %>%
  select(-pop) %>%
  sample_n(10) %>%
  knitr::kable(col.names = c("Country",
                             "Continent",
                             "Year",
                             "Life Expectancy",
                             "GPD per Capita",
                             "Population (millions"))
```

# This code block displays a table of a random sample of 10 rows from the `mydata` dataset. The `select(-pop)` line removes the `pop` column, as it is not needed for this table. The `sample_n(10)` line selects 10 random rows from the dataset. The `knitr::kable()` function is used to format the selected rows as a nicely formatted table in the output document.

```r
# Number of variables: `r mydata %>% ncol()`.
# Total number of observations: `r mydata %>% nrow()`.
```

# These two lines display the number of variables (columns) and the total number of observations (rows) in the `mydata` dataset. The `ncol()` and `nrow()` functions are used to get these values, and they are displayed in the output document using the inline R code syntax (`r`).

```r
# Plotting
mydata %>%
  filter(year == 2007) %>%
  ggplot(aes(x = gdpPercap/1000, #divide by 1000 to tidy the x-axis
             y = lifeExp,
             colour = continent,
             size = pop_millions)) +
  geom_point(shape = 1) +
  labs(y = "Life Expectancy", x = "GDP per Capita/1000",
       colour = "Contintent", size = "Population in Millions") +
  theme_bw()
```

#This code block creates a scatterplot using the `ggplot2` library. It takes the `mydata` dataset, filters it to only include data from the year 2007, and then creates a scatterplot with the following aesthetics:

#  - `x`: GDP per capita divided by 1,000 to make the x-axis more readable
#  - `y`: Life expectancy
#  - `colour`: Continent
#  - `size`: Population in millions

# The `geom_point()` function is used to add the scatterplot points, with `shape = 1` to use hollow circles. The `labs()` function is used to add labels to the x-axis, y-axis, color legend, and size legend. Finally, the `theme_bw()` function is used to apply a simple black-and-white theme to the plot.

# Overall, this code demonstrates how to load data, preprocess it, and create a data visualization in R Markdown. The comments throughout the code provide a step-by-step explanation of what each part of the code is doing.
