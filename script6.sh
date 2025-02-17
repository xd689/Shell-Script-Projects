#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Ejecutar Nload"
    echo "2. Ejecutar Iftop"
    echo "3. Ejecutar Slurm"
    echo "4. Redirigir la salida de netload a un fichero con la fecha actual"
    echo "5. Contar conexiones de una IP específica y mostrar detalles de los paquetes"
    echo "6. Salir"
    read -p "Opción: " opt

    case $opt in
        1)
            echo "Ejecutando Nload..."
            nload
            ;;
        2)
            echo "Ejecutando Iftop..."
            iftop
            ;;
        3)
            echo "Ejecutando Slurm..."
            slurm
            ;;
        4)
            echo "Redirigiendo la salida de netload a un fichero con la fecha actual..."
            output_file="netload_output_$(date +%F).txt"
            netload > "$output_file"
            echo "Salida de netload redirigida a $output_file."
            ;;
        5)
            read -p "Introduce la IP a consultar: " user_ip
            echo "Buscando conexiones realizadas por la IP $user_ip..."
            echo "Número de conexiones realizadas por la IP $user_ip:" > ip_connections.txt
            netstat -ant | grep "$user_ip" | wc -l >> ip_connections.txt
            echo "Detalles de los paquetes (Origen, Destino, Conexión exitosa):" >> ip_connections.txt
            netstat -ant | grep "$user_ip" >> ip_connections.txt
            echo "Salida redirigida a ip_connections.txt"
            cat ip_connections.txt
            ;;
        6)
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción del 1 al 6."
            ;;
    esac
done