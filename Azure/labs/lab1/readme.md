# Lab 1: Deploying NIC to AKS cluster

<br/>

## Introduction

In this section, you will ...
<br/>

## Learning Objectives
- one
- two 

## Install NGINX Plus Ingress Controller using Manifest files

1. Make sure your AKS cluster is running. If it is in stopped state then you can start it using below command
   ```bash
   MY_RESOURCEGROUP=s.dutta
   MY_AKS=aks-shouvik

   az aks start --resource-group $MY_RESOURCEGROUP --name $MY_AKS
   ```
   **Note**: The FQDN for API server for AKS might change on restart of the cluster which would result in errors running `kubectl` commands from your workstation. To update the FQDN re-import the credentials again using below command. This command would prompt about overwriting old objects. Enter "y" to overwrite the existing objects.
   ```bash
   az aks get-credentials --resource-group $MY_RESOURCEGROUP --name $MY_AKS
   ```
   ```bash
   ##Sample Output##
   A different object named aks-shouvik already exists in your kubeconfig file.
   Overwrite? (y/n): y
   A different object named clusterUser_s.dutta_aks-shouvik already exists in your kubeconfig file.
   Overwrite? (y/n): y
   Merged "aks-shouvik" as current context in /Users/shodutta/.kube/config
   ```

1. Clone the Ingress Controller repo and navigate into the deployments folder to make it your working directory:
   ```bash
   git clone https://github.com/nginxinc/kubernetes-ingress.git --branch v3.2.1
   cd kubernetes-ingress/deployments
   ```

1. Create a namespace and a service account for the Ingress Controller
    ```bash
    kubectl apply -f common/ns-and-sa.yaml
    ```
1. Create a cluster role and cluster role binding for the service account
    ```bash
    kubectl apply -f rbac/rbac.yaml
    ```

1. Create Common Resources:
     1. Create a secret with TLS certificate and a key for the default server in NGINX.
        ```bash
        cd ..
        kubectl apply -f examples/shared-examples/default-server-secret/default-server-secret.yaml
        cd deployments
        ```
     1. Create a config map for customizing NGINX configuration.
        ```bash
        kubectl apply -f common/nginx-config.yaml
        ```
     1. Create an IngressClass resource. (**Note:** If you would like to set the NGINX Ingress Controller as the default one, uncomment the annotation `ingressclass.kubernetes.io/is-default-class` within the below file)
        ```bash
        kubectl apply -f common/ingress-class.yaml
        ```

1. Create Custom Resources
    1. Create custom resource definitions for VirtualServer and VirtualServerRoute, TransportServer and Policy resources:
        ```bash
        kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml
        kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml
        kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml
        kubectl apply -f common/crds/k8s.nginx.org_policies.yaml
        ```
   
    1. Create a custom resource for GlobalConfiguration resource:
        ```bash
        kubectl apply -f common/crds/k8s.nginx.org_globalconfigurations.yaml
        ```
1. Deploy the Ingress Controller as a Deployment:

   The sample deployment file(`nginx-plus-ingress.yaml`) can be found within `deployment` sub-directory within your present working directory.

   Highlighted below are some of the parameters that would be changed in the sample `nginx-plus-ingress.yaml` file.
   - Change Image Pull to Private Repo
   - Enable Prometheus
   - Add port and name for dashboard
   - Change Dashboard Port to 9000
   - Allow all IPs to access dashboard
   
   <br/>

   Navigate to Azure/labs directory 
    ```bash
    cd ../../Azure/labs
    ```
  
    Observe the `lab1/nginx-plus-ingress.yaml` looking at below details:
     - On line #36, we have replaced the `nginx-plus-ingress:3.2.1` placeholder with a workshop image that we pushed in the private ACR registry.
     - On lines #50-51, we have added TCP port 9000 for the Plus Dashboard.
     - On lines #96-97, we have enabled the Dashboard and set the IP access controls to the Dashboard.
     - On line #106, we have enabled Prometheus to collect metrics from the NginxPlus stats API.
     - On lines #16-19, we have enabled Prometheus related annotations.

    <br/>

    Now deploy NGINX Plus Ingress Controller as a Deployment using the updated manifest file.
    ```bash
    kubectl apply -f lab1/nginx-plus-ingress.yaml
    ```

## Check your Ingress Controller

1. Verify the NGINX Plus Ingress controller is up and running correctly in the Kubernetes cluster:

   ```bash
   kubectl get pods -n nginx-ingress
   ```

   ```bash
   # Should look similar to this...
   NAME                            READY   STATUS    RESTARTS   AGE
   nginx-ingress-5764ddfd78-ldqcs   1/1     Running   0          17s
   ```

   **Note**: You must use the `kubectl` "`-n`", namespace switch, followed by namespace name, to see pods that are not in the default namespace.

2. Instead of remembering the unique pod name, `nginx-ingress-xxxxxx-yyyyy`, we can store the Ingress Controller pod name into the `$NIC` variable to be used throughout the lab.

   **Note:** This variable is stored for the duration of the terminal session, and so if you close the terminal it will be lost. At any time you can refer back to this step to save the `$NIC` variable again.

   ```bash
   export NIC=$(kubectl get pods -n nginx-ingress -o jsonpath='{.items[0].metadata.name}')
   ```

   Verify the variable is set correctly.
   ```bash
   echo $NIC
   ```
   **Note:** If this command doesn't show the name of the pod then run the previous command again.


**This completes the Lab.** 
<br/>

## References: 

-sdlafj
<br/>

### Authors
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.
- Jason Williams - Principle Product Management Engineer @ F5, Inc.

-------------

Navigate to ([Lab1](../lab1/readme.md) | [Main Menu](../LabGuide.md))
