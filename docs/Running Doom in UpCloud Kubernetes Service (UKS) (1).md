# Running Doom in UpCloud Kubernetes Service (UKS)

## Overview
This document outlines the step-by-step process for running Doom in UpCloud Kubernetes Service (UKS). The approach uses KubeDoom, a project that allows you to play Doom while interacting with Kubernetes pods.

## Prerequisites
- UpCloud account with credits
- Basic to mid-level Kubernetes knowledge
- VNC Viewer installed locally

## Step 1: Set up UpCloud Kubernetes Service (UKS)
1. Log in to UpCloud Control Panel
2. Navigate to the Kubernetes section
3. Create a new Kubernetes cluster
   - Select appropriate region
   - Configure node size and count (minimum 1 node)
   - Set up network configuration
   - Review and create the cluster
4. Wait for cluster provisioning to complete
5. Download the kubeconfig file

## Step 2: Configure kubectl to use UKS cluster
1. Save the downloaded kubeconfig file to your local machine
2. Set the KUBECONFIG environment variable:
   ```bash
   export KUBECONFIG=/path/to/your/kubeconfig
   ```
3. Verify connection to the cluster:
   ```bash
   kubectl cluster-info
   kubectl get nodes
   ```

## Step 3: Deploy KubeDoom to UKS
1. Create the necessary Kubernetes resources:
   - Create namespace for KubeDoom
   - Set up RBAC permissions
   - Deploy the KubeDoom application

2. Apply the manifests:
   ```bash
   # Create namespace
   kubectl apply -f namespace.yaml
   
   # Apply RBAC configuration
   kubectl apply -f rbac.yaml
   
   # Deploy KubeDoom
   kubectl apply -f deployment.yaml
   
   # Alternative: Apply all at once using kustomization
   kubectl apply -k .
   ```

## Step 4: Access Doom via VNC
1. Set up port forwarding to access the VNC server:
   ```bash
   kubectl port-forward -n kubedoom deployment/kubedoom 5900:5900
   ```

2. Connect to the game using a VNC client:
   - Connect to `localhost:5900`
   - Use password: `idbehold`

## Step 5: Play Doom and Interact with Kubernetes
1. Basic controls:
   - Arrow keys: Move
   - Ctrl: Shoot
   - Space: Open doors
   - Esc: Pause game

2. Cheat codes:
   - `idspispopd`: Walk through walls
   - `idkfa`: Full weapons and ammo
   - `iddqd`: God mode

3. Understanding the game mechanics:
   - Each monster represents a pod in your Kubernetes cluster
   - Shooting a monster will delete the corresponding pod
   - New monsters will appear as pods are recreated

## Step 6: Clean Up
1. Stop the port-forwarding process
2. Remove KubeDoom from the cluster:
   ```bash
   kubectl delete -k .
   ```
3. Optionally, delete the UKS cluster if no longer needed

## Troubleshooting
- If VNC connection fails, verify port forwarding is active
- If pods don't appear as monsters, check RBAC permissions
- For performance issues, consider scaling up the UKS cluster

## Additional Notes
- KubeDoom uses the official image: `ghcr.io/storax/kubedoom:latest`
- The deployment can be customized to target specific namespaces
- For demonstration purposes, consider deploying sample applications to interact with
