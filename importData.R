library("data.table")

importData <- function() {
    fileUrl <-
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    dest <- "./data/NEI_data.zip"
    if (!dir.exists("./data")) {
        dir.create("./data")
    }
    if (!file.exists(dest)) {
        download.file(url = fileUrl,
                      destfile = dest,
                      method = "curl")
        unzip(dest, exdir = "./data")
    }
}

loadSCC <- function() {
    importData()
    if (!exists("SCC")) {
        SCC <-
            data.table(readRDS("./data/Source_Classification_Code.rds"))
    }
    return(SCC)
}

loadNEI <- function() {
    importData()
    if (!exists("NEI")) {
        NEI <- data.table(readRDS("./data/summarySCC_PM25.rds"))
    }
    return(NEI)
}
