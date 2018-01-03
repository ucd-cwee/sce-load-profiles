
library(httr)
library(readr)

# Download data
#   Example 1 from page 3 of manual:
#   http://www.caiso.com/Documents/OASIS-InterfaceSpecification_v4_3_5Clean_Spring2017Release.pdf
temp_zip <- tempfile()
r <- GET("http://oasis.caiso.com/oasisapi/GroupZip",
         query = list(groupid = "DAM_LMP_GRP",
                      startdatetime = "20130919T07:00-0000",
                      version = 1),
         write_disk(temp_zip))
unzip(temp_zip, exdir = "data/ex1", overwrite = TRUE)

# or download csv files:
temp_zip_csv <- tempfile()
r_csv <- GET("http://oasis.caiso.com/oasisapi/GroupZip",
             query = list(groupid = "DAM_LMP_GRP",
                          startdatetime = "20130919T07:00-0000",
                          version = 1,
                          resultformat = "csv"),
             write_disk(temp_zip_csv))
unzip(temp_zip_csv, exdir = "data/ex1_csv", overwrite = TRUE)

# read and parse files
f <- read_csv("data/ex1_csv/20130919_20130919_PRC_LMP_DAM_LMP_v1.csv")
f
