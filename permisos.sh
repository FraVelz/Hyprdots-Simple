#!/bin/bash

echo ""
echo " [+] Obteniendo Permisos de .config..."
echo ""

# ruta actual
ruta="$HOME/Documentos/Hyprdots"

# hyprland
sudo chown -R fravelz:fravelz ~/.config/hypr
echo -e " [+] Hypland Listo!!! \n"

# Temas
sudo chown -R fravelz:fravelz ~/.config/themes
echo -e " [+] Temas Listo!!! \n"

# bin
sudo chown -R fravelz:fravelz ~/.config/bin
echo -e " [+] Bin Listo!!! \n"

# waybar
sudo chown -R fravelz:fravelz ~/.config/waybar
echo -e " [+] Waybar Listo!!! \n"

# nvim
sudo chown -R fravelz:fravelz ~/.config/nvim
echo -e " [+] Nvim Listo!!! \n"

# kitty
sudo chown -R fravelz:fravelz ~/.config/kitty
echo -e " [+] Kitty Listo!!! \n"

# fondos de pantalla (wallpapers)
sudo chown -R fravelz:fravelz ~/.config/wallpapers
echo -e " [+] Wallpapers Listo!!! \n"

# fastfetch
sudo chown -R fravelz:fravelz ~/.config/fastfetch
echo -e " [+] Fastfetch Listo!!! \n"

echo ""
echo "¡Listo! Permisos Obtenidos..."
echo ""

# Autor: Fravelz
