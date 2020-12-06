#!/bin/bash

echo "Populating characters table"
oc exec deployment.apps/db-storage-demo -i redhat123 -- /usr/bin/psql -U redhat demodb < /home/student/DO280/labs/install-storage/init_data.sql

