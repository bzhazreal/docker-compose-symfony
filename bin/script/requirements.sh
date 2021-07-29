#!/usr/bin/env bash

source $(dirname $(realpath $0))/../_common.sh

# -----------------------------------------------------------------------------
# List of required package.
# -----------------------------------------------------------------------------
REQUIRED_PACKAGE=(
  "docker"
  "docker-compose"
)

# -----------------------------------------------------------------------------
# Check if a command exist.
#
# Return :
#
# O if command doesn´t exist
# 1 if command exist
# -----------------------------------------------------------------------------
function _command_exist() {

    local r=$(command -v "$1")

    if [[ -z $r ]]; then
        echo 0
    else
        echo 1
    fi

}

# -----------------------------------------------------------------------------
# Main script entrypoint.
# -----------------------------------------------------------------------------
function main() {

  for el in "${REQUIRED_PACKAGE[@]}";do

    if [[ $(_command_exist $el) -eq 1 ]];then
      print_success "Command $el exist"
    else
      print_error "Command $el does not exist"
    fi

  done
}

main