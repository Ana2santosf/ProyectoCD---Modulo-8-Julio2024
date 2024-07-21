# Definir la ruta al archivo CSV depurado
archivo_depurado <- "DATOS/ESS9e03_2-ESS10-subset_depurada.csv"

# Cargar las librerías necesarias
library(readr)
library(dplyr)

# Verificar la ruta y el archivo
if (file.exists(archivo_depurado)) {
  cat("Archivo encontrado en la ruta especificada:", archivo_depurado, "\n")
} else {
  stop("Archivo no encontrado en la ruta especificada:", archivo_depurado)
}

# Importar el archivo CSV depurado
df_depurado <- read_csv(archivo_depurado)

# Mostrar las primeras filas del dataframe depurado
head(df_depurado)

# Verificar los nombres de las columnas
colnames(df_depurado)

# Mostrar el resumen de las estadísticas descriptivas del dataframe depurado
summary(df_depurado)