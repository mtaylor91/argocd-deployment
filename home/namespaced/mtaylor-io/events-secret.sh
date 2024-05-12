#!/bin/sh
set -eu

kubectl create secret generic --dry-run=client --output=yaml events-mtaylor-io \
  --namespace=mtaylor-io \
  --from-literal=secret-key=$SECRET_KEY \
  --from-literal=postgres-password=$POSTGRES_PASSWORD \
  | kubeseal --scope namespace-wide
