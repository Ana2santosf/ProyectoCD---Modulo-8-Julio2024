# Instalar y cargar las librerías necesarias
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
library(readr)
library(dplyr)
library(here)

# Verificar el contenido de la carpeta DATOS
contenido_datos <- list.files(here("DATOS"))
cat("Contenido de la carpeta 'DATOS':\n")
print(contenido_datos)

# Definir la ruta al archivo CSV depurado
archivo_depurado <- here("DATOS", "ESS9e03_2-ESS10-subset_depurada.csv")

# Verificar la ruta y el archivo
if (file.exists(archivo_depurado)) {
  cat("Archivo encontrado en la ruta especificada:", archivo_depurado, "\n")
} else {
  stop("Archivo no encontrado en la ruta especificada:", archivo_depurado)
}

# Importar el archivo CSV depurado
df_depurado <- read_csv(archivo_depurado)

# Mostrar las primeras filas del dataframe depurado
cat("Primeras filas del dataframe depurado:\n")
print(head(df_depurado))

# Verificar los nombres de las columnas
cat("Nombres de las columnas del dataframe depurado:\n")
print(colnames(df_depurado))

# Mostrar el resumen de las estadísticas descriptivas del dataframe depurado
cat("Resumen de las estadísticas descriptivas del dataframe depurado:\n")
print(summary(df_depurado))
