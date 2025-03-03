#!/bin/bash

function mostrar_menu {
    echo "1. Mostrar impresoras disponibles"
    echo "2. Ejecutar ges_user.sh"
    echo "3. Ejecutar red_scan.sh"
    echo "4. Ejecutar ges_firewall.sh"
    echo "5. Salir"
    read -p "Elige una opción: " opcion
}

function mostrar_impresoras {
    lpstat -p
}

while true; do
    mostrar_menu
    case $opcion in
        1)
            mostrar_impresoras
            ;;
        2)
            ./ges_user.sh
            ;;
        3)
            ./red_scan.sh
            ;;
        4)
            ./ges_firewall.sh
            ;;
        5)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, por favor intenta de nuevo."
            ;;
    esac
done