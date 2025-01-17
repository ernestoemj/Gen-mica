##### Parte 1 ######
#Moreno ju�rz Ernesto. 


# Insertar la matriz. 

matriz<- read.csv("Red de amigues Gen�mica 2022 - Hoja 1.csv") # Con esto meto mi red.
matriz # Uso este para verificar que realmente esta la matriz de mis amigos, o sea el documento. 

# Esta parte se tiene que hacer principalmente porque la red tiene problemas en cuanto a los datos.
# Para esta parte, me guie como en la clase ya que necesitabamos, arreglar la base de datos
# para poder descartar los problemas que nos pueden generar ruido al momento de trabajar con los datos. 

row.names(matriz) <- matriz[,1] # Con este asigne a la columna 1 los nombres de la tabla (Primordiales para poder ver nuestra matriz)

matriz<- matriz[,-1] # Quita la columna n�mero 1.

# Esto se hizo para quitar todos los datos asignados a gabriela (ya que tienen puros espacios vacios que van a causar problemas. )

matriz <- matriz[-2,] # quite el renglon dos con su nombre
matriz <- matriz[,-2] # quite la columna 2 que correspondia igual a gabriela. 


#Convertir a matriz mi objeto, para poder trabajar con el. 

matriz<-as.matrix(matriz) 


# 1) Grafique la red. 
library(igraph) # Necesito cargar la librer�a para poder hacer la gr�fica. 

red_gf_2022<- graph_from_adjacency_matrix(matriz,mode = "directed")  # Haceos el gr�fico con la matriz que corregimos. 
red_gf_2022 # Me indica un estado de las amistades y como estan relacionadas. 

plot(red_gf_2022) # Me imprime mi gr�fica de la red. 


# 2) 2. Determine a las tres personas con m�s amigues
masamigue <- degree(red_gf_2022,mode = "in") # Entrada porque queremos saber a quienes consideran amigos. 
masamigue # verificar

sort(masamigue, decreasing = TRUE)[1:3] # Ordenarlos para que me salgan las tres personas con m�s amigues. 



# 3)Determine a las tres personas que consideran que tiene m�s amigues
masrelaciones <- degree(red_gf_2022,mode = "out") # Salida
masrelaciones

sort(masrelaciones, decreasing = TRUE)[1:3] # Ordenarlos para que me salgan las tres personas que consideran tienen m�s amigues. 


# 4) Las tres personas m�s importantes por medidas de centralidad

centr_degree(red_gf_2022)
eccentricity(red_gf_2022)
betweenness(red_gf_2022)
closeness(red_gf_2022)


# 5) Clusteriza la red con al menos dos m�todos y determine cu�les son los cl�sters

met11<- cluster_infomap(red_gf_2022)
membership(met11)
table(membership(met11))
plot(met11,red_gf_2022)

met22<- cluster_leading_eigen(red_gf_2022)
membership(met22)
table(membership(met22))
plot(met22,red_gf_2022)


# 6) Calcule el di�metro
diameter(red_gf_2022)

# 7) La matriz de distancias y dibuje un heatmap
matdist <- distances(red_gf_2022)
matdist

heatmap(matdist)
