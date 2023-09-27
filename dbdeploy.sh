#!/bin/bash

name=$1
user_name=$2
password=$3

rm -r /srv/readresolve.tech/$name/db/*
echo "db cleared"

cd /var/lib/jenkins/workspace/itp3-$name-db
pwd
cp -r $name-db/. /srv/readresolve.tech/$name/db
echo 'db imported from workspace'

cd /srv/readresolve.tech/$name/db

psql postgresql://$user_name:$password@localhost:5432 <<EOF
\i  schema.ddl.sql 
\q
EOF
echo "The schema created for this  database"

if [ -f "data.dml.sql" ]
then
        psql postgresql://$user_name:$password@localhost:5432 <<EOF
        \i  data.dml.sql 
        select * from aspects;
        \q
EOF
        echo "The schema created for this  database"

else
    echo "data.sql does not exist"
fi