library(plyr)
library(ggplot2)
NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
NEI.Baltimore <- NEI[NEI$fips == "24510", ]
toplam_emisyon_baltimore <- with(NEI.Baltimore, aggregate(Emissions, by = list(year),sum))
colnames(toplam_emisyon_baltimore) <- c("year", "Emissions")
toplam_emisyon_baltimore_type <- ddply(NEI.Baltimore, .(type, year), summarize, 
                                       Emissions = sum(Emissions))
toplam_emisyon_baltimore_type$Pollutant_Type <- toplam_emisyon_baltimore_type$type
png(filename = "Plot3.png", width = 480, height = 480)
qplot(year, Emissions, data = toplam_emisyon_baltimore_type, group = Pollutant_Type, 
      color = Pollutant_Type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Kirletici Tipine Göre Baltimore'da Toplam Emisyon Miktarları")
dev.off()
