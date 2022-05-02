.SILENT:

#COLORS OUTPUTS
RED =`tput setaf 1`
GREEN =`tput setaf 2`
YELLOW =`tput setaf 3`
BLUE =`tput setaf 4`
CLEAR =`tput sgr0`

#ALIASES
CCFLAGS = -Wall -Wextra -Werror
RM = rm -rf

#PROJECT INFO
NAME = 42inception


#RULES
all:

clean:
	$(RM)

fclean: clean
	$(RM)

re: fclean newline all
