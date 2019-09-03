# Getting-Cleanning
Repositorio para la presentacion de resultados de Peer-Graded Assignment
El scripts que presento a continuacion tiene el objetivo de organizar y limpiar los datos ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) de una investigacion que recopila informacion sobre movimiento a traves de un celular Samsung Galaxy.
Inciando con la informacion original (RAW DATA) se procede a:
1. Explorar los archivos:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt'
- 'train/Inertial Signals/body_acc_x_train.txt'
- 'train/Inertial Signals/body_gyro_x_train.txt'
2. Se observa que la explicacion sobre las caracteristicas y componentes de las tablas no es del todo claro, lo cual aumento el  timepo dedicado a tratar de entender la base e identificar la relacion entre ellas, por la escases de informacion. Ademas que las dimensiones de las variables no coincidian en ninguno de los casos.
3. Se lee las tablas utilizando las librerias correspondientes para el tipo de datos, en este caso texto. 
4. Una vez recuperadas las tablas se procede a unir las de TRAIN (X_train, Y_train, S_train) y luego las de TEST habiendo creado para ello un identiticador.
5. Una vez construidas las tablas TRAIN y TEST  se procede a unirlas para conformar una sola base de casos, cuyo nombre es TOTAL.
6. Se organiza y se Renombra a las variables de TOTAL para mayor claridad, de acuerdo al archivo "features.txt" que contiene los nombres de las variables medidas. Se utiliza una tecnicas de numeracion por correspondencia con esta tabla. 
7. Se construye una nueva tabla organizada que contiene solamente la tabla con las medidas que hacen referencia a "mean" y a "std" de acuerdo a las instrucciones, nuevamente en correspondencia con el dicionario de datos tomado de "features.txt"
8. La nueva tabla producto del anterior se denomina "marca1" sobre la cual se aplica los comenados by_group, par obtener el promedio de las varaiables por actividad y por sujeto de estudio.
9. Finalmente se graba la tabla final procesada y organizada.
