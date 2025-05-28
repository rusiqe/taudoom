# Lab Guide: Running Doom in UpCloud Kubernetes Service (UKS)

This guide will walk you through the process of deploying and running Doom in your UpCloud Kubernetes Service (UKS) cluster. All necessary manifest files have been prepared for you.

## Prerequisites
- UpCloud account with credits
- UKS cluster created and running
- kubectl configured to access your UKS cluster
- VNC Viewer installed on your local machine

## Step 1: Verify UKS Cluster Access

First, ensure you have access to your UKS cluster:

```bash
kubectl cluster-info
kubectl get nodes
```

You should see information about your cluster and a list of available nodes.

## Step 2: Deploy KubeDoom

1. Navigate to the manifest files directory:
```bash
cd /home/ubuntu/upcloud_presentations/technical_task/manifest_files
```

2. Apply all the Kubernetes resources using kustomization:
```bash
kubectl apply -k .
```

3. Verify the deployment:
```bash
kubectl get pods -n kubedoom
```

You should see the kubedoom pod running. Wait until the status shows "Running".

## Step 3: Access Doom via VNC

1. Set up port forwarding to access the VNC server:
```bash
kubectl port-forward -n kubedoom deployment/kubedoom 5900:5900
```

2. Open your VNC Viewer and connect to:
   - Address: `localhost:5900`
   - Password: `idbehold`

## Step 4: Play Doom and Interact with Kubernetes

Once connected via VNC, you'll see the Doom game interface.

1. Basic controls:
   - Arrow keys: Move
   - Ctrl: Shoot
   - Space: Open doors
   - Esc: Pause game

2. Useful cheat codes:
   - `idspispopd`: Walk through walls (helpful to quickly find pods)
   - `idkfa`: Full weapons and ammo
   - `iddqd`: God mode

3. Each monster in the game represents a pod in your Kubernetes cluster. Shooting a monster will delete the corresponding pod.

4. For demonstration purposes, you might want to create some test deployments:
```bash
# Create a test deployment with multiple replicas
kubectl create deployment test-nginx --image=nginx --replicas=5
```

## Step 5: Capture Screenshots for Presentation

Take screenshots at various stages to include in your presentation:
1. The Doom game interface showing pods as monsters
2. The process of "shooting" a pod
3. The kubectl command output showing the pod being deleted

## Step 6: Clean Up

When you're finished:

1. Stop the port-forwarding process (Ctrl+C)
2. Remove KubeDoom from the cluster:
```bash
kubectl delete -k .
```
3. Delete any test deployments:
```bash
kubectl delete deployment test-nginx
```

## Troubleshooting

- If VNC connection fails, verify port forwarding is active
- If pods don't appear as monsters, check RBAC permissions
- For performance issues, consider scaling up the UKS cluster