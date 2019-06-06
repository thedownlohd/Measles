#Immunization coverage static plot
library(data.table)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(ggthemes)

vars <- c("Names", "2014", "14_LL", "14_UL", "14_CI", "14_SAMPLE SIZE", "14_TARGET",
          "2015", "15_LL", "15_UL", "15_CI", "15_SAMPLE SIZE", "15_TARGET",
          "2016", "16_LL", "16_UL", "16_CI", "16_SAMPLE SIZE", "16_TARGET", 
          "2017", "17_LL", "17_UL", "17_CI", "17_SAMPLE SIZE", "17_TARGET")
imm <- fread(file="child_imm_rates_17.csv", sep=",", select=vars)

immr <- imm %>% 
  filter(Names=="New York" | Names=="Oregon" | Names=="Washington" | Names=="California") %>% 
  select("Names", "2014", "2015", "2016", "2017")

col_plot = c("2014", "2015", "2016", "2017")
df.long <- melt(immr[,c("Names", col_plot)], id.vars="Names")
col_colors <- c("2014" = "#9FAFB8", "2015" = "#657F8E", "2016" = "#2C4F64", "2017" = "#213A49")
col_colors2 <- c("2014" = "#93AAAB", "2015" = "#789596", "2016" = "#627F80", "2017" = "#4E6666")

p.imm_cover_states <- ggplot(df.long, aes(Names, value, fill=variable)) + geom_bar(position = "dodge", stat="identity") + 
  geom_hline(yintercept = 94, linetype="dashed", color="grey88", size=.5, show.legend = TRUE) +
  geom_text(aes(.75, 94,label = "Herd Immunity", vjust = -.4), color="grey66", size=3.5) +
  scale_fill_manual(values=col_colors) + theme_few() +
  labs(title="MMVR Immunization Coverage from 2014-2017", 
       subtitle="Children Ages 19-35 Months in States with Current Outbreaks", 
       x=NULL, y="Immunization Coverage (percent)", fill="Year:", 
       caption="Data Source: Center for Disease Control") +
  theme(legend.position = "bottom")
p.imm_cover_states

#Measles cases static plot
measles_st <- read.csv(file="state_level_measles_weekly.csv", header=TRUE)

measles14_19 <- measles_st %>% 
  filter(region=="california" | region=="new york" | region=="oregon" | region=="washington") %>% 
  group_by(region, MMWR.Year) %>% 
  summarize(all.cases = sum(State.Cases.Current.Week, na.rm = T))

col_colors3 <- c("2014"="#CD9B9F", "2015"="#BA7479", "2016"="#A64C53", "2017"="#93252D",
                 "2018"="#791F25", "2019"="#5E181D")

p.measles.cases <- ggplot(measles14_19, aes(region, all.cases, fill=as.factor(MMWR.Year))) + 
  geom_bar(position = "dodge", stat="identity") + 
  scale_fill_manual(values=col_colors3) + theme_few() +
  labs(title="Measles Cases from 2014-2019",
       subtitle="As Reported through the National Notifiable Diseases Surveillance System",
       x=NULL, y="Reported Counts", fill="Year:",
       caption="Data Source: Center for Disease Control") +
  theme(legend.position = "bottom") +
  guides(fill=guide_legend(reverse=FALSE, nrow=1))

p.measles.cases