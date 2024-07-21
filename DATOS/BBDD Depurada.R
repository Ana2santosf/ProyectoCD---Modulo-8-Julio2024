\documentclass{article}
\usepackage{geometry} 
\geometry{
  a4paper,
  total={170mm,257mm},
  left=20mm,
  top=20mm,
}

\title{Proyecto de Ciencia de Datos - Modulo 8}
\author{Ana G. Dos Santos F.}
\date{\Sexpr{Sys.Date()}}

\begin{document}
<<setup, include=FALSE>>=
  knitr::opts_chunk$set(concordance=TRUE, echo=TRUE, results='markup', warning=FALSE, message=FALSE)
@
  
  \maketitle

\section*{Primeros pasos}

\begin{itemize}
\item Instalar una distribución de LaTeX: tinytex
\item Instalar paquetes de LaTeX mediante tinytex
\end{itemize}

\section*{Instalación de Librerías}

<<install_libraries>>=
  # Instalar y cargar las librerías necesarias
  if (!requireNamespace("readr", quietly = TRUE)) {
    install.packages("readr")
  }
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(readr)
library(dplyr)
library(ggplot2)
@
  
  \section*{Configuración del Directorio de Trabajo}

<<set_working_directory>>=
  # Mostrar el directorio de trabajo actual
  cat("Directorio de trabajo actual:", getwd(), "\n")
@
  
  \section*{Carga de Datos}

<<load_data>>=
  # Definir la ruta al archivo CSV depurado
  archivo_depurado <- "DATOS/ESS9e03_2-ESS10-subset_depurada.csv"
  
  # Verificar que el archivo existe
  if (file.exists(archivo_depurado)) {
    # Importar los datos depurados
    df_depurado <- read_csv(archivo_depurado)
    
    # Verificar las primeras filas del dataframe depurado
    print(head(df_depurado))
  } else {
    stop("El archivo no se encuentra en la ruta especificada: ", archivo_depurado)
  }
  @
    
    \section*{Análisis de Datos}
  
  <<data_analysis, fig.cap='Relación entre edad y satisfacción con la vida', fig.width=7, fig.height=5>>=
    # Verificar si el objeto 'df_depurado' está disponible y es un data frame
    if (exists("df_depurado") && is.data.frame(df_depurado)) {
      # Crear un gráfico de dispersión para la relación entre edad y satisfacción con la vida
      ggplot(df_depurado, aes(x = Edad, y = `Satisfacción con la vida`)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE) +
        theme_minimal()
    } else {
      cat("El objeto 'df_depurado' no está disponible o no es un data frame.")
    }
  @
    
    \section*{Resumen de Estadísticas Descriptivas}
  
  <<summary_statistics>>=
    # Verificar si el objeto 'df_depurado' está disponible y es un data frame
    if (exists("df_depurado") && is.data.frame(df_depurado)) {
      # Crear una tabla resumen de estadísticas descriptivas
      summary_stats <- df_depurado %>%
        summarise(
          Edad_Media = mean(Edad, na.rm = TRUE),
          Edad_SD = sd(Edad, na.rm = TRUE),
          Satisfaccion_Vida_Media = mean(`Satisfacción con la vida`, na.rm = TRUE),
          Satisfaccion_Vida_SD = sd(`Satisfacción con la vida`, na.rm = TRUE),
          Felicidad_Media = mean(`Nivel de felicidad`, na.rm = TRUE),
          Felicidad_SD = sd(`Nivel de felicidad`, na.rm = TRUE)
        )
      
      print(summary_stats)
    } else {
      cat("El objeto 'df_depurado' no está disponible o no es un data frame.")
    }
  @
    
    \end{document}
  