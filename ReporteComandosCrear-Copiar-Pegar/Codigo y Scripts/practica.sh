#!/bin/bash

# Entrar a la carpeta Documents
cd ~/Documents

# 1. Crear carpetas iniciales
mkdir practica1
mkdir practica2

# 2. Entrar a practica1 y crear el archivo
cd practica1
echo "Hola, este s un archivo de texto, el cual servira para aprender como crearelos" > Readme.txt

# 3. Listar metadatos y permisos
ls -l

# 4. Copiar archivo a practica2
cp ~/Documents/practica1/Readme.txt ~/Documents/practica2/

# 5. Entrar a practica2, crear carpetas y el archivo interno
cd ~/Documents/practica2
mkdir vacia
mkdir info
cd info
echo "Hola, este s un archivo de texto, el cual servira para aprender como crearelos" > Readme.txt

# 6. Copiar carpetas recursivamente a practica1
cp -r ~/Documents/practica2/vacia ~/Documents/practica1/
cp -r ~/Documents/practica2/info ~/Documents/practica1/

# 7. Entrar a practica1 y eliminar archivo y carpeta
cd ~/Documents/practica1
rm Readme.txt
rm -r info
