library(httr)
library(httpuv)
library(googleAnalyticsR)
library(dplyr)
library(stringr)
library(googleAuthR)
library(googlesheets)
library(ggplot2)
library(ggrepel)
library(googlesheets4)
library(reshape2)
library(openxlsx)
ga_auth()
ga_account_forum<-ga_account_list() %>% filter(str_detect(websiteUrl,regex("forum",ignore_case = TRUE)))

all_website_data_id<-180340104
start_date<-"2020-02-01"
end_date<-"2020-03-31"
necesary_dimensions<-c("channelGrouping","date")
necesary_metrics<-c("users",'sessions')

#canales por día
canales_dia<-google_analytics(all_website_data_id,
                              date_range = c(start_date,end_date),
                              dimensions = necesary_dimensions,
                              metrics = necesary_metrics,
                              anti_sample = TRUE)

grafico_canales_dia<-ggplot(canales_dia, aes(x=date,y=users))+geom_line()                                                                        
grafico_canales_dia
