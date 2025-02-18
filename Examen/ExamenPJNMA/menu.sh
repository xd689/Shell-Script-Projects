function menu() {
    echo "Opcion 1 Red."
    echo "Opcion 2 Seguridad."
    echo "Opcion 3 Gestión de usuarios."
    echo "Opcion 4 Salir."
    read -p "Escoge una opción: " opcion
}

while true; do
    menu
    case $opcion in
        1)
            ./red_scan.sh
            ;;
        2)
            ./firewall.sh
            ;;
        3)
            ./ges_usu.sh
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;
    esac
done