#!/bin/bash
# ==============================================================================
# Práctica: Manipulación de Archivos y Directorios en Linux
# Descripción: Automatización de creación, copia, listado y eliminación de archivos
# ==============================================================================

# Detener la ejecución si ocurre algún error imprevisto
set -e

# Definir la ruta base de trabajo en Documents
WORK_DIR="$HOME/Documents"
cd "$WORK_DIR"

echo "=== 1. Creando carpetas iniciales ==="
mkdir -p practica1 practica2
echo "Directorios practica1 y practica2 creados con éxito."

echo -e "\n=== 2. Creando archivo de texto en practica1 ==="
# Generamos el archivo de texto directamente sin requerir interfaz gráfica
cat << 'EOF' > practica1/Readme.txt
Hola, este s un archivo de texto, el cual servira para aprender como crearelos
EOF
echo "Archivo practica1/Readme.txt generado correctamente."

echo -e "\n=== 3. Listando metadatos y permisos del archivo ==="
ls -l practica1/Readme.txt

echo -e "\n=== 4. Copiando archivo de practica1 a practica2 ==="
cp practica1/Readme.txt practica2/
echo "Archivo copiado a practica2/."

echo -e "\n=== 5. Creando subdirectorios y archivo en practica2 ==="
mkdir -p practica2/vacia practica2/info

# Generamos el segundo archivo de texto dentro de practica2/info/
cat << 'EOF' > practica2/info/Readme.txt
Hola, este s un archivo de texto, el cual servira para aprender como crearelos
EOF
echo "Estructura interna de practica2 completada."

echo -e "\n=== 6. Copiando carpetas de forma recursiva a practica1 ==="
# La opción -r replica la estructura completa del directorio
cp -r practica2/vacia practica1/
cp -r practica2/info practica1/
echo "Carpetas 'vacia' e 'info' copiadas exitosamente a practica1/."

echo -e "\n=== 7. Eliminando archivo y carpeta en practica1 ==="
# Eliminamos el archivo Readme.txt de practica1
rm practica1/Readme.txt
echo "Archivo practica1/Readme.txt eliminado."

# Eliminamos la carpeta info de forma recursiva (-r)
rm -r practica1/info
echo "Carpeta practica1/info eliminada."

echo -e "\n=== Práctica completada satisfactoriamente ==="
