### Parte 2 ### 

## Cargar la base de datos con la que voy a trabajar ## 
library(igraphdata)
data("karate")


# 1) 1.Encuentre las tres personas m�s conectadas.

masconec <- degree(karate)
masconec

tresmas<- sort(masconec, decreasing = TRUE)[1:3] # Esto me permite seleccionar solo a los tres
tresmas

# 2) 2. La gr�fica de la distribuci�n de conectividades.

distribuc <- degree.distribution(karate) #Necesito la distribuci�n de conectividades.
distribuc

# realice 2 metodos gr�ficos para poder ver como se distribuian las conectividades. 
# estos dos m�todos han sido de los que m�s utilizamos para discutir. 
graf1 <- hist(distribuc)

graf2 <- boxplot(distribuc)

# 3) El di�metro de la red.
diameter(karate)


# 4) 4. El coeficiente de clusterizaci�n cada una de las 3 personas m�s conectadas
# Necesitamos solo los 3 m�s. 
jhon <- transitivity(karate, v="Jhon_A")
jhon


mr <- transitivity(karate, v="Mr Hi")
mr

mr <- transitivity(karate, v="Actor 33")
mr


# 5) Encuentre si los hay, a los nodos con coeficiente de clusterizaci�n de 1. Discute su significado.

particular <- transitivity(karate, type = "local") # Es una propiedad local para este paso
particular

# intente hacer que solo me seleccionara aquellos que tienen unicamente C=1 pero no recuerdo como se hace, siento que es algo f�cil :(
sort(particular, deacreasing = TRUE, )[==1]
whic
which(particular, == 1)


# 6) El porcentaje de conexiones respecto al total.

# 7) El promedio de conectividades.
proconectividades <- mean(masconec)
proconectividades


# 8) Encuentre QUI�NES son las 3 personas m�s importantes con al menos 3 distintos m�todos

# 9)Encuentre la trayectoria entre las personas m�s alejadas. 
# Nota: Puse estos dos metodos que utilice para la tarea, y funcionan perfectamente. (creo que estan bien)
farthest_vertices(karate)

farthest.nodes(karate)


# 10) Clusteriza la red con al menos 4 m�todos distintos y discute tu resultado sabiendo que ese grupo de personas se separo en dos clubes distintos con el tiempo.

## metodo 1 

ebkar<-cluster_edge_betweenness(karate,directed = FALSE) # Metodo 1
table(membership(ebkar))
plot(ebkar,karate)

plot(eb,karate)

## metodo 2

lkar<- cluster_louvain(karate)
table(membership(lkar))
plot(lkar,karate)

## metodo 3

wkar <- cluster_walktrap(karate)
table(membership(lkar))
plot(lkar,karate)

## m�todo 4.

fkar<- cluster_spinglass(karate, 2)
table(membership(fkar))
plot(fkar,karate)

## En los metodos seleccionados me aparece que para varios los cluster son m�s de dos por lo que
##..

## m�todo fantasma..... 

fkar<- cluster_fluid_communities(karate, 2)
table(membership(fkar))
plot(fkar,karate) # Este m�todo por lo que entend� permite clusterizar de acuerdo a un valor asignado,









