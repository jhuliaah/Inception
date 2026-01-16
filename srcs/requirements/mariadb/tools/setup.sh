#!/bin/bash
set -e
if [ -f /entrypoint-initdb.d/init.sql.template ]; then
    # Substitute the variables and generates the final SQL archive
    envsubst < /entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
    # Removes the template
    rm /entrypoint-initdb.d/init.sql.template
fi

# Init the main service (MariaDB) like PID 1
exec "$@"
