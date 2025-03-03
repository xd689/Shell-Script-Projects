function menu {
    echo "1. Crear usuario"
    echo "2. Modificar la contraseña del usuario"
    echo "3. Borrar un usuario"
    echo "4. Dar de alta usuarios desde fichero"
    echo "5. Salir"
    read -p "Elige una opción: " opcion
}

function crear_usuario {
    read -p "Dame el nombre de usuario a crear: " u
    read -sp "Dame la contraseña del usuario: " p
    sudo useradd -m $u
    echo
    echo "$u:$p" | sudo chpasswd
    echo "Usuario $u añadido al sistema."
}

function modificar_contrasena  {
    read -p "Dame el nombre de usuario a modificar: " mu
    read -sp "Dame la nueva contraseña: " mp
    echo
    echo "$mu:$mp" | sudo chpasswd
    echo "Usuario $mu modificado."
}

function borrar_usuario {
    read -p "Dame el nombre de usuario a borrar: " bu
    sudo deluser $bu
    echo "Usuario $bu borrado."
}

function dar_de_alta_desde_fichero {
    read -p "Dame el nombre del archivo: " a
    while IFS=',' read -r user pass
    do
        sudo useradd -m "$user"
        echo
        echo "$user:$pass" | sudo chpasswd
        echo "Usuario $user añadido al sistema."
    done < "$a"
}

while true; do
    menu
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