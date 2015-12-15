NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
NEI.Baltimore <- NEI[NEI$fips == "24510", ]
toplam_emisyon_baltimore <- with(NEI.Baltimore, aggregate(Emissions, by = list(year),sum))
colnames(toplam_emisyon_baltimore) <- c("year", "Emissions")
png(filename = "Plot2.png", width = 480, height = 480)
with(toplam_emisyon_baltimore, plot(year, Emissions, type = "b",
     col = "red", ylab = "Emissions", xlab = "Year", main = "Baltimore'daki Emisyon Miktarları"))
dev.off()
