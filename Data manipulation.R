#library(tidyverse)
# #library(lubridate)
# 
# ff <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv")
# ##ff <-  who_covid %>% mutate_geocode(Country,source='dsk')
# data <- as_tibble(ff)
# ff <- ff %>% rename(date = ï..Date_reported) %>% mutate(date=ymd(date))
# whodata <- as_tibble(ff)
# save(whodata,file = "whodata.Rdata")
# 
# #abc <- full_join(who_updated,ff) %>% fill(lon) %>% fill(lat)


####################  JHU
library(stringr)
library(tidyverse)
library(coronavirus)
data <- refresh_coronavirus_jhu()
#load("datajhu.Rdata")

loch <- str_which(data$location,"China")
data$location[loch] <- "China"

loca <- str_which(data$location,"Canada")
data$location[loca] <- "Canada"

loau <- str_which(data$location,"Australia")
data$location[loau] <- "Australia"

louk <- str_which(data$location,"United Kingdom")
data$location[louk] <- "United Kingdom"

lone <- str_which(data$location,"Netherlands")
data$location[lone] <- "Netherlands"

data$lat[loch] <- 35
data$long[loch] <- 105
data$lat[loca] <- 60.1
data$long[loca] <- -114
data$lat[louk] <- 55
data$long[louk] <- -2.7
data$lat[loau] <- -25
data$long[loau] <- 135
data$lat[lone] <- 52.5
data$long[lone] <- 5.75


data <-data%>%
  select(-location_type,-location_code,-location_code_type)
#save(data,file="datafinal.Rdata")



