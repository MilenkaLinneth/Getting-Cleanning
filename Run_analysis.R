#First, open de data bases to know the information
#First: features data sets
#Second: X_train
# x_train contiene valores numericos de las variables
# y_train contiene valores de 1 a 6
# subject train contiene clave secuencial de 1 a 30

library(foreign)
caract <- read.spss('C:/Actividades_2019/data/HAR/features.sav', to.data.frame=T)
xtrain <- read.spss('C:/Actividades_2019/data/HAR/train/X_train.sav', to.data.frame=T)
ytrain <- read.csv("C:/Actividades_2019/data/HAR/train/Y_train.txt")
strain <- read.csv("C:/Actividades_2019/data/HAR/train/subject_train.txt")

#Visualizar datos

dim(xtrain);dim(ytrain);dim(strain);dim(caract)
xtrain
ytrain
strain

#crear una variable secuencial ID para la union y guardar en la base indexX
#Primero llamar a la libreria dplyr

library(dplyr)
index1 <- mutate(xtrain, id=1:6893)
index2 <- mutate(ytrain, id=1:7351)
index3 <- mutate(strain, id=1:7351)
dim(index1);dim(index2);dim(index3)

#Unimos la informacion de strain, xtrain & ytrain nuevas

a <- inner_join(index1,index2, by="id")
b <- inner_join(a,index3, by="id")
head(b,n=3)
tail(b,n=3)

# la variable "b" es la matriz de train unida
# hacemos los mismo para la variable "test"

xtest <- read.spss('C:/Actividades_2019/data/HAR/test/X_test.sav', to.data.frame=T)
ytest <- read.csv("C:/Actividades_2019/data/HAR/test/Y_test.txt")
stest <- read.csv("C:/Actividades_2019/data/HAR/test/subject_test.txt")

#Visualizar datos

dim(xtest);dim(ytest);dim(stest)

#crear una variable secuencial ID para la union

index4 <- mutate(xtest, id=1:2763)
index5 <- mutate(ytest, id=1:2946)
index6 <- mutate(stest, id=1:2946)
dim(index4);dim(index5);dim(index6)

#Unimos la informacion de stest, xtest & ytest

c <- inner_join(index4,index5, by="id")
d <- inner_join(a,index6, by="id")
names(d)
names(d)[785]="X1"

# A continuacion se crea la variable key para identificar las filas de train y de test

idem1 <- mutate(b, key="train")
idem2 <- mutate(d, key="test")
head(idem1,n=3); head(idem2,n=3)
tail(idem1,n=3); tail(idem2,n=3)
dim(idem1); dim(idem2)

# Finalmente unimos las tablas "b" (idem1) y "d" (idem2) 
# las tablas de TRAIN y de TEST completas (se trata de añadir filas)

total <- rbind(idem1,idem2,deparse.level=1,make.row.names=TRUE)
dim(total)
names(total)[783]="Secuencia"
names(total)[784]="Activity"
names(total)[785]="Sujeto"
names(total)[786]="Grupo"

#Colocar nombres a las variables de forma secuencial de acuerdo al diccionario de datos
for (i in 1:561){ names(total)[i]= caract[i,1]}
#Seleccionamos las columnas que contiene "mean" o "std" para el calculo por grupos
marca1 <- select(total,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:430,
				503,504,516,517,529,530,542,543,559,560,561,Secuencia,Activity,Sujeto,Grupo)
#Calculo de promedios por grupos

por_var <- group_by(marca1,Sujeto,Activity)
summarise(por_var, media1 = mean(2, na.rm = TRUE))

#Guardar el resultado final
#el archivo marca1, contiene la informaciond de TEST and TRAIN y las variables de "mean" y "std" seleccionadas

write.table(marca1,"C:/Actividades_2019/data/HAR/final.csv", quote=TRUE, sep=" ", row.names = TRUE, col.names=TRUE)










