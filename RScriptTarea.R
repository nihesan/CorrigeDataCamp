#Corrige DataCamp / Nicolás Hellín Sánchez

archivos = list.files("Entregas", recursive = T, full.names = T)

puntos = archivos[grepl("puntos.*\\.txt$", archivos, ignore.case = T)]
