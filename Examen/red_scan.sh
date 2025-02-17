#!/bin/bash

function mostrar_menu {
    echo "1. Almacenar conexiones TIME_WAIT en salida_red.txt"
    echo "2. Mostrar IPs de conexiones web no seguras"
    echo "3. Mostrar contenido de salida_red.txt"
    echo "4. Detectar sistema operativo y puertos de una red"
    echo "5. Mostrar información de un usuario"
    echo "6. Salir"
    read -p "Elige una opción: " opcion
}

function almacenar_time_wait {
    netstat -an | grep TIME_WAIT > salida_red.txt
    echo "Conexiones en espera almacenadas en salida_red.txt."
}

function mostrar_ips_no_seguros {
    grep -oP '(?<=^tcp\s+\d+\s+\d+\s+)[^:\s]+(?=:.*)' salida_red.txt | sort | uniq
}

function mostrar_contenido_fichero {
    cat salida_red.txt
}

function detectar_sistema_puertos {
    for i in $(seq 12 23); do
        ip="192.168.8.$i"
        echo "Escaneando $ip..."
        nmap -O -p 1-65535 $ip
    done
}

function mostrar_informacion_usuario {
    read -p "Introduce el nombre del usuario: " usuario
    id $usuario
}

while true; do
    mostrar_menu
    case $opcion in
        1)
            almacenar_time_wait
            ;;
        2)
            mostrar_ips_no_seguros
            ;;
        3)
            mostrar_contenido_fichero
            ;;
        4)
            detectar_sistema_puertos
            ;;
        5)
            mostrar_informacion_usuario
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, por favor intenta de nuevo."
            ;;
    esac
done
