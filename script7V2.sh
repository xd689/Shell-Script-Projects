#!/bin/bash

save_rules() {
    iptables-save > /etc/iptables/rules.v4
    echo "Reglas guardadas en /etc/iptables/rules.v4 y se aplicarán al reiniciar."
}

configure_incoming_filter() {
    read -p "Introduce la dirección IP del servidor: " server_ip
    iptables -A INPUT -d "$server_ip" -j DROP
    echo "Filtro de paquetes entrantes configurado para el servidor $server_ip."
    save_rules
}

configure_outgoing_filter() {
    read -p "Introduce el rango de IPs de la clase (e.g., 192.168.1.0/24): " ip_range
    iptables -A OUTPUT -d "$ip_range" -j DROP
    echo "Filtro de paquetes salientes configurado para el rango $ip_range."
    save_rules
}

configure_facebook_filter() {
    iptables -A OUTPUT -d www.facebook.com -j DROP
    echo "Filtro de paquetes salientes configurado para bloquear www.facebook.com."
    save_rules
}

while true; do
    echo "Menu:"
    echo "1. Filtro de paquetes entrantes para el servidor"
    echo "2. Filtro de paquetes salientes para rango de IPs"
    echo "3. Filtro de paquetes salientes para bloquear www.facebook.com"
    echo "4. Salir"
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1)
            configure_incoming_filter
            ;;
        2)
            configure_outgoing_filter
            ;;
        3)
            configure_facebook_filter
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, intenta de nuevo."
            ;;
    esac
done