# Hyprdots-Simple

Configuraciones simplificadas de Hyprland, Waybar, Kitty, Neovim y utilidades
relacionadas. Este repositorio incluye los puntos de configuración listos para
copiar en `~/.config` y en el directorio home del usuario.

## Requisitos

- Arch Linux o derivado compatible con `pacman`
- Usuario con acceso a `sudo`
- Conexión a Internet para la instalación de paquetes

## Scripts disponibles

- `instalar.sh`: automatiza la instalación de dependencias, ajusta permisos y
  aplica las configuraciones.
- `instalar_paquetes.sh`: instala los paquetes necesarios definidos en `pacman`.
- `permisos.sh`: alinea los permisos de `~/.config` con el usuario actual.
- `actualizar.py`: sincroniza los archivos de `config/` y `home/` con tu
  entorno local.

## Uso rápido

1. Clona o descarga el repositorio.
2. Vuelve ejecutables los scripts: `chmod +x *.sh`.
3. Ejecuta `./instalar.sh` y sigue las instrucciones en pantalla.

## Configuraciones incluidas

- **Hyprland**: aplica diseño `dwindle`, bordes degradados y animaciones suaves; declara variables Wayland para Firefox, Qt, SDL y fija cursor a 20px; arranca `hyprpaper`, `nm-applet`, `waybar` y el script de Rofi que abre Firefox y Kitty; atajos destacados `Super+Enter` (Kitty), `Super+F` (Firefox), `Super+D` (launcher de apps), `Super+Q` (menú de apagado), `Super+W` (selector de fondo) y `Super+Alt+H/J/K/L` para mover ventanas flotantes a saltos grandes. Nota: para compatibilidad con Hyprland reciente se usa `windowrulev2` en reglas tipo `suppressevent`.
- **Waybar**: barra superior con grupos de módulos para workspaces, bandeja, estado VPN y reloj centrado; integra scripts personalizados (`ip.sh`, `target.sh`, `vpn-status.sh`) y controles de brillo, audio y temperatura; botones de reproductor y acceso directo a `pavucontrol` mediante clic.
- **Kitty**: usa JetBrainsMono Nerd Font a 14pt con emojis Noto, esquema de color `colors.ini` inspirado en Tokyonight y cursor haz; incluye buffers de copia en `F1`–`F4`, navegación entre ventanas con `Ctrl+Arrow`, nuevos tabs con `Ctrl+Shift+T` y tab bar estilo powerline.
- **Rofi**: colección de scripts (`selector-app.sh`, `power-menu.sh`, `wallpaper-switcher.sh`, `menu-iconos.sh`, `mode-hacker.sh`) más un autostart que distribuye Firefox y Kitty en los primeros workspaces; estilos `.rasi` personalizados en `config/rofi/styles`.
- **Neovim**: basado en NvChad 2.5 gestionado por `lazy.nvim`; habilita números relativos, menús contextuales de `nvzone/menu`, salida rápida de cualquier modo con `zx` y navegación entre ventanas con `<C-h>/<C-l>`; keymap `<C-t>` abre el menú radial de NvChad.
- **Shell Zsh**: incluye Oh My Zsh preconfigurado en `home/.oh-my-zsh`. El `.zshrc` usa plugins nativos de OMZ y carga plugins externos como `zsh-autosuggestions` y `zsh-syntax-highlighting` solo si están instalados; `instalar.sh` descomprime los plugins empaquetados en `home/.oh-my-zsh/custom/plugins/`.

## Notas importantes

- Respaldar tu configuración antes de ejecutar los scripts es altamente
  recomendable; los archivos existentes se reemplazarán.
- Los plugins de Zsh se descomprimen automáticamente durante la instalación.
- Tras la instalación, puedes volver a ejecutar `python actualizar.py` cuando
  hagas cambios en este repositorio y quieras aplicarlos en tu entorno.