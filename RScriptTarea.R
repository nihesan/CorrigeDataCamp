#Corrige DataCamp / Nicolás Hellín Sánchez

carpetas = list.files("Entregas", full.names=T)
archivos = list.files("Entregas", recursive = T, full.names = T)

puntos = archivos[grepl("puntos.*\\.txt$|Score2.pdf|6950.txt|points_intermediate.txt|dtapoint.txt|puntosintermediate.pdf", archivos, ignore.case = T)]
certificados = archivos[grepl("\\.(pdf|jpg|png)$", archivos, ignore.case = T) & !(archivos %in% puntos)]

apellidos = c()

for(i in 1:length(carpetas)){
  
  partes = strsplit(carpetas[i], "/")[[1]]
  
  parte2 = partes[length(partes)]
  
  apellido = strsplit(parte2, ",")[[1]][1]
  
  apellidos = c(apellidos, apellido)
}

puntuaciones = c()
contenido_txt = c()
nombres_archivo = c()
apellidos_puntos = c() 

for(i in 1:length(puntos)){
  texto = readLines(puntos[i], warn = F)
  linea = ifelse(length(texto) > 0, texto[1], "")
  limpio = gsub("[^0-9,.]", "", linea)
  limpio = gsub(",", ".", limpio)
  if(nchar(limpio) > 4 && grepl("\\.", limpio)){
    
  limpio = gsub("\\.", "", limpio)}
  
  puntuaciones = c(puntuaciones, as.numeric(limpio))
  
  contenido_txt = c(contenido_txt, linea)
  
  partes = strsplit(puntos[i], "/")[[1]]
  nombres_archivo = c(nombres_archivo, partes[length(partes)])
  
  carpeta_alumno = partes[2]
  apellido = strsplit(carpeta_alumno, ",")[[1]][1]
  apellidos_puntos = c(apellidos_puntos, apellido)
}

unique(nombres_archivo)
#Hay un total de 16 nombres distintos para archivos de puntos.