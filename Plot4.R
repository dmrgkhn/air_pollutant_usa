library(ggplot2)
NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
combustionRelated <- subset("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- subset("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png(filename = "Plot44.png", width = 480, height = 480)
ggplot(combustionNEI,aes(factor(year),Emissions)) +
  geom_point(color = "red") + geom_line(color = "green") +
  labs(x="year", y=expression("Total PM"[2.5])) + 
  labs(title=expression("ABD'de Kömür Yakılması Sebebiyle Oluşan Emisyon Miktarları"))

dev.off()
