#ps2
##Julian Fandiño_202021070##
##https://github.com/fandino-julian/ps2.git
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
location<-read.csv("~/Downloads/Modulo de sitio o ubicacion/excel_ubicacion.csv")
identification<-read.csv("~/Downloads/Modulo de identificacion/excel_identificacion.csv")

#1.2 Exportar
saveRDS(location, file="output/location.rds")
saveRDS(identification, file="output/identification.rds")


#2. Generar variables
#2.1 
identification$business_type <- factor(identification$GRUPOS4,
                                       levels = c(1, 2, 3, 4),
                                       labels = c("Agricultura", "Industria manufacturera",
                                                  "Comercio", "Servicios"))

# 2.2 Generar la variable 'grupo_etario'
cortes_edad <- c(18, 30, 50, 70, Inf)
nombres_grupos <- c("Joven", "Adulto", "Adulto mayor", "Anciano")
#se inicia desde los 18, debido aque el valor minimo es 18 y se pone desde 70 en adelante por lo que hay datos de 98 y 99 años

identification$grupo_etario <- cut(identification$P241, breaks = cortes_edad, labels = nombres_grupos, include.lowest = TRUE)

# 2.3 Generar la variable 'ambulante' en el objeto 'location'
location$ambulante <- ifelse(location$P3053 %in% c(3, 4, 5), 1, 0)

#3 Eliminar filas/columnas de un conjunto de datos
#3.1
identification_sub <- identification[, c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA", "grupo_etario","COD_DEPTO", "F_EXP")]
#3.2
location_sub <- location[, c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA", "ambulante", "P3054", "P469", "COD_DEPTO", "F_EXP")]

#4 Combinar base de datos
#4.1 
df_combined <- merge(location_sub, identification_sub, by = c("DIRECTORIO", "SECUENCIA_P", "SECUENCIA_ENCUESTA"))


#5 Descriptivas
#5.1 
resumen <- summary(df_combined)



