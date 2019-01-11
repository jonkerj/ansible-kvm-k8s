#!/bin/sh

USER="admin-user"
TOKEN_NAME=$(kubectl get sa -n kube-system ${USER} -o json | jq -r .secrets[].name)
TOKEN=$(kubectl -n kube-system get secret -o json "${TOKEN_NAME}"| jq -r '.data["token"]' | base64 -d)

echo ${TOKEN}
