source("importData.R")

NEI <- loadNEI()
baltimoreCity <- "24510" # Baltimore City, Maryland
losAngelesCounty <- "06037" # Los Angeles County, California


totalEmissionsByYear <-
    aggregate(Emissions ~ year + fips,
              NEI[(fips == baltimoreCity |
                       fips == losAngelesCounty) &
                      type == "ON-ROAD"],
              sum)

totalEmissionsByYear$fips[totalEmissionsByYear$fips == baltimoreCity] <- "Baltimore City, Maryland"
totalEmissionsByYear$fips[totalEmissionsByYear$fips == losAngelesCounty] <- "Los Angeles County, California"

png(width = 1000, height = 480,filename = "./plot6.png")
g <- ggplot(data = totalEmissionsByYear,
            mapping = aes(factor(year), Emissions))
g <-
    g + facet_grid(. ~ fips) + 
    geom_bar(stat = "identity") +
    xlab("Year") +
    ylab("Total Emissions") +
    ggtitle("Total Emissions From Vehicles in Baltimore City, Maryland and Los Angeles County, California")
print(g)
dev.off()