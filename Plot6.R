library(ggplot2)
NEI <- readRDS("C:/Users/Z/Desktop/project2/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Z/Desktop/project2/Source_Classification_Code.rds")
vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
vehiclesBaltimoreNEI$city <- "Baltimore City"
vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)
png(filename = "Plot6.png", width = 480, height = 480)
ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission ")) + 
  labs(title=expression(" Baltimore vs. LA - Motorlu Araç Kaynaklı Emisyon Miktarları"))
dev.off()
