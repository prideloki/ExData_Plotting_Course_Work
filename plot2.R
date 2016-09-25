source("importData.R")

NEI <- loadNEI()
fip <- "24510" # Baltimore City, Maryland


totalEmissionsByYear <- aggregate(Emissions ~ year, NEI[fips == fip,], sum)

png(width = 480, height = 480,filename = "./plot2.png")
barplot(
    height = totalEmissionsByYear$Emissions,
    names.arg = totalEmissionsByYear$year,
    xlab = "Year",
    ylab = "Total Emissions",
    col = "red",
    main = "Total Emissions From PM2.5 in Baltimore City, Maryland"
)
dev.off()
