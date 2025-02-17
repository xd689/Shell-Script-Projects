#!/bin/bash

while true; do
    echo "Menu:"
    echo "1. Mostrar estado de los puertos y protocolos"
    echo "2. Mostrar hosts activos en la red"
    echo "3. Identificar sistemas operativos de los hosts"
    echo "4. Guardar información en salida_host.txt"
    echo "5. Buscar información sobre un host específico (se recopila en salida_host.txt)"
    echo "6. Salir"
    read -p "Selecciona una opción: " opcion

    if [ "$opcion" -eq 1 ]; then
        echo "Escaneando puertos y protocolos de los hosts en la red..."
        nmap -sT -p- > estado_puertos.txt
        echo "Información sobre el estado de los puertos guardada en estado_puertos.txt"
    elif [ "$opcion" -eq 2 ]; then
        echo "Escaneando hosts activos en la red..."
        nmap -sn 192.168.1.0/24 > hosts_activos.txt
        echo "Información sobre los hosts activos guardada en hosts_activos.txt"
    elif [ "$opcion" -eq 3 ]; then
        echo "Identificando sistemas operativos de los hosts en la red..."
        nmap -O 192.168.1.0/24 > sistemas_operativos.txt
        echo "Información sobre los sistemas operativos guardada en sistemas_operativos.txt"
    elif [ "$opcion" -eq 4 ]; then
        echo "Guardando información en salida_host.txt..."
        cat estado_puertos.txt sistemas_operativos.txt > salida_host.txt
        echo "Información de puertos y sistemas operativos guardada en salida_host.txt"
    elif [ "$opcion" -eq 5 ]; then
        read -p "Introduce la IP del host que deseas buscar: " ip
        grep "$ip" salida_host.txt > informacion_$ip.txt
        echo "Información relativa al host $ip guardada en informacion_$ip.txt"
    elif [ "$opcion" -eq 6 ]; then
        echo "Saliendo..."
        exit 0
    else
        echo "Opción inválida. Por favor, intenta de nuevo."
    fi
done
