#!/bin/bash

function mostrar_menu {
    echo "1. Cortar el tráfico saliente hacia un dominio web"
    echo "2. Cortar el tráfico entrante hacia nuestro Servidor"
    echo "3. Salir"
    read -p "Elige una opción: " opcion
}

function cortar_trafico_saliente {
    read -p "Introduce el dominio web: " dominio
    ip=$(dig +short $dominio | head -n 1)
    if [ -z "$ip" ]; then
        echo "No se pudo resolver la IP del dominio $dominio"
    else
        sudo iptables -A OUTPUT -d $ip -j REJECT
        echo "Tráfico saliente hacia $dominio ($ip) cortado."
    fi
}

function cortar_trafico_entrante {
    read -p "Introduce la IP del Servidor: " ip
    sudo iptables -A INPUT -s $ip -j REJECT
    echo "Tráfico entrante desde $ip cortado."
}

while true; do
    mostrar_menu
    case $opcion in
        1)
            cortar_trafico_saliente
            ;;
        2)
            cortar_trafico_entrante
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, por favor intenta de nuevo."
            ;;
    esac
done
