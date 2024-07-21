# Definir la ruta al archivo CSV
archivo_original <- "DATOS/ESS9e03_2-ESS10-subset.csv"

# Cargar la librería necesaria
library(readr)

# Importar el archivo CSV
df_original <- read_csv(archivo_original)

# Mostrar las primeras filas del dataframe
head(df_original)
