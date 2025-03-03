function menu() {
    echo "Opcion 1 Gestión de usuarios."
    echo "Opcion 2 Escaneo de redes."
    echo "Opcion 3 Gestión del firewall."
    echo "Opcion 4 Mostrar las impresoras disponibles en red."
    echo "Opcion 5 Salir."
    read -p "Escoge una opción: " opcion
}

function lpStat {
    lpstat -p 
    echo "Mostrando impresoras disponibles."
}

while true; do
    menu
    case $opcion in
        1)
            bash ges_user.sh
            ;;
        2)
            bash red_scan.sh
            ;;
        3)
            bash ges_firewall.sh
            ;;
        4)
            lpStat
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