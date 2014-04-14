#!/bin/sh

DIR_BACKUP=/data2
DB_NAME=database_name
DB_USER=
DB_PASS=
DB_HOST=localhost
THREADS=8

DOW=`date "+%a"`
#DB_DUMP=$DIR_BACKUP/dbdump.$DOW

DB_DUMP=$DIR_BACKUP/dbdump.Thu

mysql -h ${DB_HOST} < ${DIR_BACKUP}/db_schema.sql
mysql mysql -h ${DB_HOST} < ${DIR_BACKUP}/db_mysql.sql

/root/mydumper/myloader \
  --directory=$DB_DUMP \
  --threads=$THREADS \
  --verbose=3
