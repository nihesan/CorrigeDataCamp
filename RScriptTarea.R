#Corrige DataCamp / Nicolás Hellín Sánchez

archivos = list.files("Entregas", recursive = T, full.names = T)

puntos = archivos[grepl("\\.txt$", archivos, ignore.case = T)]
certificados = archivos[grepl("\\.(pdf|jpg|png)$", archivos, ignore.case = TRUE)]

apellidos = c()

for(i in 1:length(puntos)){
  
  partes = strsplit(puntos[i], "/")[[1]]
  partes2 = partes[length(partes) - 1]
  
  apellido = strsplit(partes2, ",")[[1]][1]
  
  apellidos = c(apellidos, apellido)
}
