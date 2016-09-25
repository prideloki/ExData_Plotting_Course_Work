source("importData.R")

NEI <- loadNEI()
fip <- "24510" # Baltimore City, Maryland


totalEmissionsFromVehiclesByYear <-
    aggregate(Emissions ~ year,
              NEI[fips == fip & type == "ON-ROAD"],
              sum)

png(width = 480, height = 480,filename = "./plot5.png")
g <- ggplot(data = totalEmissionsFromVehiclesByYear,
            mapping = aes(factor(year), Emissions)) +
    geom_bar(stat = "identity") + # if not specify Error: stat_count() must not be used with a y aesthetic. because the data is already summarise
    xlab("Year") +
    ylab("Total Emissions") +
    ggtitle("Total Emissions From Vehicles in Baltimore City, Maryland")
print(g)
dev.off()
