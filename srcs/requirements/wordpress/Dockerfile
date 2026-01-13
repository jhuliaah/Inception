
FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y curl php-fpm php-mysqli

#ADD RIGHTS TO /run/php
RUN mkdir -p /run/php && chown www-data:www-data /run/php

#COPY WORDPRESS CONFIG AND SET THE WORK DIR
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
WORKDIR /var/www/html

#COPY SETUP SCRIPT AND ADD RIGHTS
COPY ./tools/wp_config.sh /usr/local/bin/wp_config.sh
RUN chmod +x /usr/local/bin/wp_config.sh

#SET PORTS 9000 LIKE SUBJECT ASK
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wp_config.sh"]
CMD ["php-fpm8.2", "-F"]