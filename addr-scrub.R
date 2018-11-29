library(rgdal)
library(tidyverse)

# read csv file
addrs <- read.csv("raw-ottawa-septic-addresses.csv")
# read ottawa county shapefile ( for unique values in st_name)
#roads <- readOGR("Z:/GIS Data/Ohio/Transportation/Roads-General/Ottawa County/ottawa_cntrlines_17.shp")

# read unique street names from roads
#road_names <- unique(roads$ST_NAME)

# clean up street names in separate column
addrs <- addrs %>% 
  mutate(name_match=Street)
# add new column for only the street name
# copying from existing column
addrs$name_match = addrs$Street
# fix state routes
addrs$name_match = gsub("STATE ROUTE","SR",addrs$name_match)
# trailing directions
addrs$name_match = gsub(" \\(.\\)","",addrs$name_match)
# benton carroll
addrs$name_match = gsub("BENTON CARROLL","BENTON-CARROLL",addrs$name_match)
# DARR HOPFINGER
addrs$name_match = gsub("DARR HOPFINGER","DARR-HOPFINGER",addrs$name_match)
# DUFF WASHA
addrs$name_match = gsub("DUFF WASHA","DUFF-WASHA",addrs$name_match)
# FIRST
addrs$name_match = gsub("FIRST","1ST",addrs$name_match)
# SECOND
addrs$name_match = gsub("SECOND","2ND",addrs$name_match)
# THIRD
addrs$name_match = gsub("THIRD","3RD",addrs$name_match)
# FOURTH
addrs$name_match = gsub("FOURTH","4TH",addrs$name_match)
# FIFTH
addrs$name_match = gsub("FIFTH","5TH",addrs$name_match)
# SIXTH
addrs$name_match = gsub("SIXTH","6TH",addrs$name_match)
# SEVENTH
addrs$name_match = gsub("SEVENTH","7TH",addrs$name_match)
# MARTIN WILLISTON
addrs$name_match = gsub("MARTIN WILLISTON","MARTIN-WILLISTON",addrs$name_match)
# CURTICE E & W
addrs$name_match = gsub("CURTICE E & W","CURTICE EAST & WEST",addrs$name_match)
# ROAD/STREET/AVENUE/DRIVE
addrs$name_match = gsub(" STREET","",addrs$name_match)
addrs$name_match = gsub(" ROAD","",addrs$name_match)
addrs$name_match = gsub(" AVENUE","",addrs$name_match)
addrs$name_match = gsub("NIESE PLACE","NIESE",addrs$name_match)
addrs$name_match = gsub(" DRIVE","",addrs$name_match)
# HESSVILLE PORTAGE
addrs$name_match = gsub("HESSVILLE PORTAGE","HESSVILLE",addrs$name_match)
# EIGHTH
addrs$name_match = gsub("EIGHTH","8TH",addrs$name_match)
# RD
addrs$name_match = gsub(" RD","",addrs$name_match)
# BLVD
addrs$name_match = gsub(" BLVD\\S*","",addrs$name_match)
# BOULEVARD
addrs$name_match = gsub(" BOULEVARD\\S*","",addrs$name_match)
#OAK HARBOR SE
addrs$name_match = gsub("OAK HARBOR SE","OAK HARBOR SOUTHEAST",addrs$name_match)
# TRAIL BUT NOT TRAILER PARK OR WHATEVER
addrs$name_match = gsub(" TRAIL$","",addrs$name_match)
