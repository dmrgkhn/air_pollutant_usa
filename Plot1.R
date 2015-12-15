NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
toplam_emisyon <- with(NEI, aggregate(Emissions, by = list(year), sum))
png(filename = "Plot1.png", width = 480, height = 480)
plot(toplam_emisyon, type ="b", col = "red", ylab = "Emissions",
     xlab = "Year", main = "Yıllık Emisyonlar")
dev.off()
