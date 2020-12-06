#!/bin/bash

echo "Populating characters table"
oc exec deployment.apps/postgresql-persistent -i redhat123 -- /usr/bin/psql -U redhat persistentdb < /home/student/DO280/labs/install-storage/init_data.sql

