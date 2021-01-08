#!/usr/bin/bash

if oc get project -o jsonpath='{.items[*].metadata.name}' | grep -q network-policy-demo
then
  echo "==================================================================="
  echo "PROJECT: network-policy-demo"
  echo
  oc get pods -o custom-columns="POD NAME:.metadata.name,IP ADDRESS:.status.podIP" -n network-policy-demo
  echo
  oc get svc -o custom-columns="SERVICE NAME:.metadata.name,CLUSTER-IP:.spec.clusterIP" -n network-policy-demo
  echo
  oc get route -o custom-columns="ROUTE NAME:.metadata.name,HOSTNAME:.spec.host,PORT:.spec.port.targetPort" -n network-policy-demo
  echo
  echo "==================================================================="
fi

if oc get project -o jsonpath='{.items[*].metadata.name}' | grep -q network-test-demo
then
  echo "PROJECT: network-test-demo"
  echo
  oc get pods -o custom-columns="POD NAME:.metadata.name" -n network-test-demo
  echo
  echo "==================================================================="
fi
