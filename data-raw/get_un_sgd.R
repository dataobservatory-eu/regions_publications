library(rjson)
library(jsonlite)
url <- 'https://data.un.org/ws/rest/data/DF_UNData_UNFCC'
url <- 'https://unstats.un.org/SDGAPI/v1/sdg/GeoArea/Tree'
url2 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Series/SI_POV_DAY1/GeoArea/DE/DataSlice'

url3 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Goal/DataCSV'


url4 <- 'https://unstats.un.org/SDGAPI/v1/sdg/Series/Data?seriesCode=SH_STA_MORT'
url(url3)
url3
read.csv(url3)
close (url3)

result <- fromJSON(url3)

this <- jsonlite::fromJSON(url4)

View ( this$data )

indicators <- jsonlite::fromJSON('https://unstats.un.org/SDGAPI/v1/sdg/Indicator/List')
indicators$series[[1]]

lapply ( indicators$series, rbind )

available_indicators <- do.call ( rbind, indicators$series)

try <- jsonlite::fromJSON (
  paste0( 'https://unstats.un.org/SDGAPI/v1/sdg/Series/Data?seriesCode=', available_indicators$code[21])
)

library(httr)
r <- POST("http://www.datasciencetoolkit.org/text2people", 
          body = "Tim O'Reilly, Archbishop Huxley")
stop_for_status(r)
content(r, "parsed", "application/json")
download.file( )
this_table <- try$data

str ( try )

#initiate the df
SDGdata<- data.frame()
# call to get the # elements with the years filter
page1 <- fromJSON("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?timePeriod=2004&timePeriod=2007&timePeriod=2011", flatten = TRUE)
perpage <- ceiling(page1$totalElements/10)
ptm <- proc.time()
for(i in 1:10){
  SDGpage <- fromJSON(paste0("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/Data?timePeriod=2004&timePeriod=2007&timePeriod=2011&pageSize=",perpage,"&page=",i), flatten = TRUE)
  message("Retrieving page ", i, " :", (proc.time() - ptm) [3], " seconds")
  SDGdata <- rbind(SDGdata,SDGpage$data[,1:16])
}

fromJSON ("https://unstats.un.org/SDGAPI/v1/sdg/Indicator/SD_MDP_CSMP/Data?timePeriod=2004&timePeriod=2007&timePeriod=2011&pageSize=")
