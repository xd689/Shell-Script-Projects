function menu() {
    echo "1. Mostrar información de un usuario."
    echo "2. Mostrar los usuarios del sistema, se guardaran en el fichero usur.txt"
    echo "3. Salir."
    read -p "Elige una opción: " opcion
}

function infUs() {
    read -p "Dime el usuario: " usu
    echo "Información de $usu :"
    sudo getent passwd $usu
}

function sysUs() {
    echo "Guardando los usuarios del sistema ..."
    sudo awk -F':' '{ print $1}' /etc/passwd > usur.txt
    echo "Nombres de los usuarios guardados en usur.txt"
}

while true; do
    menu
    case $opcion in
        1)
            infUs
            ;;
        2)
            sysUs
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
    esac
done