#!/bin/bash

# Menu
while true; do
    echo "Menu:"
    echo "1. Filtro de paquetes entrantes para el servidor"
    echo "2. Filtro de paquetes salientes para rango de IPs"
    echo "3. Filtro de paquetes salientes para bloquear www.facebook.com"
    echo "4. Salir"
    read -p "Selecciona una opción: " opcion

    if [ "$opcion" -eq 1 ]; then

        read -p "Introduce la dirección IP del servidor: " server_ip
        iptables -A INPUT -d "$server_ip" -j DROP
        echo "Filtro de paquetes entrantes configurado para el servidor $server_ip."
        iptables-save > /etc/iptables/rules.v4
        echo "Reglas guardadas en /etc/iptables/rules.v4 y se aplicarán al reiniciar."

    elif [ "$opcion" -eq 2 ]; then

        read -p "Introduce el rango de IPs de la clase (e.g., 192.168.1.0/24): " ip_range
        iptables -A OUTPUT -d "$ip_range" -j DROP
        echo "Filtro de paquetes salientes configurado para el rango $ip_range."
        iptables-save > /etc/iptables/rules.v4
        echo "Reglas guardadas en /etc/iptables/rules.v4 y se aplicarán al reiniciar."

    elif [ "$opcion" -eq 3 ]; then

        iptables -A OUTPUT -d www.facebook.com -j DROP
        echo "Filtro de paquetes salientes configurado para bloquear www.facebook.com."
        iptables-save > /etc/iptables/rules.v4
        echo "Reglas guardadas en /etc/iptables/rules.v4 y se aplicarán al reiniciar."

    elif [ "$opcion" -eq 4 ]; then

        echo "Saliendo..."
        exit 0
        
    else
        echo "Opción inválida. Por favor, intenta de nuevo."
    fi
done
