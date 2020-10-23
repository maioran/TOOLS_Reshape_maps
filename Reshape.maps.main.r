# ------------------
# Clean environment
# ------------------
rm(list=ls())
gc()
# ------------------

library("tidyverse")
library("sf")
library("rmapshaper")


gis_dir <- "C:\\Users\\maioran\\Documents\\Data\\GIS DataBase\\EUROSTAT\\"
shp.file <- "EU27_Eurostat_NUTS_RG_01M_2021_4326.shp"
map.original = read_sf(paste(gis_dir, shp.file, sep=""), "EU27_Eurostat_NUTS_RG_01M_2021_4326", stringsAsFactors = FALSE, options = "ENCODING=WINDOWS-1252")

map.reshape = ms_simplify(map.original, keep = 0.05 ,sys=TRUE)

st_write(map.reshape, paste(gis_dir, "\\EU27_Eurostat_NUTS_RG_01M_2021_4326.shp_reshaped.shp",sep=""), layer_options = "ENCODING=UTF-8", append=FALSE)
