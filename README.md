# 🕹Project
Hotel Bookings with R

## 👨🏼‍💻Scenario

As a junior data analyst for a hotel booking company, i have been creating visualizations in `R` with the `ggplot2`  package to share insights about my data with stakeholders. After creating a series of visualizations using `ggplot()`, `ggplot2` aesthetics, and filters, my stakeholder asks me to add annotations to my visualizations to help explain mine findings in a presentation. Luckily, `ggplot2` has annotation functions built in.

## Step 1: Import the data

In this step i import data into R Studio with the code below to read in the file 'hotel_bookings.csv' into a data frame: 

```{r load data}
hotel_bookings <- read.csv("C:/Users/OWNER/Desktop/R/bookings_df/hotel_bookings.csv")
```

## Step 2: Look the data

By now, i pretty familiar with this data set. But i can refresh my memory with the `head()` and `colnames()` functions. With two code below to get at a sample of the data and also preview all the column names:

```{r look at data}
head(hotel_bookings)
```

```{r look at column names}
colnames(hotel_bookings)
```

## Step 3: Install and load the 'ggplot2' and 'tidyverse' packages (optional)

This step may take a few minutes, before i visualize my data i load and install the packages with `ggplot()` function and `tidyverse`. To install and load `ggplot2` i need run this code:

```{r loading and installing ggplot2, echo=FALSE, message=FALSE}
install.packages("ggplot")
library(ggplot2)
```

and also to install and load `tidyverse` i need to run this code:

```{r install and download tidyverse}
install.packages("tidyverse")
library(tidyverse)
```

## Step 4: Annotating chart

Stakeholder tells me that they would like me to share they visualization breaking down payment type by city because it will help inform how the company targets promotions in the future. They ask me to create a cleaned and labeled version and save it as a .png file for them to include in a presentation. 

Firstly, i make the code like this: 

```{r faceting a plot with a title}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="")
```

The stakeholder also want to add another detail about what time period this data covers. To do this, i need to find out when the data is from. i realize i can use the `min()` function on the year column in the data:

```{r earliest year}
min(hotel_bookings$arrival_date_year)
```
 
And the `max()` function:

```{r latest year}
max(hotel_bookings$arrival_date_year)
```

But, beside of that i will need to save them as variables in order to easily use them in my labeling; the following code creates two of those variables:

```{r latest date}
mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)
```

Now, i will add in a subtitle using `subtitle=` in the `labs()` function. Then, i can use the `paste0()` function to use my newly-created variables in my labels. This is really handy, because if the data gets updated and there is more recent data added, i don't have to change the code below because the variables are dynamic:

```{r city bar chart with timeframe}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))
```

This code will add the subtitle 'Data from: 2015 to 2017' underneath the title i added earlier to the chart. 

I realize that this chart is displaying the technical details a little too prominently. I don't want that to be the second thing people notice during the presentation. I decide to switch the `subtitle`  to a `caption` which will appear in the bottom right corner instead.

```{r city bar chart with timeframe as caption}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))
```

This code chunk makes a slight change to the visualization i created in the last code; now the "data from: 2015 to 2017" subtitle is in the bottom right corner. 

Now i want to clean up the x and y axis labels to make sure they are really clear. To do that, i can add to the `labs()` function and use `x=` and `y=`. Feel free to change the text of the label and play around with it:

```{r city bar chart with x and y axis}
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")
```

Now i have the data visualization from earlier, but now the x and y axis labels have been changed from 'market_segment' and 'count' to 'Market Segment' and 'Number of Bookings' so that the chart is clearer.

## Step 5: Saving chart

Now, it's time to save what i just created so i can easily share with stakeholders. To save it i use `ggsave()` function, it will save the image as a 7x7 at the file path, and also to save that plot as a .png file named `hotel_booking_chart`, which makes it clear to stakeholders what the .png file contains. So this that code:

```{r save your plot}
ggsave('hotel_booking_chart.png')
```

# ✨Result
The last, this was a data visualization


<img alt="chart" width="600" src="https://github.com/Syamabbas/hotel-bookings/blob/main/hotel_booking_chart.png">


[Download R code](https://github.com/Syamabbas/hotel-bookings/blob/main/Hotel-bookings.R)<br>
[Download R markdown](https://github.com/Syamabbas/hotel-bookings/blob/main/hotel-bookings.pdf)
