#!/bin/bash

while true; do
    echo "Seleccione una opción:"
    echo "1. Guardar historial de comandos"
    echo "2. Mostrar el contenido del fichero"
    echo "3. Ejecutar el script crear_usuario.sh"
    echo "4. Mostrar el contenido de la carpeta personal"
    echo "5. Salir"
    read -p "Opción: " opt

    case $opt in
        1)
            echo "Introduce el nombre del fichero para guardar el historial de comandos: "
            read filename
            history > "$filename"
            echo "Historial guardado en el fichero $filename."
            ;;
        2)
            echo "Introduce el nombre del fichero para mostrar el contenido: "
            read filename
            if [ -f "$filename" ]; then
                echo "Contenido del fichero $filename: "
                cat "$filename"
            else
                echo "El fichero $filename no existe."
            fi
            ;;
        3)
            echo "Lanzando el script crear_usuario.sh..."
            bash crear_usuario.sh
            ;;
        4)
            echo "Contenido de tu carpeta personal: "
            ls -la ~
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
