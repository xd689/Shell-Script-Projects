function menu {
    echo "1. Almacenar conexiones TIME_WAIT en el fichero salida.txt."
    echo "2. Mostrar IPs de conexiones web no seguras"
    echo "3. Detectar sistema operativo y puertos de un rango de IPs."
    echo "4. Salir"
    read -p "Elige una opción: " opcion
}

function salida() {
    echo "Realizando un escaneo de red y guardando conexiones en espera..."
    sudo netstat -an | grep 'TIME_WAIT' > salida.txt
    echo "La informacion se ha guardado en el fichero salida.txt"
}

function noSec() {
    echo "Realizando un escaneo de red y guardando conexiones no seguras..."
    sudo netstat -an | grep ':80' > salida.txt
    echo "La informacion se ha guardado en el fichero salida.txt"
}

function nMap() {
    echo "Escaneando equipos en red..."
    for i in $(seq 12 23); do
        ip="192.168.8.$i"
        echo "Escaneando $ip..."
        nmap -FO $ip
    done
}

while true; do
    menu
    case $opcion in
        1)
            salida
            ;;
        2)
            noSec
            ;;
        3)
            nMap
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;
    esac
done