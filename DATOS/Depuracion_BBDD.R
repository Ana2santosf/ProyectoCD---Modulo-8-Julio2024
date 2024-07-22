# Instalar y cargar paquetes y librerías necesarias
if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
library(here)
library(readr)
library(dplyr)

# Definir la ruta al archivo CSV original y depurado
archivo_original <- here("DATOS", "ESS9e03_2-ESS10-subset.csv")
archivo_depurado1 <- here("DATOS", "ESS9e03_2-ESS10-subset_depurada.csv")
archivo_depurado <- here("INFORME", "ESS9e03_2-ESS10-subset_depurada.csv")

# Verificar la ruta y el archivo
if (file.exists(archivo_original)) {
  cat("Archivo encontrado en la ruta especificada:", archivo_original, "\n")
} else {
  stop("Archivo no encontrado en la ruta especificada:", archivo_original)
}

# Importar el archivo CSV
df_original <- read_csv(archivo_original)

# Confirmar o convertir variables a numéricas y cambiar nombres
df_depurado <- df_original %>%
  mutate(
    Edad = as.numeric(agea),  # Convertir agea a numérica y renombrar a Edad
    Tiempo_de_Uso_Internet = as.numeric(netustm),  # Convertir netustm a numérica y renombrar
    Anios_Educacion_Completa = as.numeric(eduyrs)  # Convertir eduyrs a numérica y renombrar
  ) %>%
  select(-agea, -netustm, -eduyrs)  # Eliminar las columnas originales

# Convertir variables a categóricas y cambiar nombres
df_depurado <- df_depurado %>%
  mutate(
    Satisfaccion_Economia = as.factor(stfeco),  # Convertir stfeco a factor y renombrar
    Satisfaccion_Educacion = as.factor(stfedu),  # Convertir stfedu a factor y renombrar
    Satisfaccion_Gobierno = as.factor(stfgov),  # Convertir stfgov a factor y renombrar
    Satisfaccion_Vida = as.factor(stflife),  # Convertir stflife a factor y renombrar
    Nivel_Felicidad = as.factor(happy),  # Convertir happy a factor y renombrar
    Salud_Subjetiva = as.factor(health),  # Convertir health a factor y renombrar
    Frecuencia_Uso_Internet = as.factor(netusoft),  # Convertir netusoft a factor y renombrar
    Pais_Encuestado = as.factor(cntry),  # Convertir cntry a factor y renombrar
    Genero = as.factor(gndr),  # Convertir gndr a factor y renombrar
    Nivel_Educacion = as.factor(edulvlb),  # Convertir edulvlb a factor y renombrar
    Relacion_Laboral = as.factor(emplrel),  # Convertir emplrel a factor y renombrar
    Estado_Civil = as.factor(maritalb)  # Convertir maritalb a factor y renombrar
  ) %>%
  select(-stfeco, -stfedu, -stfgov, -stflife, -happy, -health, -netusoft, -cntry, -gndr, -edulvlb, -emplrel, -maritalb)  # Eliminar las columnas originales

# Crear la variable 'Tiempo_de_Uso_Internet_Categorizado'
df_depurado <- df_depurado %>%
  mutate(Tiempo_de_Uso_Internet_Categorizado = case_when(
    Tiempo_de_Uso_Internet >= 0 & Tiempo_de_Uso_Internet <= 30 ~ '0-30 minutos',
    Tiempo_de_Uso_Internet > 30 & Tiempo_de_Uso_Internet <= 60 ~ '30-60 minutos',
    Tiempo_de_Uso_Internet > 60 & Tiempo_de_Uso_Internet <= 120 ~ '1-2 horas',
    Tiempo_de_Uso_Internet > 120 & Tiempo_de_Uso_Internet <= 180 ~ '2-3 horas',
    Tiempo_de_Uso_Internet > 180 & Tiempo_de_Uso_Internet <= 240 ~ '3-4 horas',
    Tiempo_de_Uso_Internet > 240 ~ 'Más de 4 horas',
    TRUE ~ 'Desconocido'
  ))

# Crear la variable 'Frecuencia_Uso_Internet_Categorizado'
df_depurado <- df_depurado %>%
  mutate(Frecuencia_Uso_Internet_Categorizado = case_when(
    Frecuencia_Uso_Internet == '1' ~ 'Nunca',
    Frecuencia_Uso_Internet == '2' ~ 'Solo ocasionalmente',
    Frecuencia_Uso_Internet == '3' ~ 'Algunas veces a la semana',
    Frecuencia_Uso_Internet == '4' ~ 'La mayoría de los días',
    Frecuencia_Uso_Internet == '5' ~ 'Todos los días',
    TRUE ~ 'Desconocido'
  ))

# Crear la variable 'Relacion_Laboral_Texto'
df_depurado <- df_depurado %>%
  mutate(Relacion_Laboral_Texto = case_when(
    Relacion_Laboral == 1 ~ "Empleado",
    Relacion_Laboral == 2 ~ "Autónomo",
    Relacion_Laboral == 3 ~ "Trabajando para negocio familiar",
    Relacion_Laboral == 6 ~ "No aplica",
    Relacion_Laboral == 7 ~ "Rechazo",
    Relacion_Laboral == 8 ~ "No sabe",
    Relacion_Laboral == 9 ~ "No responde",
    TRUE ~ "Desconocido"
  ))

# Crear la variable 'Estado_Civil_Texto'
df_depurado <- df_depurado %>%
  mutate(Estado_Civil_Texto = case_when(
    Estado_Civil == 1 ~ 'Soltero',
    Estado_Civil == 2 ~ 'Casado',
    Estado_Civil == 3 ~ 'Divorciado',
    Estado_Civil == 4 ~ 'Separado',
    Estado_Civil == 5 ~ 'Viudo',
    Estado_Civil == 6 ~ 'Cohabitando',
    TRUE ~ 'Desconocido'
  ))

# Guardar la base de datos depurada en un archivo CSV
write_csv(df_depurado, archivo_depurado)

# Mensaje de confirmación
cat("La base de datos depurada ha sido guardada en:", archivo_depurado)

# Mostrar las primeras filas del dataframe depurado
head(df_depurado)

# Verificar los nombres de las columnas
colnames(df_depurado)

