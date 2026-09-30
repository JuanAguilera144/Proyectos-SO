#!/bin/bash

# ==============================================================================
# PROYECTO: MONITOREO DE SALUD DEL SISTEMA EN SEGUNDO PLANO CON CRONTAB
# ==============================================================================

# 1. CREAR EL DIRECTORIO DEL PROYECTO
# ------------------------------------------------------------------------------
# Crea la carpeta ~/pc_salud en la carpeta personal del usuario activo.
mkdir -p -v "$HOME/pc_salud"


# 2. GENERAR EL SCRIPT DE MONITOREO (salud.sh)
# ------------------------------------------------------------------------------
# Escribe directamente el contenido del script de monitoreo dentro del archivo.
cat << 'EOF' > "$HOME/pc_salud/salud.sh"
#!/bin/bash

# Ruta del archivo log de salida
LOG_FILE="$HOME/pc_salud/salud_sistema.log"

# Registro de métricas del sistema
echo "========================================" >> "$LOG_FILE"
echo "Fecha y Hora: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"
echo "--- USO DE MEMORIA ---" >> "$LOG_FILE"
free -h >> "$LOG_FILE"
echo "--- USO DE DISCO ---" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"
echo "--- CARGA DE CPU Y TIEMPO ACTIVO ---" >> "$LOG_FILE"
uptime >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
EOF


# 3. OTORGAR PERMISOS DE EJECUCIÓN
# ------------------------------------------------------------------------------
# Le da al script permisos para poder ser ejecutado por el sistema/cron.
chmod +x "$HOME/pc_salud/salud.sh"


# 4. CONFIGURAR LA TAREA EN CRONTAB (CADA 2 MINUTOS)
# ------------------------------------------------------------------------------
# Obtiene las tareas actuales de crontab, agrega la nueva línea sin duplicar
# y la reinstala de forma automática en el sistema.
(crontab -l 2>/dev/null | grep -v "salud.sh"; echo "*/2 * * * * /bin/bash $HOME/pc_salud/salud.sh >/dev/null 2>&1") | crontab -


# 5. EJECUCIÓN INICIAL Y MONITOREO DE VERIFICACIÓN
# ------------------------------------------------------------------------------
# Ejecuta el script una vez de forma manual para probar que todo cree registros.
"$HOME/pc_salud/salud.sh"

# Muestra el contenido inicial del log generado
echo -e "\n=== CONTENIDO DEL LOG (VERIFICACIÓN) ==="
cat "$HOME/pc_salud/salud_sistema.log"
