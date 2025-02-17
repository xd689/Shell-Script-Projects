#!/bin/bash

function mostrar_menu {
    echo "1. Crear usuario"
    echo "2. Modificar la contraseña del usuario"
    echo "3. Borrar un usuario"
    echo "4. Dar de alta usuarios desde fichero"
    echo "5. Salir"
    read -p "Elige una opción: " opcion
}

function crear_usuario {
    read -p "Introduce el nombre del usuario: " usuario
    read -s -p "Introduce la contraseña: " contrasena
    echo
    sudo useradd -m -p $(openssl passwd -1 $contrasena) $usuario
    echo "Usuario $usuario creado con éxito."
}

function modificar_contrasena {
    read -p "Introduce el nombre del usuario: " usuario
    read -s -p "Introduce la nueva contraseña: " contrasena
    echo
    echo "$usuario:$contrasena" | sudo chpasswd
    echo "Contraseña para $usuario modificada con éxito."
}

function borrar_usuario {
    read -p "Introduce el nombre del usuario: " usuario
    sudo userdel -r $usuario
    echo "Usuario $usuario borrado con éxito."
}

function dar_de_alta_desde_fichero {
    read -p "Introduce la ruta del fichero: " ruta_fichero
    while IFS=, read -r nombre dni password; do
        sudo useradd -m -p $(openssl passwd -1 $password) $nombre
        echo "Usuario $nombre creado con éxito."
    done < $ruta_fichero
}

while true; do
    mostrar_menu
    case $opcion in
        1)
            crear_usuario
            ;;
        2)
            modificar_contrasena
            ;;
        3)
            borrar_usuario
            ;;
        4)
            dar_de_alta_desde_fichero
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