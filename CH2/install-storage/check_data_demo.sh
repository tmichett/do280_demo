#!/bin/bash

echo "Checking characters table"

if [ "$(oc get pods -o name -l deployment=db-storage-demo)" != "" ]
then
  APP="deployment/db-storage-demo"
elif [ "$(oc get pods -o name -l deployment=db-storage-demo2)" != "" ]
then
  APP="deployment/db-storage-demo2"
else
  echo "ERROR: deployment/db-storge-demo not found"
  echo "ERROR: deployment/db-storage-demo2 not found"
fi

if [ -n "${APP}" ]
then
  if [[ "$(oc exec ${APP} -i redhat123 -t -- /usr/bin/psql -U redhat demodb -c '\d characters' 2>&1)" != *"exit code 1"* ]]
  then
    OUTPUT=$(oc exec ${APP} -i redhat123 -t -- /usr/bin/psql -U redhat demodb -c 'select id,name,nationality from characters' 2>&1)
  fi
fi

if [ -n "${OUTPUT}" ]
then
  echo "${OUTPUT}"
else
  echo "ERROR: 'characters' table does not exist"
fi
