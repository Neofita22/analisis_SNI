install.packages("pacman")

#load & install, if you dont have this pckgs
pacman::p_load("vroom", "dplyr")

#alt+ "-" == <-
la_data <- vroom(file = "/home/bendezs/Clacesita/proyecto_erecita/analisis_SNI/data/data_original.csv")

#chmod u+w filename, dar permisos de modificar a un user!
# Ctrl + Shift + M == %>% , m o M da igual

data_filtrada <- la_data %>% 
  filter(nobilis =="DR." | nobilis == "DRA.")

##ver el path del directorio actual
#getwd()
##corregir el path del directorio
#setwd("/home/bendezs/Clacesita/proyecto_erecita/analisis_SNI/")

# crea un archivo vacio o lo actualiza en el tiempo
#<touch filename/file.R>

# creamos un directorio de resultados
dir.create( path = "/home/bendezs/Clacesita/proyecto_erecita/analisis_SNI/results" )

# guardar esta data
write.csv( x = data_filtrada, file = "/home/bendezs/Clacesita/proyecto_erecita/analisis_SNI/results/limpia.csv" )


# Calcular la proporcion de Dr y DRA que pierden SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI" ) %>% 
  group_by( nobilis ) %>% 
  summarise( totales = sum( miembros ) )

# Guardamos la data resumen, hemos cambiado el directorio para los resultados
# hasta en este punto es ~/results
write.csv( x = data_resumen, file = "results/resumen.csv" )


#TO-DOs
#yo: calcular el % de DR. DRA
#           como TOTAL INGRESOS / TOTAL PERDIDAS

# SON BUENAS PRACTICAS DEL CODIGO PARA VER LOS PENDIENTES #



