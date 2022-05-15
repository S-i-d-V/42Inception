# Makefile rules :
- ### Build the server :
    > sudo make || sudo make compose-up
- ### Clear the server :
    > sudo make clean
- ### Re-build the server :
    > sudo make re
- ### Start the server :
    > sudo make start
- ### Stop the server :
    > sudo make stop
- ### Restart the server :
    > sudo make restart

# Access :
- ### URL :
    > https://ugtheven.42.fr
- ### WordPress admin logs :
    > username: wp_super | password: 123456

# Usefull sources :
- ## Docker/Docker compose:
    - https://docs.docker.com/compose/compose-file/compose-file-v3/#compose-file-structure-and-examples
    - ### Docker volumes :
        - https://docs.docker.com/storage/volumes/
        - https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes
        - https://docs.docker.com/compose/compose-file/compose-file-v3/#volume-configuration-reference
    - ### Docker Networks :
        - https://w3blog.fr/2016/09/20/docker-et-ses-networks/
    - ### Restart container on failure :
        - https://docs.docker.com/compose/compose-file/compose-file-v3/#restart
    - ### Utils :
        - https://wiki.bash-hackers.org/commands/builtin/exec

- ## Nginx :
    - ### FastCGI (php-fpm)
        - https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/
    

- ## MariaDB :
    - ### Installation / Configuration :
        - https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10
    - ### Make a SQL dump :
        - https://www.bg-coding.fr/fr/developpement/bases-de-donnees/sql/faire-un-dump-de-sa-base-de-donnees-mysql-ou-mariadb

- ## Wordpress :
    - ### Installation / Configuration :
        - https://www.hostinger.fr/tutoriels/wp-cli#Etape_3_-_Utilisation_de_WP-CLI_pour_installer_WordPress

