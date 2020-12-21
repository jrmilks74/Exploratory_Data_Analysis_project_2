setwd("~/Desktop/Data_science/Exploratory Data Analysis Week 4 project")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
names(SCC)
PM2.5 <- merge(NEI, SCC, by = "SCC")
vehicles <- subset(PM2.5, PM2.5$type =="ON-ROAD" & fips == c("24510", "06037"))
vehicles.sum <- aggregate(Emissions~year + fips, vehicles, FUN = sum)
vehicles.sum$fips <- as.factor(vehicles.sum$fips)
levels(vehicles.sum$fips)[levels(vehicles.sum$fips) == "24510"] <- "Baltimore City"
levels(vehicles.sum$fips)[levels(vehicles.sum$fips) == "06037"] <- "Los Angeles"
colnames(vehicles.sum)[colnames(vehicles.sum) == "fips"] <- "City"
ggplot(vehicles.sum, aes(x = year, y = Emissions, col = City, group = City)) +
        theme_bw() +
        geom_point() +
        geom_line() +
        labs(title = "2.5 PM Emissions Baltimore City vs Los Angeles",
             subtitle = "Vehicles",
             x = "Year",
             y = "Emissions (tons)")