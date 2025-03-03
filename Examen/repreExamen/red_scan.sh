function menu {
    echo "1. Almacenar conexiones en espera en el fichero salida.txt."
    echo "2. Mostrar IPs de conexiones web no seguras guardadas en salida.txt."
    echo "3. Mostrar contenido de salida.txt."
    echo "4. Detectar sistema operativo y puertos de los equipos 192.168.8.12 hasta el .23."
    echo "5. Mostrar información de un usuario."
    echo "6. Salir."
    read -p "Elige una opción: " opcion
}

function salida {
    sudo netstat -an | grep 'TIME_WAIT' > salida.txt
    echo "Las conexion en espera se han guardado en el fichero salida.txt."
}

function noSeg {
    cat salida.txt | grep ':80'
    echo "Estas son las conexiones no seguras guardadas en salida.txt"
}

function muestra {
    echo
    cat salida.txt
    echo
    echo "Este es el contenido del archivo salida.txt"
}

function infoSys {
    sudo nmap -sV -O 192.168.8.12-23
    echo "Mostrando información del rango de equipos 192.168.8.12 al 23."
}

function infoUs {
    read -p "Dame el nombre de usuario: " us
    echo "Mostrando información del usuario $us"
    finger $us
}

while true; do
    menu
    case $opcion in
        1)
            salida
            ;;
        2)
            noSeg
            ;;
        3)
            muestra
            ;;
        4)
            infoSys
            ;;
        5)
            infoUs $us
            ;;
        6)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no valida, por favor intenta de nuevo."
    esac
done