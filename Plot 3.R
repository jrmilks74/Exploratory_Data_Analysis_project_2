setwd("~/Desktop/Data_science/Exploratory Data Analysis Week 4 project")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
BC <- subset(NEI, fips == "24510")
BC$type = as.factor(BC$type)
BC$year = as.factor(BC$year)
BC_type <- aggregate(Emissions~type + year, BC, sum)
ggplot(BC_type, aes(x = year, y = Emissions, color = type, group = type)) +
       theme_bw() +
       geom_point() +
        geom_line() +
        labs(title = "Baltimore City",
             subtitle = "2.5 PM Emissions 1999 - 2008 by Source",
             y = "2.5 PM Emissions (tons)",
             x = "Year")