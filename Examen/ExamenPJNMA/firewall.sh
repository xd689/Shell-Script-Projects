function menu() {
    echo "1. Bloquear paquetes salientes hacia google de un equipo."
    echo "2. Rechazar paquetes entrantes a la red"
    echo "3. Salir."
    read -p "Elige una opción: " opcion
}

function google() {
    echo "Dime la ip: " ip
    sudo iptables -A OUTPUT -d $ip -j REJECT
    echo "Trafico saliente del equipo cortado."
}

function inp() {
    echo "Denegando paquetes entrantes"
    iptables -A INPUT -i lo -j REJECT
}


while true; do
    menu
    case $opcion in
        1)
            google
            ;;
        2)
            inp
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
    esac
done