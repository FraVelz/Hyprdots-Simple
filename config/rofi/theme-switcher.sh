#!/bin/bash

# Mostrar Menu Rofi **************************************************

TEMAS="$HOME/.config/themes" # Directorio de temas

# Mostrar lista de temas disponibles con wofi
OPCIONES=$(mktemp)  # Crea un archivo temporal donde se guardarán las opciones.

for nombre in "$TEMAS"/*; do
    img="$nombre/hypr/wallpaper.jpg"

    # Escribe en el archivo: nombre + separadores especiales para rofi + icono.
    printf '%s\0icon\x1f%s\n' "$(basename "$nombre")" "$img" >> "$OPCIONES"
done

TEMA=$(cat "$OPCIONES" | rofi -i -dmenu -show-icons -theme ~/.config/rofi/styles/theme-switcher.rasi)

# Si el usuario cancela
[ -z "$TEMA" ] && exit 0

# Configuraciones de Actualizacion de Temas **************************

ELEGIDO="$TEMAS/$TEMA" # Directorio del tema elegido

# ******* Hyprland ******* #
cp $ELEGIDO/hypr/* $HOME/.config/hypr/

# Cambiar wallpaper
WALL="$ELEGIDO/hypr/wallpaper.jpg"
cat > $HOME/.config/hypr/hyprpaper.conf <<EOF
preload = $WALL
wallpaper = ,$WALL
EOF

# ******* Kitty ******* #
cp $ELEGIDO/kitty/* $HOME/.config/kitty/

# ******* Rofi-Style ******* #
#cp $ELEGIDO/rofi-style/* $HOME/.config/rofi/styles/

# ******* Waybar ******* #
cp $ELEGIDO/waybar/* $HOME/.config/waybar/

# Pasos Finales ******************************************************

# Recargar Hyprland y Hyprpaper, y waybar
killall waybar && waybar &
hyprctl reload
killall hyprpaper
hyprpaper & disown

notify-send "Tema cambiado a $TEMA"

# Autor: Fravelz
