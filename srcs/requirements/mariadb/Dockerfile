
FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client gettext-base

#EXPOSE PORT 3306 LIKE SUBJECT ASK AND COPY MARIADB CONFIG
EXPOSE 3306
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /entrypoint-initdb.d
COPY ./tools/init.sql.template /entrypoint-initdb.d/
RUN mkdir -p /run/mysql && chown -R mysql:mysql /run/mysqld

#COPY ENTRYPOINT AND ADD EXECUTION PERMISSIONS
COPY ./tools/entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["mariadb", "--user=mysql", "--bind-address=0.0.0.0"]

