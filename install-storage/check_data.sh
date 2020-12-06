#!/bin/bash

echo "Checking characters table"

if [ "$(oc get pods -o name -l deployment=postgresql-persistent)" != "" ]
then
  APP="deployment/postgresql-persistent"
elif [ "$(oc get pods -o name -l deployment=postgresql-persistent2)" != "" ]
then
  APP="deployment/postgresql-persistent2"
else
  echo "ERROR: deployment/postgresql-persistent not found"
  echo "ERROR: deployment/postgresql-persistent2 not found"
fi

if [ -n "${APP}" ]
then
  if [[ "$(oc exec ${APP} -i redhat123 -t -- /usr/bin/psql -U redhat persistentdb -c '\d characters' 2>&1)" != *"exit code 1"* ]]
  then
    OUTPUT=$(oc exec ${APP} -i redhat123 -t -- /usr/bin/psql -U redhat persistentdb -c 'select id,name,nationality from characters' 2>&1)
  fi
fi

if [ -n "${OUTPUT}" ]
then
  echo "${OUTPUT}"
else
  echo "ERROR: 'characters' table does not exist"
fi
