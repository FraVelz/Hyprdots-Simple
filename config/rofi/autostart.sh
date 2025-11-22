#!/bin/bash

sleep 1
hyprctl dispatch workspace 1 && firefox &

sleep 1
hyprctl dispatch workspace 2 && kitty &

# Autor: Fravelz
