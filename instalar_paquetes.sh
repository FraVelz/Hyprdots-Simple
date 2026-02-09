#!/bin/bash

set -euo pipefail

echo ""
echo " [+] Instalando paquetes necesarios..."
echo ""

# Lista de paquetes requeridos para las configuraciones de Hyprdots.
packages=(
	kitty
	fastfetch
	hyprpaper
	zsh
	nvim
	rofi
	ranger
	lsd
	bat
	wireplumber
	libnotify
	ttf-nerd-fonts-symbols
	networkmanager
	network-manager-applet
	networkmanager-openvpn
)

sudo pacman -Syu --needed "${packages[@]}"

# Activando servicios de red necesarios para NetworkManager.
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
nmcli device status   # Para ver el estado de tus conexiones (en waybar)

echo ""
echo "¡Listo! Instalacion completa de paquetes necesarios..."
echo ""

# Autor: Fravelz
