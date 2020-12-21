setwd("~/Desktop/Data_science/Exploratory Data Analysis Week 4 project")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
names(SCC)
PM2.5 <- merge(NEI, SCC, by = "SCC")
vehicles <- subset(PM2.5, PM2.5$type =="ON-ROAD" & fips == "24510")
vehicles.sum <- aggregate(Emissions~year + SCC.Level.Two, vehicles, FUN = sum)
ggplot(vehicles.sum, aes(x = year, y = Emissions, col = SCC.Level.Two, group = SCC.Level.Two)) +
        theme_bw() +
        geom_point() +
        geom_line() +
        labs(title = "2.5 PM Emissions in Baltimore City",
             subtitle = "Vehicles",
             x = "Year",
             y = "Emissions (tons)")