#!/usr/bin/env bash

source $(dirname $(realpath $0))/_common.sh

# -----------------------------------------------------------------------------
# Manage .env on project initialization.
#
# Check if .env file exist, if not create one from env.example.
# -----------------------------------------------------------------------------
function _manage_dotenv_file() {

  if [ ! -f .env ];then
    print_info "Create .env file"
    cp env.example .env

    if [ ! -f .env ];then
      print_error "Failed to create .env file"
      exit 1
    fi

    print_success "Dotenv has been created with success"
  else
    print_info "Dotenv already exist"
  fi

}

# -----------------------------------------------------------------------------
# Initialize symfony project.
# -----------------------------------------------------------------------------
function _initialize_symfony() {

  docker-compose exec php
}

# -----------------------------------------------------------------------------
# Main script entrypoint.
# -----------------------------------------------------------------------------
function main() {
  _manage_dotenv_file

  if [ ! -d ./symfony ];then
    mkdir ./symfony
    print_success "Symfony has been created with success."
  fi

  docker-compose pull
  docker-compose build
}

main