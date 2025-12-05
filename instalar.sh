#!/bin/bash

echo -e "\n [+] Alerta: Este script de instalacion y configuracion de los hyprdots,"
echo "Configurara y modificara los archivos, del usuario actual de hyprdots."

read -p "Enter para continuar: "

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# En este apartado hay archivos comprimidos, porque son plugins de github para
# la terminal zsh. Este script los descomplime para su correcto funcionamiento.

# Si esto no queda correctamente configurado la terminal zsh no podra funcionar
# correctamente.

unzip ./home/.oh-my-zsh/custom/plugins/sh-autosuggestions.zip
unzip ./home/.oh-my-zsh/custom/plugins/sh-history-substring-search.zip
unzip ./home/.oh-my-zsh/custom/plugins/sh-syntax-highlighting.zip

rm ./home/.oh-my-zsh/custom/plugins/sh-autosuggestions.zip
rm ./home/.oh-my-zsh/custom/plugins/sh-history-substring-search.zip
rm ./home/.oh-my-zsh/custom/plugins/sh-syntax-highlighting.zip

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Aqui pide los permisos nesesarios antes de de editar las configuraciones 
# hyprdots actuales del usuario.

./permisos.sh

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Instala/Actualiza paquetes nesesarios que se utilizan para que el las 
# configuraciones hyprdots tengan un correcto funcionamiento.

./instalar_paquetes.sh

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Instala python y corre el script de python encargado de correr todas las 
# configuraciones nesesarias de hyprdots.

sudo pacman -S python

python actualizar.py

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #
# Autor: Fravelz
