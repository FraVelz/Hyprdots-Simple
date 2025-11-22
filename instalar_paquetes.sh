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
sudo pacman -Syu networkmanager
sudo pacman -S network-manager-applet

# Activando servicios de red
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
nmcli device status   # Para ver el estado de tus conexiones (en waybar)

echo ""
echo "¡Listo! Instalacion completa de paquetes nesesarios..."
echo ""

# Autor: Fravelz
