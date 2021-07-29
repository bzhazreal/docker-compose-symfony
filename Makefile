export UID 	= $(shell id -u)
export GID 	= $(shell id -g)

default: help

# -----------------------------------------------------------------------------
# General commands
# -----------------------------------------------------------------------------

##
## help                     : Display makefile help.
.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<



# -----------------------------------------------------------------------------
# Container commands
# -----------------------------------------------------------------------------

##
## check-requirements       : Check local requirements
##                          This stack require docker and docker-compose.
.PHONY: check-requirements
check-requirements:
	bash ./bin/script/requirements.sh

##
## setup                    : Setup all project.
.PHONY: setup
setup:
	bash ./bin/script/setup.sh

##
## up                       : Start container
.PHONY: up
up:
	docker-compose up -d --remove-orphans

##
## up                       : Stop all containers
.PHONY: stop
stop:
	docker-compose stop

##
## shell                    : Enter in container.
##                          Argument :
##                          <docker-compose container name>
##                          Example :
##                          make shell php
.PHONY: shell
shell:
	docker-compose exec $(filter-out $@,$(MAKECMDGOALS)) sh

##
## shell-npm                : Enter in npm container interactive shell
.PHONY: shell-npm
shell-npm:
	docker-compose run npm bash

# -----------------------------------------------------------------------------
# Symfony installation commands
# -----------------------------------------------------------------------------

##
## install-symfony          : Install symfony in symfony directory.
##                          Correspond to a classique installation.
.PHONY: install-symfony
install-symfony:
	docker-compose exec php symfony new project --dir=. --no-git

##
## install-symfony-full     : Install a full symfony website in symfony
##                          directory.
##                          Correspond to a --full installation.
.PHONY: install-symfony-full
install-symfony-full:
	docker-compose exec php symfony new project --full --dir=. --no-git
