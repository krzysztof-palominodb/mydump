#!/bin/sh

DIR_BACKUP=/data2
DB_NAME=database_name
DB_USER=
DB_PASS=
DB_HOST=localhost
THREADS=4

DOW=`date "+%a"`
DB_DUMP=$DIR_BACKUP/dbdump.$DOW

mysqldump -R --no-data --all-databases -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} > ${DIR_BACKUP}/db_schema.sql
mysqldump -R mysql > ${DIR_BACKUP}/db_mysql.sql

/root/mydumper/mydumper \
  --host=$DB_HOST \
  --user=$DB_USER \
  --password=$DB_PASS \
  --outputdir=$DB_DUMP \
  --rows=500000 \
  --build-empty-files \
  --no-schemas \
  --threads=$THREADS
