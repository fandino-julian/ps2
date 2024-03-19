#ps2
##Julian Fandiño_202021070##
R.version.string
library(rio)
install.packages("rio")
install.packages("pacman")
library(pacman)
installed.packages("data.table")
library(data.table
        )
installed.packages("tidyverse")
library(tidyverse)

#1 Importar
#1.1 Importar
location=read.csv("~/Downloads/Modulo de sitio o ubicacion/excel_ubicacion.csv")
identification=read.csv("~/Downloads/Modulo de identificacion/excel_identificacion.csv")

#1.2 Exportar
saveRDS(location, file="output/location.rds")
saveRDS(identification, file="output/identification.rds")