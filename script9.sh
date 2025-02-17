#!/bin/bash

crear_usuario() {
    read -p "Introduce el nombre de usuario: " usuario
    read -s -p "Introduce la contraseña: " contrasena
    echo
    sudo useradd -m "$usuario"
    echo "$usuario:$contrasena" | sudo chpasswd
    echo "Usuario $usuario creado con éxito."
}

modificar_contrasena() {
    read -p "Introduce el nombre de usuario: " usuario
    read -s -p "Introduce la nueva contraseña: " contrasena
    echo
    echo "$usuario:$contrasena" | sudo chpasswd
    echo "Contraseña de $usuario modificada con éxito."
}

borrar_usuario() {
    read -p "Introduce el nombre de usuario: " usuario
    sudo userdel -r "$usuario"
    echo "Usuario $usuario borrado con éxito."
}

mostrar_informacion() {
    read -p "Introduce el nombre de usuario: " usuario
    finger "$usuario"
}

anadir_a_grupo() {
    read -p "Introduce el nombre de usuario: " usuario
    read -p "Introduce el nombre del grupo: " grupo
    sudo usermod -aG "$grupo" "$usuario"
    echo "Usuario $usuario añadido al grupo $grupo con éxito."
}

while true; do
    echo "Menu:"
    echo "1. Crear usuario"
    echo "2. Modificar la contraseña del usuario"
    echo "3. Borrar un usuario"
    echo "4. Mostrar información de un usuario"
    echo "5. Añadir un usuario a un grupo"
    echo "6. Salir"
    read -p "Selecciona una opción: " opcion

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
            mostrar_informacion
            ;;
        5)
            anadir_a_grupo
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, intenta de nuevo."
            ;;
    esac
done
