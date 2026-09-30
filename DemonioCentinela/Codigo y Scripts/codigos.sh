#!/bin/bash

# ==============================================================================
# SCRIPT COMPLETO DE PROYECTO: SERVICIO DE MONITOREO PERSISTENTE CON SYSTEMD
# ==============================================================================

SCRIPT_PATH="/usr/local/bin/monitoreo.sh"
SERVICE_PATH="/etc/systemd/system/monitoreo.service"
LOG_PATH="/var/log/monitoreo_sistema.log"

# Comprobar permisos de superusuario
if [ "$EUID" -ne 0 ]; then
  echo "Error: Por favor ejecuta este script con sudo:"
  echo "sudo bash $0"
  exit 1
fi

echo "================================================="
echo "1. Creando el script de monitoreo en $SCRIPT_PATH"
echo "================================================="

cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

LOG_FILE="/var/log/monitoreo_sistema.log"

while true; do
    FECHA=$(date '+%Y-%m-%d %H:%M:%S')
    PROCESOS=$(ps aux | wc -l)
    MEMoria=$(free -h | awk '/^Mem:/ {print $7}')

    echo "[$FECHA] Procesos activos: $PROCESOS | RAM disponible: $MEMoria" >> "$LOG_FILE"

    sleep 5
done
EOF

# Otorgar permisos de ejecución
chmod +x "$SCRIPT_PATH"
echo "Permisos de ejecución asignados correctamente."


echo -e "\n================================================="
echo "2. Creando el servicio systemd en $SERVICE_PATH"
echo "================================================="

cat << 'EOF' > "$SERVICE_PATH"
[Unit]
Description=Servicio de Monitoreo Continuo de Sistema
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/monitoreo.sh
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF


echo -e "\n================================================="
echo "3. Recargando systemd, habilitando e iniciando servicio"
echo "================================================="

systemctl daemon-reload
systemctl enable monitoreo.service
systemctl start monitoreo.service

echo "Esperando 6 segundos para recopilar los primeros registros..."
sleep 6


echo -e "\n================================================="
echo "4. Ultimas lineas generadas en la bitácora ($LOG_PATH)"
echo "================================================="
tail -n 3 "$LOG_PATH"


echo -e "\n================================================="
echo "5. Demostración de la Condición de Aprobación (kill -9)"
echo "================================================="

# Obtener PID inicial
PID_INICIAL=$(pgrep -f "$SCRIPT_PATH")
echo "PID inicial del demonio: $PID_INICIAL"

echo "Enviando 'kill -9' al proceso $PID_INICIAL..."
kill -9 "$PID_INICIAL"

echo "Esperando 4 segundos a que systemd reviva el servicio..."
sleep 4

# Obtener nuevo PID
PID_NUEVO=$(pgrep -f "$SCRIPT_PATH")
echo "Nuevo PID asignado por systemd: $PID_NUEVO"

if [ -n "$PID_NUEVO" ] && [ "$PID_INICIAL" != "$PID_NUEVO" ]; then
    echo -e "\n¡PRUEBA EXITOSA! El servicio se reanimó automáticamente con un nuevo PID."
else
    echo -e "\nError: El servicio no logró reanimarse."
fi

echo -e "\n================================================="
echo "Estado actual del servicio:"
echo "================================================="
systemctl status monitoreo.service --no-pager
