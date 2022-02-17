##### Parte 1 ######
#Moreno juárz Ernesto. 


# Insertar la matriz. 

matriz<- read.csv("Red de amigues Genómica 2022 - Hoja 1.csv") # Con esto meto mi red.
matriz # Uso este para verificar que realmente esta la matriz de mis amigos, o sea el documento. 

# Esta parte se tiene que hacer principalmente porque la red tiene problemas en cuanto a los datos.
# Para esta parte, me guie como en la clase ya que necesitabamos, arreglar la base de datos
# para poder descartar los problemas que nos pueden generar ruido al momento de trabajar con los datos. 

row.names(matriz) <- matriz[,1] # Con este asigne a la columna 1 los nombres de la tabla (Primordiales para poder ver nuestra matriz)

matriz<- matriz[,-1] # Quita la columna número 1.

# Esto se hizo para quitar todos los datos asignados a gabriela (ya que tienen puros espacios vacios que van a causar problemas. )

matriz <- matriz[-2,] # quite el renglon dos con su nombre
matriz <- matriz[,-2] # quite la columna 2 que correspondia igual a gabriela. 


#Convertir a matriz mi objeto, para poder trabajar con el. 

matriz<-as.matrix(matriz) 


# 1) Grafique la red. 
library(igraph) # Necesito cargar la librería para poder hacer la gráfica. 

red_gf_2022<- graph_from_adjacency_matrix(matriz,mode = "directed")  # Haceos el gráfico con la matriz que corregimos. 
red_gf_2022 # Me indica un estado de las amistades y como estan relacionadas. 

plot(red_gf_2022) # Me imprime mi gráfica de la red. 


# 2) 2. Determine a las tres personas con más amigues
masamigue <- degree(red_gf_2022,mode = "in") # Entrada porque queremos saber a quienes consideran amigos. 
masamigue # verificar

sort(masamigue, decreasing = TRUE)[1:3] # Ordenarlos para que me salgan las tres personas con más amigues. 



# 3)Determine a las tres personas que consideran que tiene más amigues
masrelaciones <- degree(red_gf_2022,mode = "out") # Salida
masrelaciones

sort(masrelaciones, decreasing = TRUE)[1:3] # Ordenarlos para que me salgan las tres personas que consideran tienen más amigues. 


# 4) Las tres personas más importantes por medidas de centralidad

centr_degree(red_gf_2022)
eccentricity(red_gf_2022)
betweenness(red_gf_2022)
closeness(red_gf_2022)


# 5) Clusteriza la red con al menos dos métodos y determine cuáles son los clústers

met11<- cluster_infomap(red_gf_2022)
membership(met11)
table(membership(met11))
plot(met11,red_gf_2022)

met22<- cluster_leading_eigen(red_gf_2022)
membership(met22)
table(membership(met22))
plot(met22,red_gf_2022)


# 6) Calcule el diámetro
diameter(red_gf_2022)

# 7) La matriz de distancias y dibuje un heatmap
matdist <- distances(red_gf_2022)
matdist

heatmap(matdist)
