# Instalar y cargar las librerías necesarias
if (!requireNamespace("readr", quietly = TRUE)) install.packages("readr")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(readr)
library(dplyr)
library(ggplot2)

# Definir la ruta al archivo CSV depurado
archivo_depurado <- "DATOS/ESS9e03_2-ESS10-subset_depurada.csv"

# Verificar que el archivo existe
if (file.exists(archivo_depurado)) {
  # Importar los datos depurados
  df_depurado <- read_csv(archivo_depurado)
  
  # Convertir columnas a factores si es necesario
  df_depurado <- df_depurado %>%
    mutate(
      Genero = as.factor(Genero),
      Estado_Civil = as.factor(Estado_Civil),
      Relacion_Laboral = as.factor(Relacion_Laboral),
      Salud_Subjetiva = as.factor(Salud_Subjetiva),
      Satisfaccion_Vida = as.factor(Satisfaccion_Vida),
      Nivel_Felicidad = as.factor(Nivel_Felicidad),
      Satisfaccion_Economia = ifelse("Satisfaccion_Economia" %in% colnames(df_depurado), as.factor(Satisfaccion_Economia), NULL)
    )
  
  # Crear carpeta para informes si no existe
  if (!dir.exists("INFORME")) {
    dir.create("INFORME")
  }
  
  # Crear gráficos
  # 1. Distribución de los niveles de felicidad
  p1 <- ggplot(df_depurado, aes(x = Nivel_Felicidad)) +
    geom_bar() +
    theme_minimal() +
    labs(title = "Distribución de los Niveles de Felicidad",
         x = "Nivel de Felicidad",
         y = "Frecuencia")
  ggsave("INFORME/distribucion_felicidad.png", plot = p1, width = 7, height = 7)
  
  # 2. Distribución de la satisfacción con la vida
  p2 <- ggplot(df_depurado, aes(x = Satisfaccion_Vida)) +
    geom_bar() +
    theme_minimal() +
    labs(title = "Distribución de la Satisfacción con la Vida",
         x = "Satisfacción con la Vida",
         y = "Frecuencia")
  ggsave("INFORME/distribucion_satisfaccion_vida.png", plot = p2, width = 7, height = 7)
  
  # 3. Distribución de la salud subjetiva
  p3 <- ggplot(df_depurado, aes(x = Salud_Subjetiva)) +
    geom_bar() +
    theme_minimal() +
    labs(title = "Distribución de la Salud Subjetiva",
         x = "Salud Subjetiva",
         y = "Frecuencia")
  ggsave("INFORME/distribucion_salud_subjetiva.png", plot = p3, width = 7, height = 7)
  
  # 4. Relación entre satisfacción con la economía y satisfacción con la vida
  if ("Satisfaccion_Economia" %in% colnames(df_depurado)) {
    p4 <- ggplot(df_depurado, aes(x = Satisfaccion_Economia, fill = Satisfaccion_Vida)) +
      geom_bar(position = "dodge") +
      theme_minimal() +
      labs(title = "Relación entre Satisfacción con la Economía y Satisfacción con la Vida",
           x = "Satisfacción con la Economía",
           y = "Frecuencia",
           fill = "Satisfacción con la Vida")
    ggsave("INFORME/relacion_satisfaccion_vida_economia.png", plot = p4, width = 7, height = 7)
  }
  
  # 5. Satisfacción con la vida según estado civil
  p5 <- ggplot(df_depurado, aes(x = Estado_Civil, fill = Satisfaccion_Vida)) +
    geom_bar(position = "dodge") +
    theme_minimal() +
    labs(title = "Satisfacción con la Vida según Estado Civil",
         x = "Estado Civil",
         y = "Frecuencia",
         fill = "Satisfacción con la Vida")
  ggsave("INFORME/satisfaccion_vida_estado_civil.png", plot = p5, width = 7, height = 7)
  
  # 6. Satisfacción con la vida según relación laboral
  p6 <- ggplot(df_depurado, aes(x = Relacion_Laboral, fill = Satisfaccion_Vida)) +
    geom_bar(position = "dodge") +
    theme_minimal() +
    labs(title = "Satisfacción con la Vida según Relación Laboral",
         x = "Relación Laboral",
         y = "Frecuencia",
         fill = "Satisfacción con la Vida")
  ggsave("INFORME/satisfaccion_vida_relacion_laboral.png", plot = p6, width = 7, height = 7)
  
  # 7. Diferencias en la satisfacción con la vida entre hombres y mujeres
  p7 <- ggplot(df_depurado, aes(x = Genero, fill = Satisfaccion_Vida)) +
    geom_bar(position = "dodge") +
    theme_minimal() +
    labs(title = "Satisfacción con la Vida entre Hombres y Mujeres",
         x = "Género",
         y = "Frecuencia",
         fill = "Satisfacción con la Vida")
  ggsave("INFORME/satisfaccion_vida_genero.png", plot = p7, width = 7, height = 7)
  
  # Crear una tabla resumen de estadísticas descriptivas
  summary_stats <- df_depurado %>%
    summarise(
      Edad_Media = mean(Edad, na.rm = TRUE),
      Edad_SD = sd(Edad, na.rm = TRUE),
      Satisfaccion_Vida_Media = mean(as.numeric(Satisfaccion_Vida), na.rm = TRUE),
      Satisfaccion_Vida_SD = sd(as.numeric(Satisfaccion_Vida), na.rm = TRUE),
      Felicidad_Media = mean(as.numeric(Nivel_Felicidad), na.rm = TRUE),
      Felicidad_SD = sd(as.numeric(Nivel_Felicidad), na.rm = TRUE)
    )
  write.csv(summary_stats, "INFORME/summary_stats.csv", row.names = FALSE)
  
} else {
  cat("El archivo no se encuentra en la ruta especificada:", archivo_depurado)
}

