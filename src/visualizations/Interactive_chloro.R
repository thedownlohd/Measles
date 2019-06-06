library(ggplot2)
library(maps)
county <- map_data("county")
county_measles <- read.xlsx("county_level_measles.xlsx")
colnames(county_measles)[colnames(county_measles)=="state"] <- "region"
colnames(county_measles)[colnames(county_measles)=="county"] <- "subregion"

map.df <- merge(county,county_measles, by=c("region", "subregion"), all.x=T)

map.df <- map.df[order(map.df$order),]

map.df$my_text=paste("Number of measles cases: " , map.df$cases, sep="")

map.df
plot1 <- ggplot(map.df, aes(x=long,y=lat,group=group, text = my_text))+
  geom_polygon(aes(fill = cases))+
  geom_path()+ 
  scale_fill_gradientn(colours=rev(heat.colors(10)),na.value="grey90")+
  coord_map()


# Make the plot


plot1 <- ggplotly(plot1)
