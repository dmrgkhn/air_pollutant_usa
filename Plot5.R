library(ggplot2)
NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
vehicles <- subset("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]
png(filename = "Plot5.png", width = 480, height = 480)
ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="red") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression("Baltimore'daki Motorlu Araç Kaynaklı Emisyon Miktarları"))
dev.off()
