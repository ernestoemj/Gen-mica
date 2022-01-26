###  Tarea 0 ###
# Moreno Juárez Ernesto.
# Genómica Funcional. 


library(Biostrings) # Necesito cargar esta libreria para buscar la solución con librerias especializadas. 

## A) Secuencias correspondiente de Aminoácidos. 

ARNa <- readRNAStringSet("first (1).fasta") # Lecutura de mi archivo con mis secuencias de ARN. 
ARNa

translate(ARNa) # Función para traducir. 


## B) Complementing a Strand of DNA

# Con librerias especializadas.
sec <- DNAString("AAAACCCGGT") # Por medio de la función DNAString cree un código genético. 
sec # Objeto sobre el cual voy a trabajar para los ejercicios. 

complemento <- reverseComplement(sec) # Crea un objeto con la función que permite obtener la secuencia complementarias. 
complemento # Reverso complementario de la secuencia. 

# Sin librerias especializadas. 

secaa <- c("AAAACCCGGT")
secaa

ifelse(secaa >= "A" | secaa >= "U" | secaa >= "G" | secaa >= "C","U","Esta mal")

ifelse(secaa >= "A" | secaa >= "U" | secaa >= "G" | secaa >= "C","U","Esta mal")
# Posible solución utilizando ifelse que permite trabajar con los demás elementos del vector, 


if(secaa >= "A"){(print("U"))}else if
(secaa >= "U"){print("A")}else if
(secaa >= "G"){print("C")}else if
(seaa >= "C"){print("G")}else{print("Aegurese de colocar correctaMente los datos")}
# Este código no funciona porque con if y else if no podemos trabajar con todo el vector 
# ya que solamente toma el primer elemento y no todos como se hizo con ifelse. 


## C) Computing GC Content

# Con librerias especializadas. 
sec2 <- DNAString("CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCCTCCCACTAATAATTCTGAGG") # Por medio de la función DNAString cree un código genético.
sec2 # Objeto sobre el cual voy a trabajar para los ejericios. 

G <- letterFrequency(sec2, "G") # Con la función letter, obtuve la frecuncia presente de G Y C en la secuencias genética. 
G # Frecuencia de G

C <- letterFrequency(sec2, "C") # Con la función letter, obtuve la frecuncia presente de G Y C en la secuencias genética. 
C # Frecuencia de C

GC<- letterFrequency(sec2,"GC")
GC # TOTAL DE GC. 

# Sin librerias especializadas (No se pudo)



## D) Extra (Lo intente) Calculating Protein M

# Necesito crear vectores con los pesos correspondientes para cada aminoácido. 

A<- c(71.03711)
C<- c(103.00919)
D<- c(115.02694)
E<- c(129.04259)
F1<- c(147.06841)
G<- c(57.02146)
H<- c(137.05891)
I<- c(113.08406)
K<- c(128.09496)
L<- c(113.08406)
M<- c(131.04049)
N<- c(114.04293)
P<- c(97.05276)
Q<- c(128.05858)
R<- c(156.10111)
S<- c(87.03203)
T1<- c(101.04768)
V<- c(99.06841)
W<- c(186.07931)
Y<- c(163.06333)

protein <- c("SKADYEK") # Vector con el código de la proteina. 
protein # Código de la proteían 



# Uso de librerias...


aa<- frequency(protein,"S")
bb<- frequency(protein,"K")
cc <- frequency(protein,"A")
dd <- frequency(protein,"D")
ee <- frequency(protein,"Y")
ff <- frequency(protein,"E") # Intente verificar la frecuencias de cada letra, frequency.

ifelse( protein >= "D" ,sum(S + A + D + Y + E),"no") #Prueba 
# Esta prueba funciono ya que esta detectando que tenemos una D en la proteina por lo que 
# esta ejecutando la suma, en este caso utilice el ifelse porque me permite trabajar con todos los elementos del vector. 
# Necesito crear un codigo que me permita englobar todas las letras correspondientes a la secuencia de la proteina. 


# Nota: Ninguno de los ejercicios sin librerias especializadas quedo, puse los mejores borradores
# que considero pudieron estar cerca de la solución. 











