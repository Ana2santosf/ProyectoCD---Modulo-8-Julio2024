# Instalar y cargar paquetes y librerías necesarias
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
library(readr)
library(here)

# Importar el archivo CSV
df_original <- read_csv(here("DATOS", "ESS9e03_2-ESS10-subset.csv"))

# Mostrar las primeras filas del dataframe
head(df_original)