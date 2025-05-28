#!/bin/bash

# Create .kube directory if it doesn't exist
mkdir -p .kube

# Set up environment variable
export KUBECONFIG=.kube/tau-doom-de-fra1_kubeconfig.yaml

# Verify connection
kubectl cluster-info 