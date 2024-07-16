library(gapminder)
library(tidyverse)

# Filter gapminder data for the year 2007 and arrange by descending life expectancy
gap_2007 = gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(lifeExp))

# Filter gapminder data for the years 1952 and 2007 for Japan
gap_subset = gapminder %>%
  filter(year %in% c(1952, 2007), country == "Japan")

# Filter gapminder data for the year 1977 and arrange by descending life expectancy
gap_1977 = gapminder %>%
  filter(year == 1977) %>%
  arrange(desc(lifeExp))

# Get a list of distinct years from the gapminder data
gap_years = gapminder %>%
  select(year) %>%
  distinct(year)

# Create a plot of life expectancy over time for Afghanistan
gapminder_plot <- gapminder %>%
  filter(country == 'Afghanistan') %>%
  ggplot(aes(x = year, y = lifeExp)) +
  geom_point()

