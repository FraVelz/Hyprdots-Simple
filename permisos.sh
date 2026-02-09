#!/bin/bash

set -euo pipefail

echo ""
echo " [+] Obteniendo Permisos de .config..."
echo ""

user_name=$(whoami)
group_name=$(id -gn "$user_name")

declare -A config_targets=(
	[hypr]="Hyprland"
	[themes]="Temas"
	[bin]="Bin"
	[waybar]="Waybar"
	[nvim]="Nvim"
	[kitty]="Kitty"
	[wallpapers]="Wallpapers"
	[fastfetch]="Fastfetch"
)

for folder in "${!config_targets[@]}"; do
	target_path="$HOME/.config/$folder"
	if [ -e "$target_path" ]; then
		sudo chown -R "$user_name:$group_name" "$target_path"
		echo -e " [+] ${config_targets[$folder]} Listo!!! \n"
	else
		echo -e " [!] Carpeta $target_path no existe, omitiendo... \n"
	fi
done

echo ""
echo "¡Listo! Permisos Obtenidos..."
echo ""

# Autor: Fravelz
