function menu {
    echo "1. Cortar el tráfico saliente hacia un dominio web"
    echo "2. Cortar el tráfico entrante hacia nuestro Servidor"
    echo "3. Salir"
    read -p "Elige una opción: " opcion
}

function dropOut {
    read -p "Dime el nombre del dominio: " d
    ip=$(dig +short $d)
    sudo iptables -A OUTPUT -d $ip -j DROP
    echo "Trafico saliente a $d cortado."
}

function dropIn {
    read -p "Dime la Ip a bloquear: " ip
    sudo iptables -A INPUT -d $ip -j DROP
    echo "Trafico entrante desde $ip cortado."
}

while true; do
    menu
    case $opcion in
        1)
            dropOut
            ;;
        2)
            dropIn
            ;;
        3)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida, por favor intenta de nuevo."
            ;;
    esac
done