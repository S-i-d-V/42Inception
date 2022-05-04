.SILENT:

#VAR
VOLUMES = $(shell docker volume ls -q | wc -l)
CONTAINERS = $(shell docker ps -a -q | wc -l)

#COLORS OUTPUTS
RED =`tput setaf 1`
GREEN =`tput setaf 2`
YELLOW =`tput setaf 3`
BLUE =`tput setaf 4`
CLEAR =`tput sgr0`

#RULES
all: compose-up

compose-up:
	@mkdir -p ~/data/wp ~/data/db
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
	@sudo rm -rf ~/data/wp ~/data/db
	@echo "${RED}${VOLUMES} volumes removed. ${CLEAR}"
endif

fclean: clean
	@docker image prune -af
	@echo "${RED}Images removed. ${CLEAR}"

re: fclean compose-up
