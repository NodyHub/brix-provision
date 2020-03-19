#!/bin/bash

# Bootstrab K8s
sudo kubeadm init --pod-network-cidr=10.10.0.0/16 --apiserver-cert-extra-sans=k8sm1.home

# Apply Network Overlay
kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml

# local-path-storage with auto provisioning of pv on GlusterFS
kubectl create -f https://raw.githubusercontent.com/NodyHub/local-path-provisioner/master/deploy/local-path-storage.yaml

exit 0
