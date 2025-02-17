#!/bin/bash

#Solicitar al usuario nombre y contraseña del usuario a crear:
read -p "Introduce el nombre del usuario a crear: " user
read -s -p "Introduce la contraseña del usuario a crear: " pass
echo

#Crear el nuevo usuario con su contraseña:
sudo useradd -m "$usuario"
echo  "$user:$pass" | sudo chpasswd
echo "Usuario $usuario creado correctamente."