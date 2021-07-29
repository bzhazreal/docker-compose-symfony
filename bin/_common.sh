#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Common vars
# -----------------------------------------------------------------------------

# Font
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

# -----------------------------------------------------------------------------
# Output methods.
# -----------------------------------------------------------------------------

function print_error() {
  printf "[${red}${bold}%s${reset}] - %s \n" "error" "$1"
}

function print_success() {
  printf "[${green}${bold}%s${reset}] - %s \n" "success" "$1"
}

function print_info() {
  printf "[${blue}${bold}%s${reset}] - %s \n" "info" "$1"
}
