#!/bin/bash
set -e

host="db"
port="3306"

echo "Waiting for MySQL to be ready..."

until mysqladmin ping -h"$host" -P"$port" --silent; do
  echo "MySQL is unavailable - sleeping"
  sleep 5
done

echo "MySQL is up - starting Tomcat"
exec $CATALINA_HOME/bin/catalina.sh run
