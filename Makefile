.SILENT:

#VAR
VOLUMES = $(shell docker volume ls -q | wc -l)
CONTAINERS = $(shell docker ps -a -q | wc -l)
HOMEPATH = $(HOME)

#COLORS OUTPUTS
RED =`tput setaf 1`
GREEN =`tput setaf 2`
YELLOW =`tput setaf 3`
BLUE =`tput setaf 4`
CLEAR =`tput sgr0`

#RULES
all: compose-up

compose-up:
	@mkdir -p ${HOMEPATH}/data/wordpress ${HOMEPATH}/data/mariadb
	@docker-compose -f srcs/docker-compose.yml up -d --build
	@echo "${GREEN}Server ready to use. ${CLEAR}"

clean:
ifeq (${CONTAINERS}, 0)
	@echo "${RED}No container to delete.${CLEAR}"
else
	@docker-compose -f srcs/docker-compose.yml down
endif
ifeq (${VOLUMES}, 0)
	@echo "${RED}No volume to removed.${CLEAR}"
else
	@docker volume rm $(shell docker volume ls -q)
	@rm -rf ${HOMEPATH}/data/wordpress ${HOMEPATH}/data/mariadb
	@echo "${RED}${VOLUMES} volumes removed. ${CLEAR}"
endif
	@docker image prune -af
	@echo "${RED}Images removed. ${CLEAR}"

start:
	@docker-compose -f srcs/docker-compose.yml start
	@echo "${GREEN}Server started. ${CLEAR}"

stop:
	@docker-compose -f srcs/docker-compose.yml stop
	@echo "${GREEN}Server stopped. ${CLEAR}"

restart: stop start

re: clean compose-up
