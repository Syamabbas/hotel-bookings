## Step 1: Import the data

hotel_bookings <- read.csv("C:/Users/OWNER/Desktop/R/bookings_df/hotel_bookings.csv")


## Step 2: Look the data

head(hotel_bookings)
colnames(hotel_bookings)

## Step 3: Install and load the 'ggplot2' and 'tidyverse' packages (optional)
install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
library(tidyverse)


## Step 4: Annotating chart

ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="")

# min max hotel bookings
min(hotel_bookings$arrival_date_year)
max(hotel_bookings$arrival_date_year)


mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)


# Final code
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")


# Save code
ggsave('hotel_booking_chart.png')
