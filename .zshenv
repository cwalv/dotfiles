# Basically just a stub to load the file in "${ZDOTDIR}/.zshenv"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=${HOME}/.config}"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

source "${ZDOTDIR}/.zshenv"
