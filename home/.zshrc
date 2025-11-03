export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

ENABLE_CORRECTION="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Pronmpt configuration

function dir_icon {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{black}%f%b"
	else
		echo "%B%F{cyan}%f%b"
	fi
}

function parse_git_branch {
	local branch
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [ -n "$branch" ]; then
		echo " [$branch]"
	fi
}

# Agregar target (ip victima) a el waybar (por medio del archivo)

function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/fravelz/.config/bin/target
}

# Limpiar target (ip victima) a el waybar (por medio del archivo)

function cleartarget(){
    echo '' > /home/fravelz/.config/bin/target
}

# Eliminar para que sea inrrecuperable
rmk(){
  if [ -z "$1" ]; then
    echo "Uso: rmk <ruta> [--yes]"
    return 1
  fi

  target="$1"
  force=false
  [ "$2" = "--yes" ] && force=true

  if [ ! -e "$target" ]; then
    echo "Error: '$target' no existe."
    return 1
  fi

  echo "ADVERTENCIA: Esta operación es IRREVERSIBLE. Se intentará sobrescribir y eliminar: $target"
  if ! $force; then
    read -p "¿Continuar? (y/N): " ans
    case "$ans" in
      y|Y) ;;
      *) echo "Abortado."; return 1;;
    esac
  fi

  # helper para sobrescribir un archivo
  secure_wipe_file(){
    f="$1"
    if command -v scrub >/dev/null 2>&1; then
      scrub -p dod "$f"
    fi

    if command -v shred >/dev/null 2>&1; then
      shred -zun 10 -v "$f" 2>/dev/null || true
    elif command -v wipe >/dev/null 2>&1; then
      wipe -q "$f"
    else
      # fallback: 1 pass con zeros (no es tan seguro, pero algo)
      dd if=/dev/zero of="$f" bs=1M count=1 conv=notrunc >/dev/null 2>&1 || true
    fi

    # intentar borrar el fichero
    rm -f -- "$f"
  }

  # Si es un directorio, iterar archivos dentro
  if [ -d "$target" ]; then
    echo "Procesando directorio: $target"
    # Primero tratar archivos regulares
    find "$target" -type f -print0 | while IFS= read -r -d '' file; do
      echo "Wiping: $file"
      secure_wipe_file "$file"
    done

    # Opcional: borrar ficheros especiales y luego el directorio
    find "$target" -depth -mindepth 1 -print0 | tac -s '' | xargs -0 -r rm -rf --
    # Finalmente intentar borrar el directorio raíz
    rm -rf -- "$target"
  else
    # archivo
    secure_wipe_file "$target"
  fi

  echo "Operación completada. Nota: en SSDs, sistemas con journaling o con snapshots este método puede no ser totalmente efectivo."
}

# Otros

PROMPT='%F{cyan}󰣇 %f %F{magenta}%n%f $(dir_icon) %F{red}%~%f%${vcs_info_msg_0_} %F{yellow}$(parse_git_branch)%f %(?.%B%F{green}.%F{red})%f%b '

export PATH="$HOME/.config/bin:$PATH:/opt/nvim/nvim-linux-x86_64/bin"

alias cat='bat'
alias ls='lsd'

fastfetch

# Autor: Fravelz
