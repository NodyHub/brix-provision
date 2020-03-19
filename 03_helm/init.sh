#!/bin/bash

# install helm on deployer and add repo
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update

# Install SW loadbalancer MetalLB
kubectl create ns metallb
helm install metallb stable/metallb --values metallb-values.yaml --namespace metallb

# Install ingress controller Traefik
kubectl create ns traefik
helm install traefik stable/traefik --values traefik-values.yaml --namespace traefik

# Install default registry within the cluster
kubectl create ns registry
helm install registry ./registry --namespace registry

exit 0
