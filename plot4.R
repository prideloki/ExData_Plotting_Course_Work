source("importData.R")
library(ggplot2)
NEI <- loadNEI()

SCC <- loadSCC()
mrg <-
    merge(NEI, SCC, by = "SCC") # merge SCC and NEI with SCC column
library(dplyr)

totalEmissionsFromCoalByYear <-
    mrg[grepl("coal", mrg$Short.Name, ignore.case = TRUE)] %>% # filters only source from coal combustion-related
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
png(width = 480, height = 480,filename = "./plot4.png")
g <- ggplot(data = totalEmissionsFromCoalByYear,
            mapping = aes(factor(year), Emissions),
            y = year) +
    geom_bar(stat = "identity") +
    xlab("Year") +
    ylab("Total Emissions") +
    ggtitle("Total Emissions From Coal Source in the United State (1999-2008)")
print(g)
dev.off()
