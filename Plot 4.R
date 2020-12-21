setwd("~/Desktop/Data_science/Exploratory Data Analysis Week 4 project")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(NEI)
names(SCC)
PM2.5 <- merge(NEI, SCC, by = "SCC")
Coal <- subset(PM2.5, grepl("^Fuel Comb.*Coal$", x = PM2.5$EI.Sector))
Coal.sum <- aggregate(Emissions~year + EI.Sector, Coal, sum)
ggplot(Coal.sum, aes(x = year, y = Emissions, col = EI.Sector, group = EI.Sector)) +
        theme_bw() +
        geom_point() +
        geom_line() +
        labs(title = "US 2.5 PM Emissions",
             subtitle = "Coal Combustion",
             x = "Year",
             y = "Emissions (tons)")
