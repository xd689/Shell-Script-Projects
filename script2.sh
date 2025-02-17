#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Ejecutar Nload"
    echo "2. Ejecutar Iftop"
    echo "3. Ejecutar Slurm"
    echo "4. Redireccionar la salida de netload a un fichero con la fecha actual"
    echo "5. Salir"
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
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción del 1 al 5."
            ;;
    esac
done
