#!/usr/bin/env python

import subprocess
import shutil
import os

'''
Script para actualizar las configuraciones de Hyprdots en Arch Linux,
todas las configuraciones establecidas en este repositorio modificaran
las configuraciones actuales del usuario, unicamente del usuario
actual si cambias de usuario no verás los cambios.

Los archivos son para modificar las configuraciones de /home/usuario y
/home/usuario/.config/

El script elimina las carpetas (mensionadas en el readme.md) en 
~/.config/ y las reemplaza por las nuevas de este repositorio.

Tambien sobrescribe los archivos en el home desde Hyprdots/home/.
Finalmente, recarga el entorno y notifica al usuario.
'''

# Definir rutas ******************************************************

ruta_actual = os.path.dirname(os.path.abspath(__file__))
ruta_usuario = os.path.expanduser("~")

config = os.listdir(f'{ruta_actual}/config')
home = os.listdir(f'{ruta_actual}/home')

# Confirmacion del usuario *******************************************

print('\n [!] Este script eliminara las carpetas antiguas de las configuraciones y las reemplazara por las nuevas.')
print(' [!] Asegurate de haber respaldado cualquier cambio local antes de continuar.')

try:
    input(' [!] Presiona Enter para continuar o Ctrl+C para cancelar...')

except KeyboardInterrupt:
    print('\n\n [!] Proceso de actualizacion cancelado por el usuario.\n')
    exit()

print('\n [!] Iniciando proceso de actualizacion...')

# Eliminar carpetas antiguas y crear nuevas **************************

for e_config in config:
    carpeta = os.path.expanduser(f'{ruta_usuario}/.config/{e_config}')

    # Borrar la carpeta (como rm -rf)
    if os.path.exists(carpeta):
        shutil.rmtree(carpeta, ignore_errors=True)

    # Volver a crearla vacía
    os.makedirs(carpeta)

print('\n [+] Carpetas eliminadas, ejecutando creacion de carpetas...')

# Pasar nuevas configuraciones ***************************************

for e_config in config:

    # Copiar la carpeta desde Hyprdots/config/<> a home/<user>/.config/<>
    shutil.copytree(
        f'{ruta_actual}/config/{e_config}',
        f'{ruta_usuario}/.config/{e_config}',
        dirs_exist_ok=True
    )

# Sobrescribir archivos en el home ***********************************

print('\n [+] Carpetas creadas, ejecutando actualizacion/creacion archivos en el home...')

for e_home in home:
    archivo_origen = f'{ruta_actual}/home/{e_home}'
    archivo_destino = f'{ruta_usuario}/{e_home}'

    # Si ya existe el archivo, eliminarlo antes de copiar
    if os.path.exists(archivo_destino):
        os.remove(archivo_destino)

    # Copiar el archivo desde Hyprdots al home
    shutil.copy2(archivo_origen, archivo_destino)

print('\n [+] Configuraciones actualizadas, recargando entorno...')

# Recargar entorno y notificar al usuario ****************************

recargar_e_informar = [
    "killall waybar && waybar &",
    "hyprctl reload",
    "killall hyprpaper",
    "hyprpaper & disown",
    'notify-send "Hyprdots: Actualizacion completada con exito!"'
]

# Ejecutar cada comando
for comando in recargar_e_informar: 
    subprocess.run(comando, shell=True)

print('\n [!] Proceso de actualizacion finalizado. \n')

# Autor: Fravelz
