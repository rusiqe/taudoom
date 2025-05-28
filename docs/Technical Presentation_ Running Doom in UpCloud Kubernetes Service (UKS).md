# Technical Presentation: Running Doom in UpCloud Kubernetes Service (UKS)

## Slide 1: Title Slide
**Title:** Yeah, but does it run Doom? Running Doom in UpCloud Kubernetes Service
**Subtitle:** A Technical Demonstration of KubeDoom
**Presenter:** Taurai Mutimutema (Tau)
**Date:** May 28, 2025

**Speaker Notes:**
Good afternoon everyone! Today I'll be demonstrating how to run the classic game Doom in UpCloud Kubernetes Service. This presentation will show you not just that UKS can run Doom, but how you can replicate this project yourself. It's a fun way to visualize and interact with Kubernetes resources.

## Slide 2: Overview
**Title:** Presentation Overview
**Content:**
- Project Introduction: KubeDoom
- Setting Up UpCloud Kubernetes Service
- Deploying Doom to Kubernetes
- Live Demo
- Challenges & Solutions
- Q&A

**Speaker Notes:**
In the next 10 minutes, I'll introduce you to KubeDoom, walk through setting up an UpCloud Kubernetes Service cluster, show you how to deploy Doom to that cluster, and give you a live demonstration. I'll also discuss some challenges I encountered and how I solved them. We'll have time for questions at the end.

## Slide 3: What is KubeDoom?
**Title:** What is KubeDoom?
**Content:**
- A visualization tool for Kubernetes resources
- Pods appear as monsters in the game
- Shooting a monster deletes the corresponding pod
- Based on the original Doom game from 1993
- Educational and entertaining way to interact with Kubernetes

**Speaker Notes:**
KubeDoom is a creative visualization tool that represents your Kubernetes pods as monsters in the classic Doom game. When you shoot a monster in the game, it actually deletes the corresponding pod in your Kubernetes cluster. It's based on the original Doom game from 1993 and provides an educational yet entertaining way to interact with your Kubernetes resources. It's a perfect example of how we can make DevOps more engaging.

## Slide 4: Setting Up UpCloud Kubernetes Service
**Title:** Setting Up UpCloud Kubernetes Service
**Content:**
- Log in to UpCloud Control Panel
- Navigate to Kubernetes section
- Create a new cluster with appropriate specifications
- Download kubeconfig file
- Configure kubectl to use the cluster

**Speaker Notes:**
Setting up a Kubernetes cluster in UpCloud is straightforward. After logging into the UpCloud Control Panel, navigate to the Kubernetes section and create a new cluster. For this demonstration, I used a single-node cluster, but you can scale according to your needs. Once the cluster is provisioned, download the kubeconfig file and configure kubectl to use it. This gives you command-line access to your cluster.

## Slide 5: Preparing the Deployment
**Title:** Preparing the Deployment
**Content:**
- Create namespace for isolation
- Set up service account and RBAC permissions
- Prepare deployment manifest
- Use kustomization for easy application

**Speaker Notes:**
Before deploying KubeDoom, we need to prepare several Kubernetes resources. First, we create a dedicated namespace for isolation. Then, we set up a service account with appropriate RBAC permissions - KubeDoom needs permissions to list and delete pods. Next, we prepare the deployment manifest that specifies the KubeDoom container image and configuration. Finally, we use kustomization to easily apply all these resources at once.

## Slide 6: Deployment Manifests
**Title:** Deployment Manifests
**Content:**
[Show code snippets of key manifest files]
- namespace.yaml
- rbac.yaml
- deployment.yaml
- kustomization.yaml

**Speaker Notes:**
Here are the key manifest files needed for deployment. The namespace.yaml creates a dedicated kubedoom namespace. The rbac.yaml grants necessary permissions to interact with pods. The deployment.yaml specifies the container image and configuration. And the kustomization.yaml ties everything together for easy deployment. These files are available in the GitHub repository, and I've included them in the resources I'll share after this presentation.

## Slide 7: Deploying KubeDoom
**Title:** Deploying KubeDoom
**Content:**
- Apply all resources with a single command:
  ```bash
  kubectl apply -k .
  ```
- Verify deployment:
  ```bash
  kubectl get pods -n kubedoom
  ```
- Set up port forwarding:
  ```bash
  kubectl port-forward -n kubedoom deployment/kubedoom 5900:5900
  ```

**Speaker Notes:**
Deploying KubeDoom is as simple as running 'kubectl apply -k .' in the directory containing our manifest files. This applies all the resources defined in our kustomization file. We can verify the deployment by checking for running pods in the kubedoom namespace. Once the pod is running, we set up port forwarding to access the VNC server that will display the Doom game interface. This maps port 5900 on our local machine to port 5900 in the pod.

## Slide 8: Accessing Doom
**Title:** Accessing Doom
**Content:**
- Connect using any VNC client
- Address: localhost:5900
- Password: idbehold
- Game controls:
  - Arrow keys: Move
  - Ctrl: Shoot
  - Space: Open doors
  - Esc: Pause

**Speaker Notes:**
With port forwarding set up, we can connect to the game using any VNC client. Connect to localhost:5900 using the password 'idbehold'. Once connected, you'll see the classic Doom interface. You can move around using the arrow keys, shoot with Ctrl, open doors with Space, and pause the game with Esc. There are also some useful cheat codes like 'idspispopd' to walk through walls, which helps you find pods faster.

## Slide 9: Live Demo
**Title:** Live Demo
**Content:**
[Screenshot of Doom running with Kubernetes pods as monsters]
- Create test deployments
- Watch pods appear as monsters
- Delete pods by shooting them
- Observe Kubernetes reconciliation

**Speaker Notes:**
Now for the fun part - the live demo! I've created some test deployments in my cluster, and you can see them appearing as monsters in the game. When I shoot this monster here, watch what happens to the corresponding pod in my cluster. [Demonstrate shooting and pod deletion] Notice how Kubernetes automatically creates a new pod to maintain the desired state, which appears as a new monster in the game. This is a great visualization of Kubernetes reconciliation in action.

## Slide 10: Challenges & Solutions
**Title:** Challenges & Solutions
**Content:**
- Challenge 1: Network connectivity issues
  - Solution: Use hostNetwork: true in deployment
- Challenge 2: Permission restrictions
  - Solution: Proper RBAC configuration
- Challenge 3: Resource limitations
  - Solution: Adjust resource requests/limits

**Speaker Notes:**
During this project, I encountered a few challenges. First, there were network connectivity issues between the pod and the Kubernetes API server, which I solved by setting hostNetwork to true in the deployment. Second, I ran into permission restrictions when trying to list and delete pods, which required proper RBAC configuration. Finally, on smaller clusters, resource limitations can be an issue, so adjusting resource requests and limits in the deployment manifest helps ensure smooth operation.

## Slide 11: Conclusion
**Title:** Conclusion
**Content:**
- KubeDoom provides a fun way to visualize Kubernetes resources
- UpCloud Kubernetes Service makes deployment simple
- Educational tool for understanding Kubernetes concepts
- Resources available at: [GitHub repository URL]

**Speaker Notes:**
In conclusion, KubeDoom provides a fun and engaging way to visualize and interact with Kubernetes resources. UpCloud Kubernetes Service makes deploying and managing Kubernetes applications straightforward, even unconventional ones like this. Beyond the entertainment value, this project serves as an educational tool for understanding Kubernetes concepts like pods, deployments, and reconciliation. All the resources I've used today are available in the GitHub repository linked here.

## Slide 12: Q&A
**Title:** Questions?
**Content:**
[Contact information or relevant links]

**Speaker Notes:**
Thank you for your attention! I'm now happy to answer any questions you might have about this project, UpCloud Kubernetes Service, or Kubernetes in general.
