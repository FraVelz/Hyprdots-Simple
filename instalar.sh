#!/bin/bash

set -euo pipefail

echo -e "\n [+] Alerta: Este script de instalacion y configuracion de los hyprdots,"
echo "Configurara y modificara los archivos, del usuario actual de hyprdots."

read -p "Enter para continuar: "

if ! command -v unzip >/dev/null 2>&1; then
	echo " [!] Necesitas instalar 'unzip' antes de continuar."
	exit 1
fi

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# En este apartado hay archivos comprimidos, porque son plugins de github para
# la terminal zsh. Este script los descomprime para su correcto funcionamiento.

plugins=(
	"zsh-autosuggestions"
	"zsh-history-substring-search"
	"zsh-syntax-highlighting"
)

for plugin in "${plugins[@]}"; do
	zip_path="./home/.oh-my-zsh/custom/plugins/${plugin}.zip"
	if [ -f "$zip_path" ]; then
		unzip -o "$zip_path" -d "./home/.oh-my-zsh/custom/plugins/"
		rm -f "$zip_path"
	else
		echo " [!] Archivo ${plugin}.zip no encontrado, omitiendo."
	fi
done

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Aqui pide los permisos necesarios antes de editar las configuraciones 
# hyprdots actuales del usuario.

./permisos.sh

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Instala/Actualiza paquetes necesarios que se utilizan para que las 
# configuraciones hyprdots tengan un correcto funcionamiento.

./instalar_paquetes.sh

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #

# Instala python y corre el script encargado de aplicar todas las 
# configuraciones necesarias de hyprdots.

sudo pacman -S --needed python

python actualizar.py

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #
# Autor: Fravelz
