#Corrige DataCamp / Nicolás Hellín Sánchez

carpetas = list.files("Entregas", full.names=T)
archivos = list.files("Entregas", recursive = T, full.names = T)

puntos = archivos[grepl("\\.txt$", archivos, ignore.case = T)]
certificados = archivos[grepl("\\.(pdf|jpg|png)$", archivos, ignore.case = TRUE)]

apellidos = c()

for(i in 1:length(carpetas)){
  
  partes = strsplit(carpetas[i], "/")[[1]]
  
  parte2 = partes[length(partes)]
  
  apellido = strsplit(parte2, ",")[[1]][1]
  
  apellidos = c(apellidos, apellido)
}
