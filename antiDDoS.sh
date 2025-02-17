#!/bin/bash

UMBRAL=50  # Número máximo de conexiones permitidas por IP
LOG_FILE="/var/log/blocked_ips.log"  # Archivo de log para IPs bloqueadas

# Obtener las IP con conexiones activas y contarlas
netstat -tn | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | awk -v umbral="$UMBRAL" '$1 > umbral {print $2}' | while read ip; do
    # Verificar si la IP ya está bloqueada
    if ! sudo iptables -C INPUT -s "$ip" -j DROP 2>/dev/null; then
        # Bloquear la IP
        sudo iptables -A INPUT -s "$ip" -j DROP
        echo "IP $ip bloqueada por exceso de conexiones."
        # Registrar la IP bloqueada
        echo "$(date): IP $ip bloqueada por exceso de conexiones." | sudo tee -a "$LOG_FILE"
    else
        echo "IP $ip ya está bloqueada."
    fi
done

echo "Detección y mitigación de ataque DoS completada."