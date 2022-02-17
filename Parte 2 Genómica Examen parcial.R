### Parte 2 ### 

## Cargar la base de datos con la que voy a trabajar ## 
library(igraphdata)
data("karate")


# 1) 1.Encuentre las tres personas más conectadas.

masconec <- degree(karate)
masconec

tresmas<- sort(masconec, decreasing = TRUE)[1:3] # Esto me permite seleccionar solo a los tres
tresmas

# 2) 2. La gráfica de la distribución de conectividades.

distribuc <- degree.distribution(karate) #Necesito la distribución de conectividades.
distribuc

# realice 2 metodos gráficos para poder ver como se distribuian las conectividades. 
# estos dos métodos han sido de los que más utilizamos para discutir. 
graf1 <- hist(distribuc)

graf2 <- boxplot(distribuc)

# 3) El diámetro de la red.
diameter(karate)


# 4) 4. El coeficiente de clusterización cada una de las 3 personas más conectadas
# Necesitamos solo los 3 más. 
jhon <- transitivity(karate, v="Jhon_A")
jhon


mr <- transitivity(karate, v="Mr Hi")
mr

mr <- transitivity(karate, v="Actor 33")
mr


# 5) Encuentre si los hay, a los nodos con coeficiente de clusterización de 1. Discute su significado.

particular <- transitivity(karate, type = "local") # Es una propiedad local para este paso
particular

# intente hacer que solo me seleccionara aquellos que tienen unicamente C=1 pero no recuerdo como se hace, siento que es algo fácil :(
sort(particular, deacreasing = TRUE, )[==1]
whic
which(particular, == 1)


# 6) El porcentaje de conexiones respecto al total.

# 7) El promedio de conectividades.
proconectividades <- mean(masconec)
proconectividades


# 8) Encuentre QUIÉNES son las 3 personas más importantes con al menos 3 distintos métodos

# 9)Encuentre la trayectoria entre las personas más alejadas. 
# Nota: Puse estos dos metodos que utilice para la tarea, y funcionan perfectamente. (creo que estan bien)
farthest_vertices(karate)

farthest.nodes(karate)


# 10) Clusteriza la red con al menos 4 métodos distintos y discute tu resultado sabiendo que ese grupo de personas se separo en dos clubes distintos con el tiempo.

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

## método 4.

fkar<- cluster_spinglass(karate, 2)
table(membership(fkar))
plot(fkar,karate)

## En los metodos seleccionados me aparece que para varios los cluster son más de dos por lo que
##..

## método fantasma..... 

fkar<- cluster_fluid_communities(karate, 2)
table(membership(fkar))
plot(fkar,karate) # Este método por lo que entendí permite clusterizar de acuerdo a un valor asignado,









