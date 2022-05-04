#!/bin/bash
wget https://fr.wordpress.org/latest-fr_FR.tar.gz
mkdir -p var/www/
tar xfC latest-fr_FR.tar.gz /var/www/ && rm -rf latest-fr_FR.tar.gz