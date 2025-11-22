#!/bin/bash

echo ""
echo " [+] Instalando paquetes nesesarios..."
echo ""


# 1. terminal (kitty)
# 2. informacion del sistema por consola (fastfetch) 
# 3. fondo de pantalla (hyprpaper)
# 4. zsh
# ...

sudo pacman -S kitty fastfetch hyprpaper zsh hyprlock nvim rofi ranger lsd bat wireplumber
sudo pacman -S ttf-nerd-fonts-symbols

echo ""
echo "¡Listo! Instalacion completa de paquetes nesesarios..."
echo ""

# Autor: Fravelz
