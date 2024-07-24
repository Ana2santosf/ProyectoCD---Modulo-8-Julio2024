# ProyectoCD---Modulo-8-Julio2024
Este es un proyecto de ciencia de datos del Master en Behavioral Data Science de la Universidad de Barcelona

## Descripción del Proyecto

El objetivo de este proyecto es realizar un análisis detallado de la base de datos ESS, implementar visualizaciones dinámicas y generar informes técnicos utilizando herramientas de Ciencia Reproducible.

## Objetivo Principal

- Analizar y visualizar la satisfacción con la vida y otros indicadores sociodemográficos en diferentes países europeos utilizando datos de la Encuesta Social Europea (ESS).

## Objetivos Específicos

1. Depurar y preparar la base de datos de la ESS para análisis posteriores.
2. Explorar y analizar la relación entre la satisfacción con la vida y variables sociodemográficas como edad, género, nivel educativo y estado civil.
3. Implementar visualizaciones interactivas mediante dashboards para facilitar la interpretación de los datos; esto, mediante la creación de presentacionesque comuniquen los resultados del análisis utilizando RMarkdown y Shiny.
4. Generar informes técnicos que resuman los principales hallazgos utilizando RNW.


## Estructura del Repositorio

La estructura del repositorio es la siguiente:

- `README.md`: Este archivo.

- `Datos/`
  - `Base de datos original/`: Contiene la base de datos original en formato CSV con el nombre de "ESS9e03_2-ESS10-subset.csv".
  - `BBDD Original.R/`: Scripts para isntalar o cargar librerias y leer la BBDD.
  - `Depuración_BBDD.R/`: Scripts utilizado para la depuración de la base de datos.
  - `BBDD Depurada.R/`: Scripts con la BBDD depurada.
  - `Base de datos Original/`: Contiene la base de datos depurada en formato CSV.
  - `Base de datos depurada/`: Contiene la base de datos depurada en formato CSV con el nombre de "ESS9e03_2-ESS10-subset_depurada.csv".
  
- `SCRIPT R - Gráficos + Estadísticas/`
  - `Análisis.R/`: Scripts R para generar Gráficos y Summary.
  
- `Informe/`
  - `Código/`: Scripts RSweave (.Rnw) para generar el informe técnico.
  - `PDF/`: Informe técnico generado en formato PDF.
  - `PNG/`: Imágenes PNG obtenidas al ejecutar el Script anterior
  - `CSV/`: Summary_stats.csv que contiene estadísticas descriptivas obtenidas al ejecutar el Script anterior
  
- `Presentación/`
     - `Código/`: Scripts RSweave (.Rnw) para generar una presentación dinámica con knitr.
     - `PDF/`: Presentación exportada en formato PDF.
  
- `Dashboard/`
  - `Código/`: Scripts Rmarkdown (.Rmd) para generar dashboards con Flexdashboard y Shiny
  - `HTML/`: Dashboards exportados en formato HTML.

## Instrucciones de Instalación

1. Clona el repositorio:
   ```sh
   git clone https://github.com/Ana2santosf/ProyectoCD---Modulo-8-Julio2024.git
   
## Instala los paquetes necesarios en R Studio
install.packages(c("readr", "here", "dplyr", "tinytex", "ggplot2", "knitr", "tinytex::tlmgr_install('graphicx')", "rmarkdown", "flexdashboard", "shiny"))

## ¿Cómo usar el Proyecto?

1. Navega a la carpeta DATOS/ y ejecuta los scripts de BBDD Original, Depuracion_BBDD para preparar la base de datos y BBDD Depurada para cargar la BBDD depurada y que genere duplicados en la carpeta de INFORME/ y DASHBOARD/ respectivamente.

2. Ejecuta el Script de R de la carpeta SCRIPT R - Gráficos + Estadísticas para generar los gráficos como imagénes PNG y un summary.csv para visualizar las estadísticas

3. Ingresa en la carpeta INFORME/ y ejecuta el Informe.Rnw y compila PDF para que puedas visualizar el informe - Informe/PDF/ con los principales hallazgos o más bien un análisis exploratorio.

4. Consulta la presentación en Presentación/ para obtener un resumen visual del proyecto, para ello, deberás ejecutar la Presentación.Rnw y compilar en PDF.

5. Ejecuta el archivo (.Rmd) desde DASHBOARD/ para que puedas visualizar el dashboard creado en Rmarkdown usando Flexdashboard y Shiny


## Análisis Exploratorio de Datos 

## **Variables Numéricas**

**Edad (agea)**
- Tipo: Numérica discreta
- Unidad: Años
- Rango: 15 - 90 años, 999 (no disponible)
- Outliers: N/A
- Distribución: La mayoría de los encuestados se agrupan en rangos más jóvenes, con una disminución en la cantidad de encuestados a medida que aumenta la edad.

**Tiempo de uso de Internet (netustm)**
- Tipo: Numérica discreta
- Unidad: Minutos
- Rango: 0 - más de 1440 minutos diarios; 6666 (Not applicable*), 7777 (Refusal*), 8888 (Don't know*), 9999 (No answer*)
- Outliers: Los valores extremadamente altos (más de 600 minutos al día) podrían considerarse outliers ya que representan 10 horas al día.
- Distribución: El tiempo de uso de Internet varía ampliamente. La mayoría de los encuestados usan Internet entre 0 y 300 minutos diarios, pero hay algunos que reportan tiempos mucho mayores.

**Años de educación a tiempo completo (eduyrs)**
- Tipo: Numérica discreta
- Unidad: Años
- Rango: 0 - más de 65 años; 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: Los valores mayores de 30 años pueden ser outliers.
- Distribución: La mayoría de los encuestados tiene entre 0 y 20 años de educación a tiempo completo. Los valores mayores de 20 años son menos comunes.

## **Variables Categóricas**

**Satisfacción con la economía (stfeco)**
- Tipo: Escala Likert (ordinal)
- Unidad: 0-10
- Rango: 0 (muy insatisfecho) a 10 (muy satisfecho); 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: N/A
- Distribución: Distribuida en una escala de 0 (muy insatisfecho) a 10 (muy satisfecho). La distribución puede ser sesgada hacia los extremos.

**Satisfacción con la educación (stfedu)**
- Tipo: Escala Likert (ordinal)
- Unidad: 0-10
- Rango: 0 (muy insatisfecho) a 10 (muy satisfecho); 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: N/A
- Distribución: Similar a la satisfacción con la economía, varía de 0 a 10.

**Satisfacción con el gobierno (stfgov)**
- Tipo: Escala Likert (ordinal)
- Unidad: 0-10
- Rango: 0 (muy insatisfecho) a 10 (muy satisfecho); 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: N/A
- Distribución: Varía de 0 a 10. La percepción de la satisfacción con el gobierno puede tener una distribución polarizada.

**Satisfacción con la vida (stflife)**
- Tipo: Escala Likert (ordinal)
- Unidad: 0-10
- Rango: 0 (muy insatisfecho) a 10 (muy satisfecho); 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: N/A
- Distribución: Varía de 0 a 10. La mayoría de las respuestas tienden a agruparse en niveles más altos de satisfacción.

**Nivel de felicidad (happy)**
- Tipo: Escala Likert (ordinal)
- Unidad: 0-10
- Rango: 0 (muy infeliz) a 10 (muy feliz); 77 (Refusal*), 88 (Don't know*), 99 (No answer*)
- Outliers: N/A
- Distribución: Varía de 0 a 10. La mayoría de las respuestas tienden a agruparse en niveles más altos de felicidad.

**Salud subjetiva (health)**
- Tipo: Escala Likert (ordinal)
- Unidad: 1-5
- Rango: 1 (muy buena) a 5 (muy mala); 7 (Refusal*), 8 (Don't know*), 9 (No answer*)
- Outliers: N/A
- Distribución: La mayoría de las personas evalúan su salud como buena o regular; hay una minoría significativa que reporta una salud muy buena o mala.

**Frecuencia de uso de Internet (netusoft)**
- Tipo: Ordinal
- Unidad: Escala de categorías
- Rango: 1 (Nunca) a 5 (Todos los días); 7 (Refusal*), 8 (Don't know*), 9 (No answer*)
- Outliers: N/A
- Distribución: Los encuestados utilizan Internet con diferentes frecuencias, desde "Nunca" hasta "Todos los días", con una variabilidad notable en las respuestas.

**País del encuestado (cntry)**
- Tipo: Categórica nominal
- Unidad: Códigos de país
- Rango: AL (Albania), AT (Austria), BE (Belgium), BG (Bulgaria), CH (Switzerland), CY (Cyprus), CZ (Czechia), DE (Germany), DK (Denmark), EE (Estonia), ES (Spain), FI (Finland), FR (France), GB (United Kingdom), GE (Georgia), GR (Greece), HR (Croatia), HU (Hungary), IE (Ireland), IS (Iceland), IL (Israel), IT (Italy), LT (Lithuania), LU (Luxembourg), LV (Latvia), ME (Montenegro), MK (North Macedonia), NL (Netherlands), NO (Norway), PL (Poland), PT (Portugal), RO (Romania), RS (Serbia), RU (Russian Federation), SE (Sweden), SI (Slovenia), SK (Slovakia), TR (Turkey), UA (Ukraine), XK (Kosovo)
- Outliers: N/A
- Distribución: Representa la distribución de encuestados por país. Cada código de país se asigna de manera equitativa y no hay una escala de frecuencia o rango de valores.

**Género (gndr)**
- Tipo: Categórica nominal
- Unidad: Códigos de género
- Rango: 1 (Masculino), 2 (Femenino), 9 (No responde)
- Outliers: N/A
- Distribución: Generalmente equilibrado entre hombres y mujeres, pero puede variar según el país y la ronda de la encuesta.

**Nivel más alto de educación (edulvlb)**
- Tipo: Categórica ordinal
- Unidad: ISCED (International Standard Classification of Education)
- Rango: Varía desde "Not completed ISCED level 1" hasta "ISCED 6, doctoral degree"; 5555 (Other), 7777 (Refusal*), 8888 (Don't know*), 9999 (No answer*)
- Outliers: Los valores 5555 (Other) podrían considerarse outliers.
- Distribución: Varía desde educación primaria incompleta hasta grado doctoral. Los valores extremos (no especificados) son menos comunes.

**Relación laboral (emplrel)**
- Tipo: Categórica nominal
- Unidad: Categorías de relación laboral
- Rango: 1 (Empleado), 2 (Autónomo), 3 (Trabajando para negocio familiar), 6 (No aplica*), 7 (Rechazo*), 8 (No sabe*), 9 (No responde*)
- Outliers: N/A
- Distribución: Los encuestados se agrupan en diferentes categorías laborales, con una mayoría como empleados o autónomos.

**Estado civil (maritalb)**
- Tipo: Categórica nominal
- Unidad: Categorías de estado civil
- Rango: 1 (Casado legalmente), 2 (En una unión civil legalmente registrada), 3 (Separado legalmente), 4 (Divorciado legalmente/Unión civil disuelta), 5 (Viudo/pareja civil fallecida), 6 (Ninguna de estas - NUNCA casado o en unión civil legalmente registrada); 77 (Rechazo*), 88 (No sabe*), 99 (No responde*)
- Outliers: N/A
- Distribución: Varía entre diferentes estados civiles, con la mayoría de los encuestados siendo casados legalmente o nunca casados.

### Vigencia de los Datos

Los datos provienen de la Encuesta Social Europea (ESS) y son actualizados bianualmente. Las rondas utilizadas para esta visualización son:
- ESS9 (2018): "El momento de la vida, la justicia y la equidad"
- ESS10 (2020): "Democracia, contactos sociales digitales"

### Notas Adicionales

- Los valores especiales en las variables (por ejemplo, 77, 88, 99) representan respuestas como "Rechazo", "No sabe" o "No responde" y deben ser tratados adecuadamente durante el análisis.

### Distribuciones y Outliers

- La mayoría de las variables tienen distribuciones normales o sesgadas y algunas pueden contener outliers que deben ser considerados durante el análisis.
- La satisfacción con la vida, la felicidad y la salud subjetiva son variables clave que se analizarán en relación con factores sociodemográficos y de uso de Internet.

### Actualización y Uso de Datos

- Los datos deben actualizarse con cada nueva ronda de la encuesta, aproximadamente cada 2-3 años.
- Se espera que estos datos sean utilizados principalmente para análisis de políticas sociales y económicas a nivel europeo, en contextos de oficina y reuniones para la toma de decisiones estratégicas.


## Preguntas que se pretenden responder: 
¿Cuál es la distribución de los niveles de felicidad (happy) en los encuestados?
¿Cuál es la distribución de la satisfacción con la vida (stflife) en los encuestados?
¿Cuál es la distribución de la salud subjetiva (health) en los encuestados?
¿Cómo se relacionan la satisfacción con la economía (stfeco) y la satisfacción con la vida (stflife)?
¿Qué diferencias se observan en la satisfacción con la vida (stflife) según el estado civil (maritalb)?
¿Qué diferencias se observan en la satisfacción con la vida (stflife) según la relación laboral (emplrel)?
¿Cuáles son las diferencias en la satisfacción con la vida (stflife) entre los diferentes países europeos encuestados?
Preguntas Adicionales
¿Cómo se relaciona el tiempo de uso de Internet (netustm) con el nivel de felicidad (happy)?
¿Existen diferencias significativas en la satisfacción con la vida (stflife) entre hombres y mujeres?
¿Cómo se relaciona el nivel educativo (Education Group) con la satisfacción con la vida (stflife)?
¿Cuál es el número de encuestados por grupo educativo y cómo se distribuye la satisfacción con la vida (stflife) en estos grupos?
   