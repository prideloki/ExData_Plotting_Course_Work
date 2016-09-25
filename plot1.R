source("importData.R")

NEI <- loadNEI()

totalEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

png(width = 480, height = 480,filename = "./plot1.png")
barplot(
    height = totalEmissionsByYear$Emissions,
    names.arg = totalEmissionsByYear$year,
    xlab = "Year",
    ylab = "Total Emissions",
    col = "red",
    main = "Total Emissions From PM2.5 in the United State"
)
dev.off()