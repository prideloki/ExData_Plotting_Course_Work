source("importData.R")
library(ggplot2)
NEI <- loadNEI()
fip <- "24510" # Baltimore City, Maryland

# can do both
# totalEmissionsByYearByType <-
#     aggregate(Emissions ~  year + type, data =  NEI[fips == fip], FUN = sum)
# OR
library(dplyr)
totalEmissionsByYearByType <-
    NEI[fips == fip] %>% 
    group_by(year, type) %>% 
    summarise(Emissions = sum(Emissions))
png(width = 480, height = 480,filename = "./plot3.png")
g <- ggplot(data = totalEmissionsByYearByType,
            mapping = aes(year, Emissions, color = type)) + 
    geom_line() +
    xlab("Year") +
    ylab("Total Emissions") +
    ggtitle("Total Emissions From PM2.5 in Baltimore City, Maryland")
print(g)
dev.off()
