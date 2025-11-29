#!/bin/bash

echo ""
echo " [+] Instalando paquetes nesesarios..."
echo ""

# 1. Para la terminal (kitty, zsh)
# 2. informacion del sistema por consola (fastfetch) 
# 3. fondo de pantalla (hyprpaper)
# 4. pantalla de bloque (hyprlock)
# 5. Editor de codigo/texto (nvim)
# 6. Secciones y menus (rofi)
# 7. Gestor de archivos por consola (ranger)
# 8. Listar directorios con mejor formato (lsd)
# 9. Visualizar archivos con mejor formato (bat) 
# 10. Gestor de audio en la waybar (iwreplumber)
# 11. Fuentes y simbolos utilizados en la terminal y en la waybar (ttf-nerd-fonts-symbols)
# 12. Controladores de red (networkmanager por consola, network-manager-apple interfaz grafica mas
#     comoda y rapida, networkmanager-openvpn para el manejo de conexiones vpn)

sudo pacman -S kitty fastfetch hyprpaper zsh nvim rofi ranger lsd bat wireplumber libnotify
sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -Syu networkmanager
sudo pacman -S network-manager-applet networkmanager-openvpn

# Activando servicios de red
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
nmcli device status   # Para ver el estado de tus conexiones (en waybar)

echo ""
echo "¡Listo! Instalacion completa de paquetes nesesarios..."
echo ""

# Autor: Fravelz
